package sisloc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import sisloc.modelo.Peca;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class PecaDao {
	
	public EntityManager manager;
	
	public PecaDao(EntityManager manager){
		 this.manager = manager;
	}
	
	public boolean salvar(Peca peca){
		try{
			manager.persist(peca);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public boolean excluir(Peca peca){
		try{
			manager.remove(peca);
		}catch(Exception e){
			return false;
		}
		return true;
	}
	
	public boolean atualizar(Peca peca){
		try{
			manager.merge(peca);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public Peca selectById(Peca peca) {
		Query q = manager.createQuery("from Peca t where t.id = :pid");
		q.setParameter("pid", peca.getId());
		 
		return (Peca)q.getSingleResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Peca> listaTodos(){
		List<Peca> t;
		
		Query q = manager.createQuery("from Peca order by descricao");
		t = (List<Peca>) q.getResultList();		
		return t;
	}
	
	@SuppressWarnings("unchecked")
	public List<Peca> consultaNome(Peca peca){
		if(peca == null){
			peca = new Peca();
		}
		
		List<Peca> c;
		
		Query q = manager.createQuery("from Peca c where c.descricao like :nome order by descricao");
		q.setParameter("nome", peca.getDescricao()+"%");
		
		c = (List<Peca>) q.getResultList();		
		return c;
	}
	
}
