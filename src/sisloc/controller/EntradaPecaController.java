package sisloc.controller;

import sisloc.dao.EntradaPecaDao;
import sisloc.dao.FornecedorDao;
import sisloc.modelo.EntradaPeca;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class EntradaPecaController {
	
	private EntradaPecaDao dao;
	private FornecedorDao fornecedordao;
	private Result result;
	
	public EntradaPecaController(EntradaPecaDao dao, Result result, FornecedorDao fornecedordao){
		this.dao = dao;
		this.fornecedordao = fornecedordao;
		this.result = result;
	}
	
	@Path("/entradapeca/cadastrar")
	public void cadastrar(){
		result.include("fornecedorList", fornecedordao.listaTodos());
	}
	
	@Post
	@Path("/entradapeca/salvar")
	public void salvar(EntradaPeca entradaPeca){
		try {
		     if(entradaPeca!= null) {
		    	 if(entradaPeca.getId() == null) {
		    		 dao.salvar(entradaPeca);
		    	 } else {
		    		 dao.atualizar(entradaPeca);
	             }
	          }
		     result.redirectTo(this.getClass()).cadastrar();
		} catch (Exception e) {
			result.include("msg", e.getMessage());
		}
	}
	
	@Path("/entradapeca/editar/{entradapeca.id}")
	public void editar(EntradaPeca entradaPeca){
		entradaPeca = dao.selectById(entradaPeca);
	    if(entradaPeca != null) {
	         result.include("entradapeca", entradaPeca);
	    }
	    result.redirectTo(this.getClass()).cadastrar();
	}
	
	@Path("/entradapeca/visualizar/{entradapecas.id}")
	public void visualizar(EntradaPeca entradaPeca){
		entradaPeca = dao.selectById(entradaPeca);
	    if(entradaPeca != null) {
	         result.include("entradapeca", entradaPeca);
	    }
	    //result.redirectTo(this.getClass()).visualizar();
	}
	
	@Path("/entradapeca/excluir/{entradapeca.id}")
	public void excluir(EntradaPeca entradaPeca){
		entradaPeca = dao.selectById(entradaPeca);
	    dao.excluir(entradaPeca);
	    //result.redirectTo(this.getClass()).consultar();	
	}
	

}
