package sisloc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import sisloc.modelo.EntradaPeca;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class EntradaPecaDao {
	public EntityManager manager;

	public EntradaPecaDao(EntityManager manager){
		 this.manager = manager;
	}
	
	public boolean salvar(EntradaPeca entradaPecas){
		try{
			manager.persist(entradaPecas);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public boolean excluir(EntradaPeca entradaPecas){
		try{
			manager.remove(entradaPecas);
		}catch(Exception e){
			return false;
		}
		return true;
	}
	
	public boolean atualizar(EntradaPeca entradaPecas){
		try{
			manager.merge(entradaPecas);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public EntradaPeca selectById(EntradaPeca entradaPecas) {
		Query q = manager.createQuery("from EntradaPecas t where t.id = :pid");
		q.setParameter("pid", entradaPecas.getId());
		 
		return (EntradaPeca)q.getSingleResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<EntradaPeca> listaTodos(){
		List<EntradaPeca> t;
		
		Query q = manager.createQuery("from EntradaPeca");
		t = (List<EntradaPeca>) q.getResultList();		
		return t;
	}
	
}
