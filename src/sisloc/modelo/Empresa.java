package sisloc.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Empresa {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String nomefantasia;
	private String razaosocial;
	private String contrato;
	private String cnpj;
	private String ie;
	private String logradouro;
	private String numero;
	private String bairro;
	private String complemento;
	private String cidade;
	private String uf;
	private String cep;
	private String tel;
	private String email;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNomefantasia() {
		return nomefantasia;
	}
	public void setNomefantasia(String nomefantasia) {
		this.nomefantasia = nomefantasia.toUpperCase();
	}
	public String getRazaosocial() {
		return razaosocial;
	}
	public void setRazaosocial(String razaosocial) {
		this.razaosocial = razaosocial.toUpperCase();
	}
	public String getContrato() {
		return contrato;
	}
	public void setContrato(String contrato) {
		this.contrato = contrato.toUpperCase();
	}
	public String getCnpj() {
		return cnpj;
	}
	public void setCnpj(String cnpj) {
		this.cnpj = cnpj.toUpperCase();
	}
	public String getIe() {
		return ie;
	}
	public void setIe(String ie) {
		this.ie = ie.toUpperCase();
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
	public String getBairro() {
		return bairro;
	}
	public void setBairro(String bairro) {
		this.bairro = bairro.toUpperCase();
	}
	public String getComplemento() {
		return complemento;
	}
	public void setComplemento(String complemento) {
		this.complemento = complemento.toUpperCase();
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel.toUpperCase();
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email.toUpperCase();
	}

}
