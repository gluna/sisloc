package sisloc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import sisloc.modelo.Cliente;
import sisloc.modelo.Manutencao;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class ManutencaoDao {
	
	public EntityManager manager;

	public ManutencaoDao(EntityManager manager){
		 this.manager = manager;
	}
	
	public boolean salvar(Manutencao manutencao){
		try{
			manager.persist(manutencao);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public boolean excluir(Manutencao manutencao){
		try{
			manager.remove(manutencao);
		}catch(Exception e){
			return false;
		}
		return true;
	}
	
	public boolean atualizar(Manutencao manutencao){
		try{
			manager.merge(manutencao);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public Manutencao selectById(Manutencao manutencao) {
		Query q = manager.createQuery("from Manutencao t where t.id = :pid");
		q.setParameter("pid", manutencao.getId());
		 
		return (Manutencao)q.getSingleResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Manutencao> listaTodos(){
		List<Manutencao> t;
		
		Query q = manager.createQuery("from Cliente order by nome");
		t = (List<Manutencao>) q.getResultList();		
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
