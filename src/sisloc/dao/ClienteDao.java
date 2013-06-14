package sisloc.dao;


import javax.persistence.EntityManager;
import javax.persistence.Query;

import sisloc.modelo.Cliente;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class ClienteDao {
	
	public EntityManager manager;

	public ClienteDao(EntityManager manager){
		 this.manager = manager;
	}
	
	public boolean salvar(Cliente cliente){
		try{
			manager.persist(cliente);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public boolean excluir(Cliente tarefa){
		try{
			manager.remove(tarefa);
		}catch(Exception e){
			return false;
		}
		return true;
	}
	
	public boolean atualizar(Cliente tarefa){
		try{
			manager.merge(tarefa);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public Cliente selectById(Cliente cliente) {
		Query q = manager.createQuery("from Cliente t where t.id = :pid");
		q.setParameter("pid", cliente.getId());
		 
		return (Cliente)q.getSingleResult();
	}
	

}
