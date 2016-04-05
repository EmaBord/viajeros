package model.calificacion;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToOne;

import model.recorrido.Recorrido;
import model.usuario.Usuario;
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
@Entity
public abstract class Calificacion {
	@Id
    @GeneratedValue(strategy=GenerationType.TABLE)
    private Long id;
	@ManyToOne
	private Usuario calificador;
	@ManyToOne
	private Usuario calificado;
	@ManyToOne
	private Recorrido recorrido;
	
	
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Usuario getCalificador() {
		return calificador;
	}
	public void setCalificador(Usuario calificador) {
		this.calificador = calificador;
	}
	public Usuario getCalificado() {
		return calificado;
	}
	public void setCalificado(Usuario calificado) {
		this.calificado = calificado;
	}
	public Recorrido getRecorrido() {
		return recorrido;
	}
	public void setRecorrido(Recorrido recorrido) {
		this.recorrido = recorrido;
	}
	
	
	

}
