package sisloc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import sisloc.modelo.Equipamento;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class EquipamentoDao {
	
	public EntityManager manager;

	public EquipamentoDao(EntityManager manager){
		 this.manager = manager;
	}
	
	public boolean salvar(Equipamento equipamento){
		try{
			manager.persist(equipamento);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public boolean excluir(Equipamento equipamento){
		try{
			manager.remove(equipamento);
		}catch(Exception e){
			return false;
		}
		return true;
	}
	
	public boolean atualizar(Equipamento equipamento){
		try{
			manager.merge(equipamento);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public Equipamento selectById(Equipamento equipamento) {
		Query q = manager.createQuery("from Equipamento t where t.id = :pid");
		q.setParameter("pid", equipamento.getId());
		 
		return (Equipamento)q.getSingleResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Equipamento> listaTodos(){
		List<Equipamento> t;
		
		Query q = manager.createQuery("from Equipamento" );
		t = (List<Equipamento>) q.getResultList();		
		return t;
	}
	
	public Equipamento selectByPat(Equipamento equipamento) {
		Query q = manager.createQuery("from Equipamento t where t.patrimonio = :pid");
		q.setParameter("pid", equipamento.getPatrimonio());
		 
		return (Equipamento)q.getSingleResult();
	}
	
	/*@SuppressWarnings("unchecked")
	public List<Equipamento> consultaNome(Equipamento equipamento){
		if(equipamento == null){
			equipamento = new Equipamento();
		}
		
		List<Equipamento> c;
		
		Query q = manager.createQuery("from Equipamento c where c.nome like :nome order by nome");
		q.setParameter("nome", equipamento.getNome()+"%");
		
		c = (List<Equipamento>) q.getResultList();		
		return c;
	}*/
	

}