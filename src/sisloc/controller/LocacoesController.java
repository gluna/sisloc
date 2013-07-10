package sisloc.controller;

import java.util.List;

import sisloc.dao.LocacaoDao;
import sisloc.dao.ProdutoDao;
import sisloc.modelo.Locacao;
import sisloc.modelo.LocacaoDetalhe;
import sisloc.modelo.Preco;
import sisloc.modelo.Produto;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;

@Resource
public class LocacoesController {
	
	private LocacaoDao dao;
	private Result result;
	private ProdutoDao produtodao;
	
	public LocacoesController(LocacaoDao dao, Result result, ProdutoDao produtodao){
		this.dao = dao;
		this.result = result;
		this.produtodao = produtodao;
	}
	
	@Path("/locacoes/cadastrar")
	public List<Produto> cadastrar(){
		List<Produto> t = produtodao.listaTodos();
		return t;
	}
	
	@Post
	@Path("/locacoes/salvar")
	public void salvar(Locacao locacao){
		try {
		     if(locacao != null) {
		    	 for(LocacaoDetalhe ld : locacao.getLocacaodetalhe() ){
		    		 ld.setProduto(produtodao.selectById(ld.getProduto()));
		    	 }
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
	
	@Path("/locacoes/getprecos/{produto.id}")
	public void getprecos(Long p){
		Produto prod = new Produto();
		prod.setId(p);
		List<Preco> precos = produtodao.selectById(prod).getPrecos();
		result.use(Results.json()).withoutRoot().from(precos).serialize();  
	}
	
	
}
