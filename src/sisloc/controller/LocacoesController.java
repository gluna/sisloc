package sisloc.controller;

import java.util.List;

import sisloc.dao.LocacaoDao;
import sisloc.modelo.Locacao;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class LocacoesController {
	
	private LocacaoDao dao;
	private Result result;
	
	public LocacoesController(LocacaoDao dao, Result result){
		this.dao = dao;
		this.result = result;
	}
	
	@Path("/locacoes/cadastrar")
	public void cadastrar(){
	}
	
	@Post
	@Path("/locacoes/salvar")
	public void salvar(Locacao locacao){
		try {
		     if(locacao != null) {
		    	 if(locacao.getId() == null) {
		    		 dao.salvar(locacao);
		    	 } else {
		    		 dao.atualizar(locacao);
	             }
	          }
		     result.redirectTo(this.getClass()).cadastrar();
		} catch (Exception e) {
			result.include("msg", e.getMessage());
		}
	}
	
	@Path("/locacoes/editar/{locacao.id}")
	public void editar(Locacao locacao){
		locacao = dao.selectById(locacao);
	    if(locacao != null) {
	         result.include("locacao", locacao);
	    }
	    result.redirectTo(this.getClass()).cadastrar();
	}
	
	@Path("/locacoes/excluir/{locacoes.id}")
	public void excluir(Locacao locacao){
		locacao = dao.selectById(locacao);
	    dao.excluir(locacao);
	    //result.redirectTo(this.getClass()).consultar();	
	}
	
	@Path("/clientes/consultar")
	public List<Locacao> consultar(){
		List<Locacao> t = dao.listaTodos();
		return t;
	}
	
}