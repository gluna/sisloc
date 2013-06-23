package sisloc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import sisloc.modelo.Fornecedor;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class FornecedorDao {
	
	
	public EntityManager manager;

	public FornecedorDao(EntityManager manager){
		 this.manager = manager;
	}
	
	public boolean salvar(Fornecedor fornecedor){
		try{
			manager.persist(fornecedor);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public boolean excluir(Fornecedor fornecedor){
		try{
			manager.remove(fornecedor);
		}catch(Exception e){
			return false;
		}
		return true;
	}
	
	public boolean atualizar(Fornecedor fornecedor){
		try{
			manager.merge(fornecedor);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public Fornecedor selectById(Fornecedor fornecedor) {
		Query q = manager.createQuery("from Fornecedor t where t.id = :pid");
		q.setParameter("pid", fornecedor.getId());
		 
		return (Fornecedor)q.getSingleResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Fornecedor> listaTodos(){
		List<Fornecedor> t;
		
		Query q = manager.createQuery("from Fornecedor order by nome");
		t = (List<Fornecedor>) q.getResultList();		
		return t;
	}
	
	@SuppressWarnings("unchecked")
	public List<Fornecedor> consultaNome(Fornecedor fornecedor){
		if(fornecedor == null){
			fornecedor = new Fornecedor();
		}
		
		List<Fornecedor> c;
		
		Query q = manager.createQuery("from Fornecedor c where c.nome like :nome order by nome");
		q.setParameter("nome", fornecedor.getNome()+"%");
		
		c = (List<Fornecedor>) q.getResultList();		
		return c;
	}
	
}
