package sisloc.controller;

import java.util.List;

import sisloc.dao.PagamentoDao;
import sisloc.modelo.Pagamento;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class PagamentosController {

	private PagamentoDao dao;
	private Result result;
	
	public PagamentosController(PagamentoDao dao, Result result){
		this.dao = dao;
		this.result = result;
	}
	
	@Path("/pagamentos/cadastrar")
	public void cadastrar(){
	}
	
	@Post
	@Path("/clientes/salvar")
	public void salvar(Pagamento pagamento){
		try {
		     if(pagamento != null) {
		    	 if(pagamento.getId() == null) {
		    		 dao.salvar(pagamento);
		    	 } else {
		    		 dao.atualizar(pagamento);
	             }
	          }
		     result.redirectTo(this.getClass()).cadastrar();
		} catch (Exception e) {
			result.include("msg", e.getMessage());
		}
	}
	
	@Path("/pagamentos/editar/{pagamento.id}")
	public void editar(Pagamento pagamento){
		pagamento = dao.selectById(pagamento);
	    if(pagamento != null) {
	         result.include("pagamento", pagamento);
	    }
	    result.redirectTo(this.getClass()).cadastrar();
	}
	
	@Path("/pagamentos/visualizar/{pagamento.id}")
	public void visualizar(Pagamento pagamento){
		pagamento = dao.selectById(pagamento);
	    if(pagamento != null) {
	         result.include("pagamento", pagamento);
	    }
	    //result.redirectTo(this.getClass()).visualizar();
	}
	
}

