package sisloc.controller;

import sisloc.dao.EmpresaDao;
import sisloc.modelo.Empresa;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class EmpresaController {
	
	private EmpresaDao dao;
	private Result result;
	
	public EmpresaController(EmpresaDao dao, Result result){
		this.dao = dao;
		this.result = result;
	}
	
	@Path("/empresa/cadastrar")
	public void cadastrar(){
	}
	
	@Post
	@Path("/empresa/salvar")
	public void salvar(Empresa empresa){
		try {
		     if(empresa != null) {
		    	 if(empresa.getId() == null) {
		    		 dao.salvar(empresa);
		    	 } else {
		    		 dao.atualizar(empresa);
	             }
	          }
		     result.include("empresa", empresa);
		     result.redirectTo(this.getClass()).cadastrar();
		} catch (Exception e) {
			result.include("msg", e.getMessage());
		}
	}
	
	@Path("/empresa/editar/{empresa.id}")
	public void editar(Empresa empresa){
		empresa = dao.selectById(empresa);
	    if(empresa != null) {
	         result.include("empresa", empresa);
	    }
	    result.redirectTo(this.getClass()).cadastrar();
	}

}
