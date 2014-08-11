package sisloc.controller;

import java.util.List;

import sisloc.dao.ManutencaoDao;
import sisloc.dao.PecaDao;
import sisloc.modelo.Manutencao;
import sisloc.modelo.Peca;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class ManutencaoController {
	
	private ManutencaoDao dao;
	private PecaDao pecaDao;
	private Result result;
	
	public ManutencaoController(ManutencaoDao dao, Result result, PecaDao pecaDao){
		this.dao = dao;
		this.result = result;
		this.pecaDao = pecaDao;
	}
	
	@Path("/manutencao/cadastrar")
	public List<Peca> cadastrar(){
		return pecaDao.listaTodos();
	}
	
	@Post
	@Path("/manutencao/salvar")
	public void salvar(Manutencao manutencao){
		try {
		     if(manutencao != null) {
		    	 if(manutencao.getId() == null) {
		    		 dao.salvar(manutencao);
		    	 } else {
		    		 dao.atualizar(manutencao);
	             }
	          }
		     result.redirectTo(this.getClass()).cadastrar();
		} catch (Exception e) {
			result.include("msg", e.getMessage());
		}
	}
	
	@Path("/manutencao/editar/{manutencao.id}")
	public void editar(Manutencao manutencao){
		manutencao = dao.selectById(manutencao);
	    if(manutencao != null) {
	         result.include("cliente", manutencao);
	    }
	    result.redirectTo(this.getClass()).cadastrar();
	}
	
	@Path("/manutencao/visualizar/{manutencao.id}")
	public void visualizar(Manutencao manutencao){
		manutencao = dao.selectById(manutencao);
	    if(manutencao != null) {
	         result.include("manutencao", manutencao);
	    }
	    //result.redirectTo(this.getClass()).visualizar();
	}
	
	@Path("/manutancao/excluir/{manutencao.id}")
	public void excluir(Manutencao manutencao){
		manutencao = dao.selectById(manutencao);
	    dao.excluir(manutencao);
	    //result.redirectTo(this.getClass()).consultar();	
	}
	

}
