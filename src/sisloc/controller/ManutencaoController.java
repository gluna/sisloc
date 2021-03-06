package sisloc.controller;

import java.util.List;

import javax.swing.JOptionPane;

import sisloc.dao.EquipamentoDao;
import sisloc.dao.ManutencaoDao;
import sisloc.dao.PecaDao;
import sisloc.modelo.Equipamento;
import sisloc.modelo.Manutencao;
import sisloc.modelo.Peca;
import sisloc.modelo.PecaManutencao;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;

@Resource
public class ManutencaoController {
	
	private ManutencaoDao dao;
	private PecaDao pecaDao;
	private EquipamentoDao equipamentoDao;
	private Result result;
	
	public ManutencaoController(ManutencaoDao dao, Result result, PecaDao pecaDao, EquipamentoDao equipamentoDao){
		this.dao = dao;
		this.result = result;
		this.pecaDao = pecaDao;
		this.equipamentoDao = equipamentoDao;
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
		    	 boolean ok = true;
		    	 manutencao.setEquipamento(equipamentoDao.selectByPat(manutencao.getEquipamento()));
		    	 if(manutencao.getPecas() == null){
		    		 JOptionPane.showMessageDialog(null,"verifique os itens");
		    	 }else{
		    		 for(PecaManutencao pm : manutencao.getPecas()){//verifica se a quantidade existe
		    			 Peca p = pecaDao.selectById(pm.getPeca());
		    			 pm.setPeca(p);
		    			 if(p.getQuantidade() < pm.getQuantidade()){
		    				 ok = false;
		    			 }
		    		 }
		    		 
		    		 if(ok){
		    			 Double valor = 0.0;
			    		 for(PecaManutencao pm : manutencao.getPecas()){
			    			 Peca p = pm.getPeca();
			    			 p.setQuantidade(p.getQuantidade()-pm.getQuantidade());
			    			 valor = valor+(p.getValor()*pm.getQuantidade());
			    		 }
		    			 manutencao.setCusto(valor+"");
		    		 }else{
		    			 JOptionPane.showMessageDialog(null,"verifique as quantidades");
		    		 }
		    	 }
		    	 
		    	 if(manutencao.getId() == null) {
		    		 dao.salvar(manutencao);
		    	 } else {
		    		 dao.atualizar(manutencao);
	             }
	          }
		     result.include("manutencao", manutencao);
		     result.redirectTo(this.getClass()).cadastrar();
		} catch (Exception e) {
			result.include("msg", e.getMessage());
			System.out.println(e.getMessage());
		}
	}
	
	@Path("/manutencao/editar/{manutencao.id}")
	public void editar(Manutencao manutencao){
		manutencao = dao.selectById(manutencao);
	    if(manutencao != null) {
	         result.include("manutencao", manutencao);
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
	
	@Path("/manutencao/excluir/{manutencao.id}")
	public void excluir(Manutencao manutencao){
		manutencao = dao.selectById(manutencao);
	    dao.excluir(manutencao);
	    //result.redirectTo(this.getClass()).consultar();	
	}
	
	@Path("/manutencao/getequipamento/{equipamento.patrimonio}")
	public void getequipamento(String p){
		Equipamento equi = new Equipamento();
		equi.setPatrimonio(p);
		Equipamento e = equipamentoDao.selectByPat(equi);
		result.use(Results.json()).withoutRoot().from(e.getTipoequipamento()).serialize(); 		
	}
	

}
