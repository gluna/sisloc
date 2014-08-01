package sisloc.controller;

import java.util.List;

import sisloc.dao.EquipamentoDao;
import sisloc.modelo.Equipamento;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class EquipamentosController {
	
	private EquipamentoDao dao;
	private Result result;
	
	public EquipamentosController(EquipamentoDao dao, Result result){
		this.dao = dao;
		this.result = result;
	}
	
	@Path("/equipamentos/cadastrar")
	public void cadastrar(){
	}
	
	@Post
	@Path("/equipamentos/salvar")
	public void salvar(Equipamento equipamento){
		try {
		     if(equipamento != null) {
		    	 if(equipamento.getId() == null) {
		    		 dao.salvar(equipamento);
		    	 } else {
		    		 dao.atualizar(equipamento);
	             }
	          }
		     result.include("produto", equipamento);
		     result.redirectTo(this.getClass()).cadastrar();
		} catch (Exception e) {
			result.include("msg", e.getMessage());
		}
	}
	
	@Path("/equipamentos/editar/{equipamento.id}")
	public void editar(Equipamento equipamento){
		equipamento = dao.selectById(equipamento);
	    if(equipamento != null) {
	         result.include("equipamento", equipamento);
	    }
	    result.redirectTo(this.getClass()).cadastrar();
	}
	
	@Path("/equipamentos/visualizar/{equipamento.id}")
	public void visualizar(Equipamento equipamento){
		equipamento = dao.selectById(equipamento);
	    if(equipamento != null) {
	         result.include("equipamento", equipamento);
	    }
	    //result.redirectTo(this.getClass()).cadastrar();
	}
	
	@Path("/equipamentos/excluir/{equipamento.id}")
	public void excluir(Equipamento equipamento){
		equipamento = dao.selectById(equipamento);
	    dao.excluir(equipamento);
	    //result.redirectTo(this.getClass()).consultar();	
	}
	
	@Path("/equipamento/consultar")
	public List<Equipamento> consultar(){
		List<Equipamento> t = dao.listaTodos();
		return t;
	}
	
	/*@Path("/produtos/consultanome")
	public List<Equipamento> consultanome(Equipamento equipamento){
		List<Equipamento> c = dao.consultaNome(equipamento);
		return c;
	}*/

}
