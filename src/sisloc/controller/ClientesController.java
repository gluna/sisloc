package sisloc.controller;

import java.util.List;

import sisloc.dao.ClienteDao;
import sisloc.modelo.Cliente;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class ClientesController {
	
	private ClienteDao dao;
	private Result result;
	
	public ClientesController(ClienteDao dao, Result result){
		this.dao = dao;
		this.result = result;
	}
	
	@Path("/clientes/cadastrar")
	public void cadastrar(){
	}
	
	@Post
	@Path("/clientes/salvar")
	public void salvar(Cliente cliente){
		try {
		     if(cliente != null) {
		    	 if(cliente.getId() == null) {
		    		 dao.salvar(cliente);
		    	 } else {
		    		 dao.atualizar(cliente);
	             }
	          }
		     result.redirectTo(this.getClass()).cadastrar();
		} catch (Exception e) {
			result.include("msg", e.getMessage());
		}
	}
	
	@Path("/clientes/editar/{cliente.id}")
	public void editar(Cliente cliente){
		cliente = dao.selectById(cliente);
	    if(cliente != null) {
	         result.include("cliente", cliente);
	    }
	    result.redirectTo(this.getClass()).cadastrar();
	}
	
	@Path("/clientes/excluir/{cliente.id}")
	public void excluir(Cliente cliente){
		cliente = dao.selectById(cliente);
	    dao.excluir(cliente);
	    //result.redirectTo(this.getClass()).consultar();	
	}
	
	@Path("/clientes/consultar")
	public List<Cliente> consultar(){
		List<Cliente> t = dao.listaTodos();
		return t;
	}


}
