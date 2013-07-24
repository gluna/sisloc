package sisloc.modelo;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class EnderecoLocacao implements Serializable{

	private static final long serialVersionUID = -8638721379881035286L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String tipoendereco;
	private String logradouro;
	private String numero;
	private String bairro;
	private String complemento;
	private String cidade;
	private String uf;
	private String cep;
	private String contato;
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTipoendereco() {
		return tipoendereco;
	}
	public void setTipoendereco(String tipoendereco) {
		this.tipoendereco = tipoendereco.toUpperCase();
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
	public String getContato() {
		return contato;
	}
	public void setContato(String contato) {
		this.contato = contato.toUpperCase();
	}
	
}
