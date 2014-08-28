package sisloc.modelo;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Equipamento implements Serializable{
	
	private static final long serialVersionUID = -2257876564571767612L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String numserie;
	private String notafiscal;
	private String patrimonio;
	private String marca;
	private Double valorcompra;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn
	private TipoEquipamento tipoequipamento;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn
	private Fornecedor fornecedor;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNumserie() {
		return numserie;
	}
	public void setNumserie(String numserie) {
		this.numserie = numserie;
	}
	public String getNotafiscal() {
		return notafiscal;
	}
	public void setNotafiscal(String notafiscal) {
		this.notafiscal = notafiscal;
	}
	public String getPatrimonio() {
		return patrimonio;
	}
	public void setPatrimonio(String patrimonio) {
		this.patrimonio = patrimonio;
	}
	public String getMarca() {
		return marca;
	}
	public void setMarca(String marca) {
		this.marca = marca;
	}
	public Double getValorcompra() {
		return valorcompra;
	}
	public void setValorcompra(Double valorcompra) {
		this.valorcompra = valorcompra;
	}
	public TipoEquipamento getTipoequipamento() {
		return tipoequipamento;
	}
	public void setTipoequipamento(TipoEquipamento tipoequipamento) {
		this.tipoequipamento = tipoequipamento;
	}
	public Fornecedor getFornecedor() {
		return fornecedor;
	}
	public void setFornecedor(Fornecedor fornecedor) {
		this.fornecedor = fornecedor;
	}
	

}
