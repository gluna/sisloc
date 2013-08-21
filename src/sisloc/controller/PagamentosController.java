package sisloc.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.view.JasperViewer;
import sisloc.dao.LocacaoDao;
import sisloc.dao.PagamentoDao;
import sisloc.modelo.Locacao;
import sisloc.modelo.Pagamento;
import sisloc.util.SislocUtils;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class PagamentosController {

	private PagamentoDao dao;
	private Result result;
	private LocacaoDao locacaodao;
	private ServletContext context;
	private HttpServletResponse response;
	
	public PagamentosController(PagamentoDao dao, Result result, LocacaoDao locacaodao, ServletContext context, HttpServletResponse response){
		this.dao = dao;
		this.result = result;
		this.locacaodao = locacaodao;
		this.context = context;
		this.response = response;
	}
	
	@Path("/pagamentos/cadastrar")
	public void cadastrar(){
	}
	
	@Post
	@Path("/pagamentos/salvar")
	public void salvar(Locacao locacao){
		try {
		     if(locacao != null) {
		    	 for(Pagamento p : locacao.getPagamentos()){
		    		 
			    	 if(p.getId() == null) {
			    		 dao.salvar(p);
			    	 } else {
			    		 dao.atualizar(p);
		             }
		    	 }
	          }
		     result.redirectTo(this.getClass()).cadastrar();
		} catch (Exception e) {
			result.include("msg", e.getMessage());
		}
	}
	
	@Post
	@Path("/pagamentos/salvarcontasapagar")
	public void salvar(Pagamento pagamento){
		try {
		     if(pagamento != null) {	
		    	 	pagamento.setTipo("S");
			    	 if(pagamento.getId() == null) {
			    		 dao.salvar(pagamento);
			    	 } else {
			    		 dao.atualizar(pagamento);
		             }
	          }
		     result.redirectTo(this.getClass()).cadastrarcontasapagar();
		} catch (Exception e) {
			result.include("msg", e.getMessage());
		}
	}
	
	@Path("/pagamentos/cadastrarcontasapagar")
	public void cadastrarcontasapagar(){
		
	}
	
	@Path("/pagamentos/editar/{locacao.id}")
	public void editar(Locacao locacao){
		locacao = locacaodao.selectById(locacao);
	    if(locacao != null) {
	         result.include("locacao", locacao);
	    }
	    result.redirectTo(this.getClass()).cadastrar();
	}
	
	@Path("/pagamentos/consultalocacao")
	public List<Locacao> consultalocacao(Locacao locacao){
		List<Locacao> t = locacaodao.consultalocacao(locacao);
		return t;
	}
	
	@Path({"/pagamentos/report/{inicio}/{fim}", "/pagamentos/report"}) 
	public void pdfReport(Date inicio, Date fim) {
		try{
			//List<Pagamento> pagamentos = dao. selectById(locacao);
			Map<String, Object> parametros = new HashMap<String, Object>();
			parametros.put( "DT_INICIO", inicio );
			parametros.put( "DT_FIM", fim );
			 
			JasperPrint print = JasperFillManager.fillReport(context.getRealPath("/WEB-INF/classes/sisloc/report/template/entradasaidareport.jasper"), parametros, SislocUtils.getConnection());
			//visualiza o rel apenas no servidor
			JasperViewer.viewReport(print,false);
			
			//envia um pdf para o cliente
	        //JasperExportManager.exportReportToPdfStream(print, response.getOutputStream());  
	        
		}catch(Exception e){e.printStackTrace();}
			
		//result.include("locacao", locacao);
    	result.permanentlyRedirectTo(this.getClass()).cadastrar();
	}
	
	@Path("/pagamentos/entradasaidareport")
	public void entradasaidareport(){
		
	}

}

