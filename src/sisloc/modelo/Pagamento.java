package sisloc.modelo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Pagamento implements Serializable{

	private static final long serialVersionUID = -8596402808595776911L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private Double valor;
	private Date dtvencimento;
	private Date dtpagamento;
	private String moeda;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Double getValor() {
		return valor;
	}
	public void setValor(Double valor) {
		this.valor = valor;
	}
	public Date getDtvencimento() {
		return dtvencimento;
	}
	public void setDtvencimento(Date dtvencimento) {
		this.dtvencimento = dtvencimento;
	}
	public Date getDtpagamento() {
		return dtpagamento;
	}
	public void setDtpagamento(Date dtpagamento) {
		this.dtpagamento = dtpagamento;
	}
	public String getMoeda() {
		return moeda;
	}
	public void setMoeda(String moeda) {
		this.moeda = moeda.toUpperCase();
	}

}
