package action.perfil;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import dao.usuario.UsuarioDAO;
import template.method.TemplateMethod;

public class PerfilAction extends TemplateMethod{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String nombre;
	private String apellido;
	private String telefono;
	private String clave;
	private String clave2;
	private String profesion;
	private UsuarioDAO usuarioDAO;
	
	
	
	public String perfil(){
		if (this.getUsuario()!= null)
			return this.getUsuario().getRol().getNombre();
		return "login";
	}
	
	public String actualizar() throws NoSuchAlgorithmException{
		if (this.getUsuario()== null)
			return "login";
		
		this.getUsuario().setApellido(this.getApellido());
		this.getUsuario().setNombre(this.getNombre());
		this.getUsuario().setTelefono(this.getTelefono());
		if (this.getClave() != null && ! this.getClave().equals("") && this.getClave2() != null && ! this.getClave2().equals("")){
			if (this.getClave().equals(this.getClave2()))
				this.getUsuario().setClave(this.md5(this.getClave()));
			else
				addData("claves_no_coinciden", getText("claves_no_coinciden"));
		}
		this.getUsuario().setProfesion(this.getProfesion());
		usuarioDAO.update(this.getUsuario());
		return this.getUsuario().getRol().getNombre();
	
	}	



	public String getNombre() {
		return nombre;
	}



	public void setNombre(String nombre) {
		this.nombre = nombre;
	}



	public String getApellido() {
		return apellido;
	}



	public void setApellido(String apellido) {
		this.apellido = apellido;
	}



	public String getTelefono() {
		return telefono;
	}



	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}



	public String getClave() {
		return clave;
	}



	public void setClave(String clave) {
		this.clave = clave;
	}



	public String getClave2() {
		return clave2;
	}



	public void setClave2(String clave2) {
		this.clave2 = clave2;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public UsuarioDAO getUsuarioDAO() {
		return usuarioDAO;
	}

	public void setUsuarioDAO(UsuarioDAO usuarioDAO) {
		this.usuarioDAO = usuarioDAO;
	}

	public String getProfesion() {
		return profesion;
	}

	public void setProfesion(String profesion) {
		this.profesion = profesion;
	}
private String md5(String word) throws NoSuchAlgorithmException{
		
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(word.getBytes());
        
        byte byteData[] = md.digest();
 
        //convert the byte to hex format method 1
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }
        return sb.toString();
     
	}
	
	
	
	
	

}
