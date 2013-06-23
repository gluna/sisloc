package sisloc.controller;

import java.util.List;

import sisloc.dao.FornecedorDao;
import sisloc.modelo.Fornecedor;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class FornecedoresController {

	private FornecedorDao dao;
	private Result result;
	
	public FornecedoresController(FornecedorDao dao, Result result){
		this.dao = dao;
		this.result = result;
	}
	
	@Path("/fornecedores/cadastrar")
	public void cadastrar(){
	}
	
	@Post
	@Path("/fornecedores/salvar")
	public void salvar(Fornecedor fornecedor){
		try {
		     if(fornecedor != null) {
		    	 if(fornecedor.getId() == null) {
		    		 dao.salvar(fornecedor);
		    	 } else {
		    		 dao.atualizar(fornecedor);
	             }
	          }
		     result.redirectTo(this.getClass()).cadastrar();
		} catch (Exception e) {
			result.include("msg", e.getMessage());
		}
	}
	
	@Path("/fornecedores/editar/{fornecedor.id}")
	public void editar(Fornecedor fornecedor){
		fornecedor = dao.selectById(fornecedor);
	    if(fornecedor != null) {
	         result.include("fornecedor", fornecedor);
	    }
	    result.redirectTo(this.getClass()).cadastrar();
	}
	
	@Path("/fornecedores/excluir/{fornecedor.id}")
	public void excluir(Fornecedor fornecedor){
		fornecedor = dao.selectById(fornecedor);
	    dao.excluir(fornecedor);
	    //result.redirectTo(this.getClass()).consultar();	
	}
	
	@Path("/fornecedores/consultar")
	public List<Fornecedor> consultar(){
		List<Fornecedor> t = dao.listaTodos();
		return t;
	}
	
	@Path("/fornecedores/consultanome")
	public List<Fornecedor> consultanome(Fornecedor fornecedor){
		List<Fornecedor> c = dao.consultaNome(fornecedor);	
		return c;
	}

}

