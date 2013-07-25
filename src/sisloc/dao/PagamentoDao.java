package sisloc.dao;

import javax.persistence.EntityManager;

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
	
}
