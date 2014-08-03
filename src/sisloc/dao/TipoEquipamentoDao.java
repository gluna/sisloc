package sisloc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import sisloc.modelo.TipoEquipamento;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class TipoEquipamentoDao {
	
	public EntityManager manager;

	public TipoEquipamentoDao(EntityManager manager){
		 this.manager = manager;
	}
	
	public boolean salvar(TipoEquipamento tipoequipamento){
		try{
			manager.persist(tipoequipamento);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public boolean excluir(TipoEquipamento tipoequipamento){
		try{
			manager.remove(tipoequipamento);
		}catch(Exception e){
			return false;
		}
		return true;
	}
	
	public boolean atualizar(TipoEquipamento tipoequipamento){
		try{
			manager.merge(tipoequipamento);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public TipoEquipamento selectById(TipoEquipamento tipoequipamento) {
		Query q = manager.createQuery("from TipoEquipamento t where t.id = :pid");
		q.setParameter("pid", tipoequipamento.getId());
		 
		return (TipoEquipamento)q.getSingleResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<TipoEquipamento> listaTodos(){
		List<TipoEquipamento> t;
		
		Query q = manager.createQuery("from TipoEquipamento order by descricao");
		t = (List<TipoEquipamento>) q.getResultList();		
		return t;
	}
	
}
