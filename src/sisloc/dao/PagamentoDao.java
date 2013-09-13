package sisloc.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import sisloc.modelo.Pagamento;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class PagamentoDao {
	
	public EntityManager manager;

	public PagamentoDao(EntityManager manager){
		 this.manager = manager;
	}
	
	public boolean salvar(Pagamento pagamento){
		try{
			manager.persist(pagamento);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public boolean excluir(Pagamento pagamento){
		try{
			manager.remove(pagamento);
		}catch(Exception e){
			return false;
		}
		return true;
	}
	
	public boolean atualizar(Pagamento pagamento){
		try{
			manager.merge(pagamento);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public Pagamento selectById(Pagamento pagamento){
		Query q = manager.createQuery("from Pagamento t where t.id = :pid");
		q.setParameter("pid", pagamento.getId());
		 
		return (Pagamento)q.getSingleResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Pagamento> contasapagarnoperiodo(Date inicio, Date fim){
		Query q = manager.createQuery("from Pagamento t where t.dtvencimento >= :inicio " +
				                                       "and t.dtvencimento <= :fim " +
				                                       "and t.dtpagamento is null " +
				                                       "and t.tipo = 'S' "+
				                                       "order by t.dtvencimento");
		q.setParameter("inicio", inicio);
		q.setParameter("fim", fim);  
		return (List<Pagamento>) q.getResultList();	

	}
}
