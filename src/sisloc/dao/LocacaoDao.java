package sisloc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import sisloc.modelo.Locacao;
import sisloc.modelo.Produto;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class LocacaoDao {
	
	public EntityManager manager;

	public LocacaoDao(EntityManager manager){
		 this.manager = manager;
	}
	
	public boolean salvar(Locacao locacao){
		try{
			manager.persist(locacao);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public boolean excluir(Locacao locacao){
		try{
			manager.remove(locacao);
		}catch(Exception e){
			return false;
		}
		return true;
	}
	
	public boolean atualizar(Locacao locacao){
		try{
			manager.merge(locacao);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public Locacao selectById(Locacao locacao) {
		Query q = manager.createQuery("from Locacao t where t.id = :pid");
		q.setParameter("pid", locacao.getId());
		 
		return (Locacao)q.getSingleResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Locacao> listaTodos(){
		List<Locacao> t;
		
		Query q = manager.createQuery("from Locacao order by dtlocacao");
		t = (List<Locacao>) q.getResultList();		
		return t;
	}
	
	@SuppressWarnings("unchecked")
	public List<Produto> listaProdutos(){
		List<Produto> p;
		Query q = manager.createQuery("from Produto order by nome");
		p = (List<Produto>) q.getResultList();		
		return p;
		
	}
		

}
