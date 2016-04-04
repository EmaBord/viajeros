package action.admin;

import model.rol.Rol;
import model.usuario.Usuario;
import dao.rol.RolDAO;
import dao.usuario.UsuarioDAO;
import template.method.TemplateMethod;

public class AdminAction extends TemplateMethod{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String nombre;
	private String apellido;
	private String email;
	private String clave;
	private String clave2;
	private UsuarioDAO usuarioDAO;
	private RolDAO rolDAO;
	
	public String crear_admin(){
		String result = this.verifyUserAdmin();
		if (result.equals("200"))
			return "ok";
		return "error";
	}
	public String nuevo_admin(){
		String result = this.verifyUserAdmin();
		if (result.equals("200")){
			if (usuarioDAO.existe(this.getEmail())){
				updateSession();
				addData("existe", getText("existe_email"));
				return "existe";
			}
			Usuario u = new Usuario();
			u.setNombre(this.getNombre());
			u.setApellido(this.getApellido());
			u.setClave(this.getClave());
			u.setEmail(this.getEmail());
			Rol rol = rolDAO.getRol("admin");
			u.setRol(rol);
			usuarioDAO.save(u);
			updateSession();
			addData("exito", getText("exito_add_admin"));
			return "exito";
		}
		return "error";
	}
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
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
	public UsuarioDAO getUsuarioDAO() {
		return usuarioDAO;
	}
	public void setUsuarioDAO(UsuarioDAO usuarioDAO) {
		this.usuarioDAO = usuarioDAO;
	}
	public RolDAO getRolDAO() {
		return rolDAO;
	}
	public void setRolDAO(RolDAO rolDAO) {
		this.rolDAO = rolDAO;
	}
	
	

}
