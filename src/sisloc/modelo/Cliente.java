package sisloc.modelo;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
public class Cliente implements Serializable{

	private static final long serialVersionUID = 8120420078276398980L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String nome;
	private String email;
	private String contato;
	private String cpfcnpj;
	private String rep;
	private String ie;//inscricao estadual
	private String im;//inscricao municipal
	private String pai;
	private String mae;
	private String rg;
	@Column(columnDefinition="text")
	private String obs;
	@Column(columnDefinition="text")
	private String aviso;
	
	@OneToMany(cascade=CascadeType.ALL, fetch = FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	@JoinColumn
	private List<TelefoneCliente> telefones;
	
	@OneToMany(cascade=CascadeType.ALL, fetch = FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	@JoinColumn
	private List<EnderecoCliente> enderecos;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome.toUpperCase();
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContato() {
		return contato;
	}
	public void setContato(String contato) {
		this.contato = contato.toUpperCase();
	}
	public List<TelefoneCliente> getTelefones() {
		return telefones;
	}
	public void setTelefones(List<TelefoneCliente> telefones) {
		this.telefones = telefones;
	}
	public String getCpfcnpj() {
		return cpfcnpj;
	}
	public void setCpfcnpj(String cpfcnpj) {
		this.cpfcnpj = cpfcnpj.toUpperCase();
	}
	public String getRep() {
		return rep;
	}
	public void setRep(String rep) {
		this.rep = rep.toUpperCase();
	}
	public String getIe() {
		return ie;
	}
	public void setIe(String ie) {
		this.ie = ie;
	}
	public String getIm() {
		return im;
	}
	public void setIm(String im) {
		this.im = im;
	}
	public String getPai() {
		return pai;
	}
	public void setPai(String pai) {
		this.pai = pai;
	}
	public String getMae() {
		return mae;
	}
	public void setMae(String mae) {
		this.mae = mae;
	}
	public List<EnderecoCliente> getEnderecos() {
		return enderecos;
	}
	public void setEnderecos(List<EnderecoCliente> enderecos) {
		this.enderecos = enderecos;
	}
	public String getObs() {
		return obs;
	}
	public void setObs(String obs) {
		this.obs = obs;
	}
	public String getAviso() {
		return aviso;
	}
	public void setAviso(String aviso) {
		this.aviso = aviso;
	}
	public String getRg() {
		return rg;
	}
	public void setRg(String rg) {
		this.rg = rg;
	}
	

}
