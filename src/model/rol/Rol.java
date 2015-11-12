package model.rol;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * Class Rol
 */
@Entity
public class Rol {

  //
  // Fields
  //
	
	
  @Id 
  @GeneratedValue
  private Long id;
  private String nombre;
  
  //
  // Constructors
  //
  public Rol () { };
  
  //
  // Methods
  //


  //
  // Accessor methods
  //

  /**
   * Set the value of id
   * @param newVar the new value of id
   */
  public void setId ( Long newVar ) {
    id = newVar;
  }

  /**
   * Get the value of id
   * @return the value of id
   */
  public Long getId ( ) {
    return id;
  }

  /**
   * Set the value of nombre
   * @param newVar the new value of nombre
   */
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

  //
  // Other methods
  //

}
