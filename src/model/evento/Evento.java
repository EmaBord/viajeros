package model.evento;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import model.usuario.Usuario;






/**
 * Class Evento
 */
@Entity
public class Evento {

  //
  // Fields
  //
	@Id @GeneratedValue
  private Long id;
  private String nombre;
  private String fecha;
  private String hora;
  private String sitio_web;
  private String lugar;
  @ManyToOne
  @JoinColumn(name="usuario_id")
  private Usuario usuario;
  private boolean eliminado;
  
  public boolean getEliminado() {
	return eliminado;
}

public void setEliminado(boolean activo) {
	this.eliminado = activo;
}

//
  // Constructors
  //
  public Evento () { };
  
  //
  // Methods
  //


  //
  // Accessor methods
  //

  /**
   * Set the value of nombre
   * @param newVar the new value of nombre
   */
   public void setId(Long id){
	  this.id = id;
	  
  }
  public Long getId(){
	  return this.id;
  }
  public void setNombre ( String newVar ) {
    nombre = newVar;
  }

  /**
   * Get the value of nombre
   * @return the value of nombre
   */
  public String getNombre ( ) {
    return nombre;
  }

  /**
   * Set the value of fecha
   * @param newVar the new value of fecha
   */
  public void setFecha ( String newVar ) {
    fecha = newVar;
  }

  /**
   * Get the value of fecha
   * @return the value of fecha
   */
  public String getFecha ( ) {
    return fecha;
  }

  /**
   * Set the value of hora
   * @param newVar the new value of hora
   */


  /**
   * Set the value of sitio_web
   * @param newVar the new value of sitio_web
   */
  public void setSitio_web ( String newVar ) {
    sitio_web = newVar;
  }

  /**
   * Get the value of sitio_web
   * @return the value of sitio_web
   */
  public String getSitio_web ( ) {
    return sitio_web;
  }

  /**
   * Set the value of lugar
   * @param newVar the new value of lugar
   */
  public void setLugar ( String newVar ) {
    lugar = newVar;
  }

  /**
   * Get the value of lugar
   * @return the value of lugar
   */
  public String getLugar ( ) {
    return lugar;
  }

public Usuario getUsuario() {
	return usuario;
}

public void setUsuario(Usuario usuario) {
	this.usuario = usuario;
}

public String getHora() {
	return hora;
}

public void setHora(String hora) {
	this.hora = hora;
}

  //
  // Other methods
  //

}
