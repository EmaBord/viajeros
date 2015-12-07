package action.adminViajeros;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import model.usuario.Usuario;
import dao.usuario.UsuarioDAO;
import template.method.TemplateMethod;

public class AdminViajerosAction extends TemplateMethod {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UsuarioDAO usuarioDAO;
	
	public String execute(){
		return SUCCESS;
	}
	
	
	public String list(){
		String result = "";
		result = this.verifyUserAdmin();
		if (result.equals("200")){
			List<Usuario> viajeros = getViajeros(getUsuarioDAO());
			addData("viajeros",viajeros);
			
			return SUCCESS;
		}
		return result;
	}
	
	public String bloquear(){	
		String result = "";
		result = this.verifyUserAdmin();
		if (result.equals("200")){	
			String id_parameter = ServletActionContext.getRequest().getParameter("clave");
			Long id = new Long(id_parameter);
			Usuario usuario = usuarioDAO.findByKey(id);
			usuarioDAO.eliminarUsuario(usuario);
			List<Usuario> viajeros = getViajeros(getUsuarioDAO());
			addData("viajeros",viajeros);
			return SUCCESS;
		}
		return result;		
	}
	
	public String desbloquear(){	
		String result = "";
		result = this.verifyUserAdmin();
		if (result.equals("200")){	
			String id_parameter = ServletActionContext.getRequest().getParameter("clave");
			Long id = new Long(id_parameter);
			Usuario usuario = usuarioDAO.findByKey(id);
			usuario.setBloquedo(false);
			usuarioDAO.update(usuario);
			List<Usuario> viajeros = getViajeros(getUsuarioDAO());
			addData("viajeros",viajeros);
			return SUCCESS;
		}
		return result;		
	}
	

	public UsuarioDAO getUsuarioDAO() {
		return usuarioDAO;
	}

	public void setUsuarioDAO(UsuarioDAO usuarioDAO) {
		this.usuarioDAO = usuarioDAO;
	}
	
	
	
	
	
	

}
