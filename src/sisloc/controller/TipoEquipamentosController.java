package sisloc.controller;

import sisloc.dao.TipoEquipamentoDao;
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
	
	@Path("/tipoequipamento/cadastrar")
	public void cadastrar(){
	}
	
	@Post
	@Path("/tipoequipamento/salvar")
	public void salvar(TipoEquipamento tipoequipamento){
		try {
		     if(tipoequipamento != null) {
		    	 if(tipoequipamento.getId() == null) {
		    		 dao.salvar(tipoequipamento);
		    	 } else {
		    		 dao.atualizar(tipoequipamento);
	             }
	          }
		     result.redirectTo(this.getClass()).cadastrar();
		} catch (Exception e) {
			result.include("msg", e.getMessage());
		}
	}
	
	@Path("/tipoequipamento/editar/{tipoequipamento.id}")
	public void editar(TipoEquipamento tipoequipamento){
		tipoequipamento = dao.selectById(tipoequipamento);
	    if(tipoequipamento != null) {
	         result.include("tipo", tipoequipamento);
	    }
	    result.redirectTo(this.getClass()).cadastrar();
	}
	
	@Path("/tipoequipamento/visualizar/{tipoequipamento.id}")
	public void visualizar(TipoEquipamento tipoequipamento){
		tipoequipamento = dao.selectById(tipoequipamento);
	    if(tipoequipamento != null) {
	         result.include("cliente", tipoequipamento);
	    }
	    //result.redirectTo(this.getClass()).visualizar();
	}
	
	@Path("/tipoequipamento/excluir/{tipoequipamento.id}")
	public void excluir(TipoEquipamento tipoequipamento){
		tipoequipamento = dao.selectById(tipoequipamento);
	    dao.excluir(tipoequipamento);
	    //result.redirectTo(this.getClass()).consultar();	
	}
	
}
