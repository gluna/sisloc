package sisloc.controller;

import sisloc.dao.EntradaPecasDao;
import sisloc.modelo.EntradaPecas;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class EntradaPecasController {
	
	private EntradaPecasDao dao;
	private Result result;
	
	public EntradaPecasController(EntradaPecasDao dao, Result result){
		this.dao = dao;
		this.result = result;
	}
	
	@Path("/entradapecas/cadastrar")
	public void cadastrar(){
	}
	
	@Post
	@Path("/entradapecas/salvar")
	public void salvar(EntradaPecas entradaPecas){
		try {
		     if(entradaPecas != null) {
		    	 if(entradaPecas.getId() == null) {
		    		 dao.salvar(entradaPecas);
		    	 } else {
		    		 dao.atualizar(entradaPecas);
	             }
	          }
		     result.redirectTo(this.getClass()).cadastrar();
		} catch (Exception e) {
			result.include("msg", e.getMessage());
		}
	}
	
	@Path("/entradapecas/editar/{entradapecas.id}")
	public void editar(EntradaPecas entradaPecas){
		entradaPecas = dao.selectById(entradaPecas);
	    if(entradaPecas != null) {
	         result.include("entradapecas", entradaPecas);
	    }
	    result.redirectTo(this.getClass()).cadastrar();
	}
	
	@Path("/entradapecas/visualizar/{entradapecas.id}")
	public void visualizar(EntradaPecas entradaPecas){
		entradaPecas = dao.selectById(entradaPecas);
	    if(entradaPecas != null) {
	         result.include("entradapecas", entradaPecas);
	    }
	    //result.redirectTo(this.getClass()).visualizar();
	}
	
	@Path("/entradapecas/excluir/{entradapecas.id}")
	public void excluir(EntradaPecas entradaPecas){
		entradaPecas = dao.selectById(entradaPecas);
	    dao.excluir(entradaPecas);
	    //result.redirectTo(this.getClass()).consultar();	
	}
	

}
