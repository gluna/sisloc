package sisloc.controller;

import java.util.List;

import sisloc.dao.LocacaoDao;
import sisloc.dao.PagamentoDao;
import sisloc.modelo.Locacao;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class PagamentosController {

	private PagamentoDao dao;
	private Result result;
	private LocacaoDao locacaodao;
	
	public PagamentosController(PagamentoDao dao, Result result, LocacaoDao locacaodao){
		this.dao = dao;
		this.result = result;
		this.locacaodao = locacaodao;
	}
	
	@Path("/pagamentos/cadastrar")
	public void cadastrar(){
	}
	
	@Post
	@Path("/pagamentos/salvar")
	public void salvar(Locacao locacao){
		try {
		     if(locacao != null) {
		    	 if(locacao.getId() == null) {
		    		 locacaodao.salvar(locacao);
		    	 } else {
		    		 locacaodao.atualizar(locacao);
	             }
	          }
		     result.redirectTo(this.getClass()).cadastrar();
		} catch (Exception e) {
			result.include("msg", e.getMessage());
		}
	}
	
	@Path("/pagamentos/editar/{locacao.id}")
	public void editar(Locacao locacao){
		locacao = locacaodao.selectById(locacao);
	    if(locacao != null) {
	         result.include("locacao", locacao);
	    }
	    result.redirectTo(this.getClass()).cadastrar();
	}
	
	@Path("/pagamentos/consultalocacao")
	public List<Locacao> consultalocacao(Locacao locacao){
		List<Locacao> t = locacaodao.consultalocacao(locacao);
		return t;
	}
}

