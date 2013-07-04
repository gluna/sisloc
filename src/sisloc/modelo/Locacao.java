package sisloc.modelo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity
public class Locacao implements Serializable{

	private static final long serialVersionUID = 7212843550953694704L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private Date dtlocacao;
	private Date dtinicio;
	private Date dtfim;
	private Cliente cliente;
	//TODO ver como sera feito a forma de pagamento
	
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn
	private List<LocacaoDetalhe> locacaodetalhe;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDtlocacao() {
		return dtlocacao;
	}

	public void setDtlocacao(Date dtlocacao) {
		this.dtlocacao = dtlocacao;
	}

	public Date getDtinicio() {
		return dtinicio;
	}

	public void setDtinicio(Date dtinicio) {
		this.dtinicio = dtinicio;
	}

	public Date getDtfim() {
		return dtfim;
	}

	public void setDtfim(Date dtfim) {
		this.dtfim = dtfim;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public List<LocacaoDetalhe> getLocacaodetalhe() {
		return locacaodetalhe;
	}

	public void setLocacaodetalhe(List<LocacaoDetalhe> locacaodetalhe) {
		this.locacaodetalhe = locacaodetalhe;
	}
}
