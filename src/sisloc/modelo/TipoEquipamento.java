package sisloc.modelo;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class TipoEquipamento implements Serializable{

	private static final long serialVersionUID = -7040579309666380236L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String descricao; //nome do tipo
	private Double valordia;
	private Double valormes;
	private Double valorquinzena;
	private Double valorsemana;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public Double getValordia() {
		return valordia;
	}
	public void setValordia(Double valordia) {
		this.valordia = valordia;
	}
	public Double getValormes() {
		return valormes;
	}
	public void setValormes(Double valormes) {
		this.valormes = valormes;
	}
	public Double getValorquinzena() {
		return valorquinzena;
	}
	public void setValorquinzena(Double valorquinzena) {
		this.valorquinzena = valorquinzena;
	}
	public Double getValorsemana() {
		return valorsemana;
	}
	public void setValorsemana(Double valorsemana) {
		this.valorsemana = valorsemana;
	}

}
