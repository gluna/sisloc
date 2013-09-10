package sisloc.modelo;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Preco implements Serializable, Comparable<Preco>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3234522496133119695L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private Integer dias;
	private Double preco;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Integer getDias() {
		return dias;
	}
	public void setDias(Integer dias) {
		this.dias = dias;
	}
	public Double getPreco() {
		return preco;
	}
	public void setPreco(Double preco) {
		this.preco = preco;
	}
	@Override
	public int compareTo(Preco preco) {
        if(this.dias > preco.dias){
            return 1;
        }
        else if(this.dias < preco.dias){
            return -1;
        }
        return this.getPreco().compareTo(preco.getPreco());
    }

}
