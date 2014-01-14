package sisloc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import sisloc.modelo.Cliente;
import sisloc.modelo.Locacao;
import sisloc.modelo.LocacaoDetalhe;
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
	public List<Locacao> consultalocacao(Locacao locacao){
		if(locacao == null){
			Cliente c = new Cliente();
			locacao = new Locacao();
			locacao.setCliente(c);
		}
		Query q = manager.createQuery("from Locacao t where t.cliente.nome like :pid");
		q.setParameter("pid", locacao.getCliente().getNome()+"%");
		return (List<Locacao>) q.getResultList();
	}
	
	public LocacaoDetalhe buscaLocacaoDetalhe(LocacaoDetalhe locacaodetalhe){
		Query q = manager.createQuery("from LocacaoDetalhe t where t.id = :pid");
		q.setParameter("pid", locacaodetalhe.getId());
		return (LocacaoDetalhe) q.getSingleResult();
		
	}

}
