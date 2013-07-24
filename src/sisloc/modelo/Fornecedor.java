package sisloc.modelo;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity
public class Fornecedor implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3248151392754097936L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String nome;
	private String logradouro;
	private String numero;
	private String complemento;
	private String bairro;
	private String cidade;
	private String uf;
	private String cep;
	private String email;
	private String contato;
	private String cpfcnpj;
	private String rep;
	
	
	@OneToMany(cascade=CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn
	private List<TelefoneFornecedor> telefones;
	
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
	public String getLogradouro() {
		return logradouro;
	}
	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro.toUpperCase();
	}
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero.toUpperCase();
	}
	public String getComplemento() {
		return complemento;
	}
	public void setComplemento(String complemento) {
		this.complemento = complemento.toUpperCase();
	}
	public String getBairro() {
		return bairro;
	}
	public void setBairro(String bairro) {
		this.bairro = bairro.toUpperCase();
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade.toUpperCase();
	}
	public String getUf() {
		return uf;
	}
	public void setUf(String uf) {
		this.uf = uf.toUpperCase();
	}
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep.toUpperCase();
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email.toUpperCase();
	}
	public String getContato() {
		return contato;
	}
	public void setContato(String contato) {
		this.contato = contato.toUpperCase();
	}
	public List<TelefoneFornecedor> getTelefones() {
		return telefones;
	}
	public void setTelefones(List<TelefoneFornecedor> telefones) {
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
	

}
