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
	private String forma; //cheque, dinheiro, cartao
	private String tipo; //entrada='E' ou saida='S'
	private String descricao;
	
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
	public String getForma() {
		return forma;
	}
	public void setForma(String forma) {
		this.forma = forma.toUpperCase();
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo.toUpperCase();
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao.toUpperCase();
	}

}
