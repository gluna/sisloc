package sisloc.controller;

import java.util.List;

import sisloc.dao.TipoEquipamentoDao;
import sisloc.modelo.Cliente;
import sisloc.modelo.TipoEquipamento;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class TipoEquipamentosController {
	
	private TipoEquipamentoDao dao;
	private Result result;
	
	public TipoEquipamentosController(TipoEquipamentoDao dao, Result result){
		this.dao = dao;
		this.result = result;
	}
	
	@Path("/tipo/cadastrar")
	public void cadastrar(){
	}
	
	@Post
	@Path("/tipo/salvar")
	public void salvar(TipoEquipamento tipo){
		try {
		     if(tipo != null) {
		    	 if(tipo.getId() == null) {
		    		 dao.salvar(tipo);
		    	 } else {
		    		 dao.atualizar(tipo);
	             }
	          }
		     result.redirectTo(this.getClass()).cadastrar();
		} catch (Exception e) {
			result.include("msg", e.getMessage());
		}
	}
	
	@Path("/tipo/editar/{tipoequipamento.id}")
	public void editar(TipoEquipamento tipo){
		tipo = dao.selectById(tipo);
	    if(tipo != null) {
	         result.include("tipo", tipo);
	    }
	    result.redirectTo(this.getClass()).cadastrar();
	}
	
	@Path("/tipo/visualizar/{tipoequipamento.id}")
	public void visualizar(TipoEquipamento tipo){
		tipo = dao.selectById(tipo);
	    if(tipo != null) {
	         result.include("cliente", tipo);
	    }
	    //result.redirectTo(this.getClass()).visualizar();
	}
	
	@Path("/tipo/excluir/{tipoequipamento.id}")
	public void excluir(TipoEquipamento tipo){
		tipo = dao.selectById(tipo);
	    dao.excluir(tipo);
	    //result.redirectTo(this.getClass()).consultar();	
	}
	
	/*@Path("/tipo/consultanome")
	public List<Cliente> consultanome(Cliente cliente){
		List<Cliente> c = dao.consultaNome(cliente);	
		return c;
	}*/


}
