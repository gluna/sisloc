package sisloc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.view.JasperViewer;
import sisloc.dao.OrcamentoDao;
import sisloc.modelo.Orcamento;
import sisloc.util.SislocUtils;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;


@Resource
public class OrcamentosController {

	private OrcamentoDao dao;
	private Result result;
	private ServletContext context;
	
	public OrcamentosController(OrcamentoDao dao, Result result,final ServletContext context){
		this.dao = dao;
		this.result = result;
		this.context = context;
	}
	
	@Path("/orcamentos/cadastrar")
	public void cadastrar(){
	}
	
	@Post
	@Path("/orcamentos/salvar")
	public void salvar(Orcamento orcamento){
		try {
		     if(orcamento != null) {
		    	 if(orcamento.getId() == null) {
		    		 dao.salvar(orcamento);
		    	 } else {
		    		 dao.atualizar(orcamento);
	             }
	          }
		     result.redirectTo(this.getClass()).cadastrar();
		} catch (Exception e) {
			result.include("msg", e.getMessage());
		}
	}
	
	@Path("/orcamentos/editar/{orcamento.id}")
	public void editar(Orcamento orcamento){
		orcamento = dao.selectById(orcamento);
	    if(orcamento != null) {
	         result.include("orcamento", orcamento);
	    }
	    result.redirectTo(this.getClass()).cadastrar();
	}
	
	@Path("/orcamentos/excluir/{orcamento.id}")
	public void excluir(Orcamento orcamento){
		orcamento = dao.selectById(orcamento);
	    dao.excluir(orcamento);
	    //result.redirectTo(this.getClass()).consultar();	
	}
	
	@Path("/orcamentos/consultar")
	public List<Orcamento> consultar(){
		List<Orcamento> t = dao.listaTodos();
		return t;
	}
	
	@Path("/orcamentos/report/{orcamento.id}") 
	public void pdfReport(Orcamento orcamento) {
		try{
			orcamento = dao.selectById(orcamento);
			Map<String, Object> parametros = new HashMap<String, Object>();
			parametros.put( "ORCAMENTO_ID", (long) 1 );
			 
			//JOptionPane.showMessageDialog(null, context.getRealPath("/sisloc/report/template/orcamentoreport.jasper"));
			JasperPrint print = JasperFillManager.fillReport(context.getRealPath("/WEB-INF/classes/sisloc/report/template/orcamentoreport.jasper"), parametros, SislocUtils.getConnection());
			//JasperExportManager.exportReportToPdfFile(print,"/home/gustavo/report-out.pdf");
			JasperViewer.viewReport(print,false);
			
			/*List<Orcamento> orcamentos = new ArrayList<Orcamento>();
			orcamentos.add(orcamento);
			Report<Orcamento> report = new OrcamentoReport(orcamentos);*/
		}catch(Exception e){e.printStackTrace();}
		//return null; //new ReportDownload(report, Pdf()); 
		result.redirectTo(this.getClass()).cadastrar();
	}
	
}
