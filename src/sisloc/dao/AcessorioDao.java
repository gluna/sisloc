package sisloc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import sisloc.modelo.Acessorio;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class AcessorioDao {
	
	public EntityManager manager;
	
	public AcessorioDao(EntityManager manager){
		 this.manager = manager;
	}
	
	public boolean salvar(Acessorio acessorio){
		try{
			manager.persist(acessorio);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public boolean excluir(Acessorio acessorio){
		try{
			manager.remove(acessorio);
		}catch(Exception e){
			return false;
		}
		return true;
	}
	
	public boolean atualizar(Acessorio acessorio){
		try{
			manager.merge(acessorio);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public Acessorio selectById(Acessorio acessorio) {
		Query q = manager.createQuery("from Acessorio t where t.id = :pid");
		q.setParameter("pid", acessorio.getId());
		 
		return (Acessorio)q.getSingleResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Acessorio> listaTodos(){
		List<Acessorio> t;
		
		Query q = manager.createQuery("from Acessorio order by descricao");
		t = (List<Acessorio>) q.getResultList();		
		return t;
	}
	
	@SuppressWarnings("unchecked")
	public List<Acessorio> consultaNome(Acessorio acessorio){
		if(acessorio == null){
			acessorio = new Acessorio();
		}
		
		List<Acessorio> c;
		
		Query q = manager.createQuery("from Acessorio c where c.descricao like :nome order by descricao");
		q.setParameter("nome", acessorio.getDescricao()+"%");
		
		c = (List<Acessorio>) q.getResultList();		
		return c;
	}
	

}
