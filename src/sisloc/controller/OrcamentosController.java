package sisloc.controller;

import static br.com.caelum.vraptor.jasperreports.formats.Formats.Pdf;

import java.util.ArrayList;
import java.util.List;

import sisloc.dao.OrcamentoDao;
import sisloc.modelo.Orcamento;
import sisloc.report.OrcamentoReport;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.download.Download;
import br.com.caelum.vraptor.jasperreports.Report;
import br.com.caelum.vraptor.jasperreports.ReportDownload;

@Resource
public class OrcamentosController {

	private OrcamentoDao dao;
	private Result result;
	
	public OrcamentosController(OrcamentoDao dao, Result result){
		this.dao = dao;
		this.result = result;
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
	
	@Path("/orcamentos/pdf") 
	public Download pdfReport(Orcamento orcamento) {
		orcamento = dao.selectById(orcamento);
		List<Orcamento> orcamentos = new ArrayList<Orcamento>();
		orcamentos.add(orcamento);
		Report<Orcamento> report = new OrcamentoReport(orcamentos);
		return new ReportDownload(report, Pdf());
	}
	
}
