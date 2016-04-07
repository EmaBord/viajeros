
package model.usuario;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


import model.rol.Rol;

/**
 * Class Usuario
 */
@Entity
public class Usuario {

  //
  // Fields
  //
  @Id
  @GeneratedValue
  private Long id;
  private String nombre;
  private String clave;
  @ManyToOne
  @JoinColumn(name="rol_id")
  private Rol rol;
  private String apellido;
  private String email;
  private String telefono;
  private String profesion;
  private Boolean bloqueado;
  private String ingreso;
 

  
  
  




  
 

  //
  // Constructors
  //
  public Usuario () { 
	  bloqueado = false;
  };
  
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
   * Set the value of clave
   * @param newVar the new value of clave
   */
  public void setClave ( String newVar ) {
    clave = newVar;
  }

  /**
   * Get the value of clave
   * @return the value of clave
   */
  public String getClave ( ) {
    return clave;
  }

  /**
   * Set the value of rol
   * @param newVar the new value of rol
   */
  public void setRol ( Rol newVar ) {
    rol = newVar;
  }

  /**
   * Get the value of rol
   * @return the value of rol
   */
  public Rol getRol ( ) {
   //
    return rol;
  }

  /**
   * Set the value of apellido
   * @param newVar the new value of apellido
   */
  public void setApellido ( String newVar ) {
    apellido = newVar;
  }

  /**
   * Get the value of apellido
   * @return the value of apellido
   */
  public String getApellido ( ) {
    return apellido;
  }

  /**
   * Set the value of email
   * @param newVar the new value of email
   */
  public void setEmail ( String newVar ) {
    email = newVar;
  }

  /**
   * Get the value of email
   * @return the value of email
   */
  public String getEmail ( ) {
    return email;
  }

  /**
   * Set the value of telefono
   * @param newVar the new value of telefono
   */
  public void setTelefono ( String newVar ) {
    telefono = newVar;
  }

  /**
   * Get the value of telefono
   * @return the value of telefono
   */
  public String getTelefono ( ) {
    return telefono;
  }

  /**
   * Set the value of imagen
   * @param newVar the new value of imagen
   */
 
  public Boolean getBloquedo(){
	  return bloqueado;
  }
  public void setBloquedo(Boolean b){
	  bloqueado = b;
  }


public Boolean getBloqueado() {
	return bloqueado;
}

public void setBloqueado(Boolean bloqueado) {
	this.bloqueado = bloqueado;
}




  //
  // Other methods
  //
public Boolean equals(Usuario u){
	return this.getEmail().equals(u.getEmail());
}

public String getProfesion() {
	return profesion;
}

public void setProfesion(String profesion) {
	this.profesion = profesion;
}

public String getIngreso() {
	return ingreso;
}

public void setIngreso(String ingreso) {
	this.ingreso = ingreso;
}



}
