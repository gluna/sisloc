package sisloc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.view.JasperViewer;
import sisloc.dao.LocacaoDao;
import sisloc.dao.ProdutoDao;
import sisloc.modelo.Locacao;
import sisloc.modelo.LocacaoDetalhe;
import sisloc.modelo.Preco;
import sisloc.modelo.Produto;
import sisloc.util.SislocUtils;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;

@Resource
public class LocacoesController {
	
	private LocacaoDao dao;
	private Result result;
	private ProdutoDao produtodao;
	private ServletContext context;
	
	public LocacoesController(LocacaoDao dao, Result result, ProdutoDao produtodao,ServletContext context){
		this.dao = dao;
		this.result = result;
		this.produtodao = produtodao;
		this.context = context;
	}
	
	@Path("/locacoes/cadastrar")
	public List<Produto> cadastrar(){
		List<Produto> t = produtodao.listaTodos();
		return t;
	}
	
	@Post
	@Path("/locacoes/salvar")
	public void salvar(Locacao locacao){
		try {
		     if(locacao != null) {
		    	 for(LocacaoDetalhe ld : locacao.getLocacaodetalhe() ){
		    		 ld.setProduto(produtodao.selectById(ld.getProduto()));
		    	 }
		    	 if(locacao.getId() == null) {
		    		 dao.salvar(locacao);
		    	 } else {
		    		 dao.atualizar(locacao);
	             }
	          }
		     result.include("locacao", locacao);
		     result.redirectTo(this.getClass()).cadastrar();
		} catch (Exception e) {
			result.include("msg", e.getMessage());
		}
	}
	
	@Path("/locacoes/editar/{locacao.id}")
	public void editar(Locacao locacao){
		locacao = dao.selectById(locacao);
	    if(locacao != null) {
	         result.include("locacao", locacao);
	    }
	    result.redirectTo(this.getClass()).cadastrar();
	}
	
	@Path("/locacoes/excluir/{locacao.id}")
	public void excluir(Locacao locacao){
		locacao = dao.selectById(locacao);
	    dao.excluir(locacao);
	    //result.redirectTo(this.getClass()).consultar();	
	}
	
	@Path("/clientes/consultar")
	public List<Locacao> consultar(){
		List<Locacao> t = dao.listaTodos();
		return t;
	}
	
	@Path("/locacoes/getprecos/{produto.id}")
	public void getprecos(Long p){
		Produto prod = new Produto();
		prod.setId(p);
		List<Preco> precos = produtodao.selectById(prod).getPrecos();
		result.use(Results.json()).withoutRoot().from(precos).serialize();  
	}
	
	@Path({"/locacoes/report/{locacao.id}", "/locacoes/report/"}) 
	public void pdfReport(Locacao locacao) {
		if(locacao != null) {
			try{
				locacao = dao.selectById(locacao);
				Map<String, Object> parametros = new HashMap<String, Object>();
				parametros.put( "LOCACAO_ID", locacao.getId() );
				 
				//JOptionPane.showMessageDialog(null, context.getRealPath("/sisloc/report/template/orcamentoreport.jasper"));
				JasperPrint print = JasperFillManager.fillReport(context.getRealPath("/WEB-INF/classes/sisloc/report/template/locacaoreport.jasper"), parametros, SislocUtils.getConnection());
				//JasperExportManager.exportReportToPdfFile(print,"/home/gustavo/report-out.pdf");
				JasperViewer.viewReport(print,false);
				result.include("locacao", locacao);
				
				/*List<Orcamento> orcamentos = new ArrayList<Orcamento>();
				orcamentos.add(orcamento);
				Report<Orcamento> report = new OrcamentoReport(orcamentos);*/
			}catch(Exception e){e.printStackTrace();}
			//return null; //new ReportDownload(report, Pdf());
			
		}
    	result.permanentlyRedirectTo(this.getClass()).cadastrar();
	}
	
	@Path("/locacoes/consultalocacao")
	public List<Locacao> consultalocacao(Locacao locacao){
		List<Locacao> t = dao.consultalocacao(locacao);
		return t;
	}
	
	
}
