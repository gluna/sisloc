package sisloc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import sisloc.modelo.EntradaPecas;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class EntradaPecasDao {
	public EntityManager manager;

	public EntradaPecasDao(EntityManager manager){
		 this.manager = manager;
	}
	
	public boolean salvar(EntradaPecas entradaPecas){
		try{
			manager.persist(entradaPecas);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public boolean excluir(EntradaPecas entradaPecas){
		try{
			manager.remove(entradaPecas);
		}catch(Exception e){
			return false;
		}
		return true;
	}
	
	public boolean atualizar(EntradaPecas entradaPecas){
		try{
			manager.merge(entradaPecas);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public EntradaPecas selectById(EntradaPecas entradaPecas) {
		Query q = manager.createQuery("from EntradaPecas t where t.id = :pid");
		q.setParameter("pid", entradaPecas.getId());
		 
		return (EntradaPecas)q.getSingleResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<EntradaPecas> listaTodos(){
		List<EntradaPecas> t;
		
		Query q = manager.createQuery("from EntradaPecas");
		t = (List<EntradaPecas>) q.getResultList();		
		return t;
	}
	
}
