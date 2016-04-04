package model.pendiente;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import model.recorrido.Recorrido;
import model.usuario.Usuario;

@Entity
public class UsuarioPendiente {
	@Id
	@GeneratedValue
	private Long id;
	@ManyToOne
	private Usuario usuario;
	@ManyToOne
	private Recorrido recorrido;
	
	
	
	
	
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public Recorrido getRecorrido() {
		return recorrido;
	}
	public void setRecorrido(Recorrido recorrido) {
		this.recorrido = recorrido;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

}
