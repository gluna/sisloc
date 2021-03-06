package sisloc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import sisloc.dao.ClienteDao;
import sisloc.dao.EquipamentoDao;
import sisloc.dao.OrcamentoDao;
import sisloc.dao.TipoEquipamentoDao;
import sisloc.modelo.Cliente;
import sisloc.modelo.Equipamento;
import sisloc.modelo.Orcamento;
import sisloc.modelo.TipoEquipamento;
import sisloc.util.SislocUtils;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;


@Resource
public class OrcamentosController {

	private OrcamentoDao dao;
	private Result result;
	private ServletContext context;
	private ClienteDao clientedao;
	private EquipamentoDao equipamentodao;
	private TipoEquipamentoDao tipoequipamentodao;
	private HttpServletResponse response;
	
	public OrcamentosController(OrcamentoDao dao, Result result,final ServletContext context, 
			ClienteDao clientedao, HttpServletResponse response, EquipamentoDao equipamentodao, TipoEquipamentoDao tipoequipamentodao){
		this.dao = dao;
		this.result = result;
		this.context = context;
		this.clientedao = clientedao;
		this.response = response;
		this.equipamentodao = equipamentodao;
		this.tipoequipamentodao = tipoequipamentodao;
	}
	
	@Path("/orcamentos/cadastrar")
	public List<Equipamento> cadastrar(){
		List<Equipamento> t = equipamentodao.listaTodos();
		return t;
	}
	
	@Post
	@Path("/orcamentos/salvar")
	public void salvar(Orcamento orcamento){
		/*try {
		     if(orcamento != null) {
		    	 for(OrcamentoDetalhe od : orcamento.getOrcamentodetalhe() ){
		    		 od.setProduto(produtodao.selectById(od.getProduto()));
		    	 }

		    	 if(orcamento.getId() == null) {
		    		 dao.salvar(orcamento);
		    	 } else {
		    		 dao.atualizar(orcamento);
	             }
	          }
		     result.include("orcamento", orcamento);
		     result.redirectTo(this.getClass()).cadastrar();
		} catch (Exception e) {
			result.include("msg", e.getMessage());
		}*/
	}
	
	@Path("/orcamentos/editar/{orcamento.id}")
	public void editar(Orcamento orcamento){
		/*orcamento = dao.selectById(orcamento);
	    if(orcamento != null) {
	         result.include("orcamento", orcamento);
	    }
	    result.redirectTo(this.getClass()).cadastrar();*/
	}
	
	@Path("/orcamentos/visualizar/{orcamento.id}")
	public void visualizar(Orcamento orcamento){
		/*orcamento = dao.selectById(orcamento);
	    if(orcamento != null) {
	         result.include("orcamento", orcamento);
	    }
	    //result.redirectTo(this.getClass()).cadastrar();*/
	}
	
	@Path("/orcamentos/excluir/{orcamento.id}")
	public void excluir(Orcamento orcamento){
		/*orcamento = dao.selectById(orcamento);
	    dao.excluir(orcamento);
	    //result.redirectTo(this.getClass()).consultar();*/	
	}
	
	@Path("/orcamentos/consultar")
	public List<Orcamento> consultar(){
		List<Orcamento> t = dao.listaTodos();
		return t;
	}
	
	@Path("/orcamentos/getclientes")
	public void getclientes(){
		List<Cliente> clientes =  clientedao.listaTodos();
		result.use(Results.json()).withoutRoot().from(clientes).serialize();  
	}
	
	@Path({"/orcamentos/report/{orcamento.id}", "/orcamentos/report/"}) 
	public void pdfReport(Orcamento orcamento) {
		if(orcamento != null) {
			try{
				orcamento = dao.selectById(orcamento);
				Map<String, Object> parametros = new HashMap<String, Object>();
				parametros.put( "ORCAMENTO_ID", orcamento.getId() );
				parametros.put("PATH", context.getRealPath("/images/"));
				
				
				JasperPrint print = JasperFillManager.fillReport(context.getRealPath("/WEB-INF/classes/sisloc/report/template/orcamentoreport.jasper"), parametros, SislocUtils.getConnection());

				//visualiza o rel apenas no servidor
				//JasperViewer.viewReport(print,false);
				
				//envia um pdf para o cliente
		        JasperExportManager.exportReportToPdfStream(print, response.getOutputStream());  
		            
							
			}catch(Exception e){e.printStackTrace();}
			
		}
		result.include("orcamento", orcamento); 
    	result.permanentlyRedirectTo(this.getClass()).cadastrar();
	}
	
	@Path("/orcamentos/getprecos/{tipoequipamento.id}")
	public void getprecos(Long p){
		TipoEquipamento te = new TipoEquipamento();
		te.setId(p);
		te = tipoequipamentodao.selectById(te);
		result.use(Results.json()).withoutRoot().from(te).serialize();  
	}
	
	@Path("/orcamentos/consultaorcamento")
	public List<Orcamento> consultaorcamento(Orcamento orcamento){
		List<Orcamento> t = dao.consultaorcamento(orcamento);
		return t;
	}
	
}
