package sisloc.dao;


import java.util.List;

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
	
	public boolean atualizar(Cliente cliente){
		try{
			manager.merge(cliente);
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
	
	@SuppressWarnings("unchecked")
	public List<Cliente> listaTodos(){
		List<Cliente> t;
		
		Query q = manager.createQuery("from Cliente order by nome");
		t = (List<Cliente>) q.getResultList();		
		return t;
	}
	
	@SuppressWarnings("unchecked")
	public List<Cliente> consultaNome(Cliente cliente){
		if(cliente == null){
			cliente = new Cliente();
		}
		
		List<Cliente> c;
		
		Query q = manager.createQuery("from Cliente c where c.nome like :nome order by nome");
		q.setParameter("nome", cliente.getNome()+"%");
		
		c = (List<Cliente>) q.getResultList();		
		return c;
	}
	

}
