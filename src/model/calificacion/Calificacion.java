package model.calificacion;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
@Entity
public class Calificacion {
	@Id
    @GeneratedValue
    private Long id;
	private String comentario;
	private boolean buena;
	
	public Calificacion(){}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getComentario() {
		return comentario;
	}
	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
	
	public boolean isBuena() {
		return buena;
	}
	public void setBuena(boolean buena) {
		this.buena = buena;
	}

}
