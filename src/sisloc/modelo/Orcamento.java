package sisloc.modelo;

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
public class Orcamento {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private Date data;
	private Date inicio;
	private Date fim;
	
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn
	private List<OrcamentoDetalhe> orcamentodetalhe;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public List<OrcamentoDetalhe> getOrcamentodetalhe() {
		return orcamentodetalhe;
	}

	public void setOrcamentodetalhe(List<OrcamentoDetalhe> orcamentodetalhe) {
		this.orcamentodetalhe = orcamentodetalhe;
	}

	public Date getInicio() {
		return inicio;
	}

	public void setInicio(Date inicio) {
		this.inicio = inicio;
	}

	public Date getFim() {
		return fim;
	}

	public void setFim(Date fim) {
		this.fim = fim;
	}
	

}
