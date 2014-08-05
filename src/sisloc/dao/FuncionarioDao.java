package sisloc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import sisloc.modelo.Funcionario;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class FuncionarioDao {
	
	public EntityManager manager;

	public FuncionarioDao(EntityManager manager){
		 this.manager = manager;
	}
	
	public boolean salvar(Funcionario funcionario){
		try{
			manager.persist(funcionario);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public boolean excluir(Funcionario funcionario){
		try{
			manager.remove(funcionario);
		}catch(Exception e){
			return false;
		}
		return true;
	}
	
	public boolean atualizar(Funcionario funcionario){
		try{
			manager.merge(funcionario);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public Funcionario selectById(Funcionario funcionario) {
		Query q = manager.createQuery("from Funcionario t where t.id = :pid");
		q.setParameter("pid", funcionario.getId());
		 
		return (Funcionario)q.getSingleResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Funcionario> listaTodos(){
		List<Funcionario> t;
		
		Query q = manager.createQuery("from Funcionario order by nome");
		t = (List<Funcionario>) q.getResultList();		
		return t;
	}
	
	@SuppressWarnings("unchecked")
	public List<Funcionario> consultaNome(Funcionario funcionario){
		if(funcionario == null){
			funcionario = new Funcionario();
		}
		
		List<Funcionario> c;
		
		Query q = manager.createQuery("from Funcionario c where c.nome like :nome order by nome");
		q.setParameter("nome", funcionario.getNome()+"%");
		
		c = (List<Funcionario>) q.getResultList();		
		return c;
	}


}
