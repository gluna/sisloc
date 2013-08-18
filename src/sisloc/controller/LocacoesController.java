package sisloc.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import sisloc.dao.ClienteDao;
import sisloc.dao.LocacaoDao;
import sisloc.dao.OrcamentoDao;
import sisloc.dao.ProdutoDao;
import sisloc.modelo.Cliente;
import sisloc.modelo.DevolucaoLocacao;
import sisloc.modelo.Locacao;
import sisloc.modelo.LocacaoDetalhe;
import sisloc.modelo.Orcamento;
import sisloc.modelo.OrcamentoDetalhe;
import sisloc.modelo.Pagamento;
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
	private ClienteDao clientedao;
	private OrcamentoDao orcamentodao;
	private HttpServletResponse response;
	
	public LocacoesController(LocacaoDao dao, Result result, ProdutoDao produtodao,ServletContext context, 
			ClienteDao clientedao,OrcamentoDao orcamentodao, HttpServletResponse response){
		this.dao = dao;
		this.result = result;
		this.produtodao = produtodao;
		this.context = context;
		this.clientedao = clientedao;
		this.orcamentodao = orcamentodao;
		this.response = response;
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
		    	 if(locacao.getPagamentos() != null){
			    	 for(Pagamento p : locacao.getPagamentos()){
			    		 p.setTipo("E");
			    		 p.setDescricao("Pagamento Locação");
			    	 }
		    	 }
		    	 locacao.setCliente(clientedao.selectById(locacao.getCliente()));
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

	@Post
	@Path("/locacoes/salvardevolucao")
	public void salvardevolucao(Locacao locacao){
		try {
		     if(locacao != null) {
		    	 for(DevolucaoLocacao dl : locacao.getDevolucaolocacao() ){
		    		 dl.setProduto(produtodao.selectById(dl.getProduto()));
		    		 dl.setDtdevolucao(new Date());
		    	 }
		    	 if(locacao.getId() == null) {
		    		 dao.salvar(locacao);
		    	 } else {
		    		 dao.atualizar(locacao);
	             }
	          }
		     result.include("locacao", locacao);
		     result.redirectTo(this.getClass()).devolucao(locacao);
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
	
	@Path("/locacoes/visualizar/{locacao.id}")
	public void visualizar(Locacao locacao){
		locacao = dao.selectById(locacao);
	    if(locacao != null) {
	         result.include("locacao", locacao);
	    }
	    //result.redirectTo(this.getClass()).cadastrar();
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
	
	@Path("/locacoes/getclientes")
	public void getclientes(){
		List<Cliente> clientes =  clientedao.listaTodos();
		result.use(Results.json()).withoutRoot().from(clientes).serialize();  
	}
	
	@Path({"/locacoes/report/{locacao.id}", "/locacoes/report/"}) 
	public void pdfReport(Locacao locacao) {
		if(locacao != null) {
			try{
				locacao = dao.selectById(locacao);
				Map<String, Object> parametros = new HashMap<String, Object>();
				parametros.put( "LOCACAO_ID", locacao.getId() );
				 
				JasperPrint print = JasperFillManager.fillReport(context.getRealPath("/WEB-INF/classes/sisloc/report/template/locacaoreport.jasper"), parametros, SislocUtils.getConnection());
				//visualiza o rel apenas no servidor
				//JasperViewer.viewReport(print,false);
				
				//envia um pdf para o cliente
		        JasperExportManager.exportReportToPdfStream(print, response.getOutputStream());  
		        
			}catch(Exception e){e.printStackTrace();}
			
		}
		result.include("locacao", locacao);
    	result.permanentlyRedirectTo(this.getClass()).cadastrar();
	}
	
	@Path("/locacoes/consultalocacao")
	public List<Locacao> consultalocacao(Locacao locacao){
		List<Locacao> t = dao.consultalocacao(locacao);
		return t;
	}
	
	@Path("/locacoes/importarorcamento/{locacao.id}")
	public void importarorcamento(Locacao locacao){
		Orcamento orcamento = new Orcamento();
		orcamento.setId(locacao.getId());
		orcamento = orcamentodao.selectById(orcamento);
		locacao = new Locacao();
		locacao.setDtinicio(orcamento.getInicio());
		locacao.setDtfim(orcamento.getFim());
		locacao.setObs(orcamento.getObs());
		locacao.setFrete(orcamento.getFrete());
		List<LocacaoDetalhe> detalhes = new ArrayList<LocacaoDetalhe>();
		for(OrcamentoDetalhe det : orcamento.getOrcamentodetalhe()){
			LocacaoDetalhe locdet = new LocacaoDetalhe();
			locdet.setPreco(det.getPreco());
			locdet.setProduto(det.getProduto());
			locdet.setQuantidade(det.getQuantidade());
			detalhes.add(locdet);
		}
		locacao.setLocacaodetalhe(detalhes);
		result.include("locacao", locacao);
		result.redirectTo(this.getClass()).cadastrar();
		
	}
	
	@Path("/locacoes/devolucao/{locacao.id}")
	public void devolucao(Locacao locacao){
		locacao = dao.selectById(locacao);
		result.include("locacao", locacao);
	}
	
	/*@Path({"/pagamentos/reportlocacoes/{locacao.id}", "/pagamentos/reportlocacoes/"}) 
	public void reportlocacoes(Date inicio, Date fim) {
		if(locacao != null) {
			try{
				locacao = dao.selectById(locacao);
				Map<String, Object> parametros = new HashMap<String, Object>();
				parametros.put( "LOCACAO_ID", locacao.getId() );
				 
				JasperPrint print = JasperFillManager.fillReport(context.getRealPath("/WEB-INF/classes/sisloc/report/template/locacaoreport.jasper"), parametros, SislocUtils.getConnection());
				//visualiza o rel apenas no servidor
				//JasperViewer.viewReport(print,false);
				
				//envia um pdf para o cliente
		        JasperExportManager.exportReportToPdfStream(print, response.getOutputStream());  
		        
			}catch(Exception e){e.printStackTrace();}
			
		}
		result.include("locacao", locacao);
    	result.permanentlyRedirectTo(this.getClass()).cadastrar();
	}*/
	
}
