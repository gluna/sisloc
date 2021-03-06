package sisloc.modelo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
public class Locacao implements Serializable{

	private static final long serialVersionUID = 7212843550953694704L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private Date dtlocacao;
	private Date dtinicio;
	private Date dtfim;
	private Long empresa = (long) 1;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn
	private Cliente cliente;
	private Double valortotal; //valor sem descontos
	private Double descontovalor;
	private Double descontopercent;
	private String obs;
	private Double frete;
	private Double valorfinal; //valor final apos os descontos
	private String status; //aberta fechada
	
	@OneToMany(cascade=CascadeType.ALL, fetch = FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	@JoinColumn
	private List<EnderecoLocacao> enderecos;
	
	@OneToMany(cascade=CascadeType.ALL, fetch = FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	@JoinColumn
	private List<Pagamento> pagamentos;
	
	@OneToMany(cascade=CascadeType.ALL, fetch = FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	@JoinColumn
	private List<LocacaoDetalhe> locacaodetalhe;

	@OneToMany(cascade=CascadeType.ALL, fetch = FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	@JoinColumn
	private List<DevolucaoLocacao> devolucaolocacao;

	
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

	public Double getValortotal() {
		return valortotal;
	}

	public void setValortotal(Double valortotal) {
		this.valortotal = valortotal;
	}

	public Double getDescontovalor() {
		return descontovalor;
	}

	public void setDescontovalor(Double descontovalor) {
		this.descontovalor = descontovalor;
	}

	public Double getDescontopercent() {
		return descontopercent;
	}

	public void setDescontopercent(Double descontopercent) {
		this.descontopercent = descontopercent;
	}

	public List<EnderecoLocacao> getEnderecos() {
		return enderecos;
	}

	public void setEnderecos(List<EnderecoLocacao> enderecos) {
		this.enderecos = enderecos;
	}

	public List<Pagamento> getPagamentos() {
		return pagamentos;
	}

	public void setPagamentos(List<Pagamento> pagamentos) {
		this.pagamentos = pagamentos;
	}

	public Long getEmpresa() {
		return empresa;
	}

	public void setEmpresa(Long empresa) {
		this.empresa = empresa;
	}

	public String getObs() {
		return obs;
	}

	public void setObs(String obs) {
		this.obs = obs;
	}

	public Double getFrete() {
		return frete;
	}

	public void setFrete(Double frete) {
		this.frete = frete;
	}

	public List<DevolucaoLocacao> getDevolucaolocacao() {
		return devolucaolocacao;
	}

	public void setDevolucaolocacao(List<DevolucaoLocacao> devolucaolocacao) {
		this.devolucaolocacao = devolucaolocacao;
	}

	public Double getValorfinal() {
		return valorfinal;
	}

	public void setValorfinal(Double valorfinal) {
		this.valorfinal = valorfinal;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
