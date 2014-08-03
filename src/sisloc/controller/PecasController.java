package sisloc.controller;

import java.util.List;

import sisloc.dao.PecaDao;
import sisloc.modelo.Peca;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class PecasController {
	
	private PecaDao dao;
	private Result result;
	
	public PecasController(PecaDao dao, Result result){
		this.dao = dao;
		this.result = result;
	}
	
	@Path("/pecas/cadastrar")
	public void cadastrar(){
	}
	
	@Post
	@Path("/pecas/salvar")
	public void salvar(Peca peca){
		try {
		     if(peca != null) {
		    	 if(peca.getId() == null) {
		    		 dao.salvar(peca);
		    	 } else {
		    		 dao.atualizar(peca);
	             }
	          }
		     result.redirectTo(this.getClass()).cadastrar();
		} catch (Exception e) {
			result.include("msg", e.getMessage());
		}
	}

	@Path("/pecas/editar/{peca.id}")
	public void editar(Peca peca){
		peca = dao.selectById(peca);
	    if(peca != null) {
	         result.include("peca", peca);
	    }
	    result.redirectTo(this.getClass()).cadastrar();
	}
	
	@Path("/pecas/visualizar/{peca.id}")
	public void visualizar(Peca peca){
		peca = dao.selectById(peca);
	    if(peca != null) {
	         result.include("peca", peca);
	    }
	    //result.redirectTo(this.getClass()).visualizar();
	}
	
	@Path("/pecas/excluir/{peca.id}")
	public void excluir(Peca peca){
		peca = dao.selectById(peca);
	    dao.excluir(peca);
	    //result.redirectTo(this.getClass()).consultar();	
	}
	
	@Path("/pecas/consultanome")
	public List<Peca> consultanome(Peca peca){
		List<Peca> c = dao.consultaNome(peca);	
		return c;
	}

}
