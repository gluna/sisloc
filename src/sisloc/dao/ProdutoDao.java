package sisloc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import sisloc.modelo.Produto;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class ProdutoDao {
	
	public EntityManager manager;

	public ProdutoDao(EntityManager manager){
		 this.manager = manager;
	}
	
	public boolean salvar(Produto produto){
		try{
			manager.persist(produto);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public boolean excluir(Produto produto){
		try{
			manager.remove(produto);
		}catch(Exception e){
			return false;
		}
		return true;
	}
	
	public boolean atualizar(Produto produto){
		try{
			manager.merge(produto);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public Produto selectById(Produto produto) {
		Query q = manager.createQuery("from Produto t where t.id = :pid");
		q.setParameter("pid", produto.getId());
		 
		return (Produto)q.getSingleResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Produto> listaTodos(){
		List<Produto> t;
		
		Query q = manager.createQuery("from Produto order by nome");
		t = (List<Produto>) q.getResultList();		
		return t;
	}
	

}