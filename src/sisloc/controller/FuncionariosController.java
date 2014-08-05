package sisloc.controller;

import java.util.List;

import sisloc.dao.FuncionarioDao;
import sisloc.modelo.Funcionario;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class FuncionariosController {

	private FuncionarioDao dao;
	private Result result;
	
	public FuncionariosController(FuncionarioDao dao, Result result){
		this.dao = dao;
		this.result = result;
	}
	
	@Path("/funcionarios/cadastrar")
	public void cadastrar(){
	}
	
	@Post
	@Path("/funcionarios/salvar")
	public void salvar(Funcionario funcionario){
		try {
		     if(funcionario != null) {
		    	 if(funcionario.getId() == null) {
		    		 dao.salvar(funcionario);
		    	 } else {
		    		 dao.atualizar(funcionario);
	             }
	          }
		     result.redirectTo(this.getClass()).cadastrar();
		} catch (Exception e) {
			result.include("msg", e.getMessage());
		}
	}
	
	@Path("/funcionarios/editar/{funcionario.id}")
	public void editar(Funcionario funcionario){
		funcionario = dao.selectById(funcionario);
	    if(funcionario != null) {
	         result.include("funcionario", funcionario);
	    }
	    result.redirectTo(this.getClass()).cadastrar();
	}
	
	@Path("/funcionarios/visualizar/{funcionario.id}")
	public void visualizar(Funcionario funcionario){
		funcionario = dao.selectById(funcionario);
	    if(funcionario != null) {
	         result.include("funcionario", funcionario);
	    }
	    //result.redirectTo(this.getClass()).visualizar();
	}
	
	@Path("/funcionarios/excluir/{funcionario.id}")
	public void excluir(Funcionario funcionario){
		funcionario = dao.selectById(funcionario);
	    dao.excluir(funcionario);
	    //result.redirectTo(this.getClass()).consultar();	
	}
	
	@Path("/funcionarios/consultanome")
	public List<Funcionario> consultanome(Funcionario funcionario){
		List<Funcionario> c = dao.consultaNome(funcionario);	
		return c;
	}

}
