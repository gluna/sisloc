package sisloc.controller;

import java.util.List;

import sisloc.dao.EquipamentoDao;
import sisloc.dao.FornecedorDao;
import sisloc.dao.TipoEquipamentoDao;
import sisloc.modelo.Equipamento;
import sisloc.modelo.Fornecedor;
import sisloc.modelo.TipoEquipamento;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class EquipamentosController {
	
	private EquipamentoDao dao;
	private TipoEquipamentoDao tipodao;
	private Result result;
	private FornecedorDao fornecedordao;
	
	public EquipamentosController(EquipamentoDao dao, Result result, TipoEquipamentoDao tipodao, FornecedorDao fornecedordao){
		this.dao = dao;
		this.result = result;
		this.tipodao = tipodao;
		this.fornecedordao = fornecedordao;
	}
	
	@Path("/equipamentos/cadastrar")
	public List<TipoEquipamento> cadastrar(){
		List<TipoEquipamento> t = tipodao.listaTodos();
		List<Fornecedor> t2 = fornecedordao.listaTodos();
		return t;

	}

	@Post
	@Path("/equipamentos/salvar")
	public void salvar(Equipamento equipamento){
		try {
			 equipamento.setTipoequipamento(tipodao.selectById(equipamento.getTipoequipamento()));
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
