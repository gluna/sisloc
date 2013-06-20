package sisloc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import sisloc.modelo.Orcamento;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class OrcamentoDao {
	
	public EntityManager manager;

	public OrcamentoDao(EntityManager manager){
		 this.manager = manager;
	}
	
	public boolean salvar(Orcamento orcamento){
		try{
			manager.persist(orcamento);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public boolean excluir(Orcamento orcamento){
		try{
			manager.remove(orcamento);
		}catch(Exception e){
			return false;
		}
		return true;
	}
	
	public boolean atualizar(Orcamento orcamento){
		try{
			manager.merge(orcamento);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public Orcamento selectById(Orcamento orcamento) {
		Query q = manager.createQuery("from Orcamento t where t.id = :pid");
		q.setParameter("pid", orcamento.getId());
		 
		return (Orcamento)q.getSingleResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Orcamento> listaTodos(){
		List<Orcamento> t;
		
		Query q = manager.createQuery("from Orcamento order by data");
		t = (List<Orcamento>) q.getResultList();		
		return t;
	}
	
}
