package sisloc.dao;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import sisloc.modelo.Empresa;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class EmpresaDao {
	
	public EntityManager manager;

	public EmpresaDao(EntityManager manager){
		 this.manager = manager;
	}
	
	public boolean salvar(Empresa empresa){
		try{
			manager.persist(empresa);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public boolean atualizar(Empresa empresa){
		try{
			manager.merge(empresa);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public Empresa selectById(Empresa empresa) {
		Query q = manager.createQuery("from Empresa t where t.id = :pid");
		q.setParameter("pid", empresa.getId());
		 
		return (Empresa)q.getSingleResult();
	}
	

}
