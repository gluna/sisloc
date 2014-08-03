package sisloc.controller;

import java.util.List;

import sisloc.dao.AcessorioDao;
import sisloc.dao.ClienteDao;
import sisloc.modelo.Acessorio;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class AcessoriosController {
	
	private AcessorioDao dao;
	private Result result;
	
	public AcessoriosController(AcessorioDao dao, Result result){
		this.dao = dao;
		this.result = result;
	}
	
	@Path("/acessorios/cadastrar")
	public void cadastrar(){
	}
	
	@Post
	@Path("/acessorios/salvar")
	public void salvar(Acessorio acessorio){
		try {
		     if(acessorio != null) {
		    	 if(acessorio.getId() == null) {
		    		 dao.salvar(acessorio);
		    	 } else {
		    		 dao.atualizar(acessorio);
	             }
	          }
		     result.redirectTo(this.getClass()).cadastrar();
		} catch (Exception e) {
			result.include("msg", e.getMessage());
		}
	}

	@Path("/acessorios/editar/{acessorio.id}")
	public void editar(Acessorio acessorio){
		acessorio = dao.selectById(acessorio);
	    if(acessorio != null) {
	         result.include("acessorio", acessorio);
	    }
	    result.redirectTo(this.getClass()).cadastrar();
	}
	
	@Path("/acessorio/visualizar/{acessorio.id}")
	public void visualizar(Acessorio acessorio){
		acessorio = dao.selectById(acessorio);
	    if(acessorio != null) {
	         result.include("acessorio", acessorio);
	    }
	    //result.redirectTo(this.getClass()).visualizar();
	}
	
	@Path("/acessorios/excluir/{acessorio.id}")
	public void excluir(Acessorio acessorio){
		acessorio = dao.selectById(acessorio);
	    dao.excluir(acessorio);
	    //result.redirectTo(this.getClass()).consultar();	
	}
	
	@Path("/acessorios/consultanome")
	public List<Acessorio> consultanome(Acessorio acessorio){
		List<Acessorio> c = dao.consultaNome(acessorio);	
		return c;
	}

}
