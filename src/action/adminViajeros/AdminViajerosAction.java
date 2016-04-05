package action.adminViajeros;

import java.util.HashMap;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import model.usuario.Usuario;
import dao.calificacion.CalificacionBuenaDAO;
import dao.calificacion.CalificacionMalaDAO;
import dao.calificacion.CalificacionRegularDAO;
import dao.usuario.UsuarioDAO;
import template.method.TemplateMethod;

public class AdminViajerosAction extends TemplateMethod {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UsuarioDAO usuarioDAO;
	private CalificacionBuenaDAO calificacionBuenaDAO;
	private CalificacionRegularDAO calificacionRegularDAO;
	private CalificacionMalaDAO calificacionMalaDAO;
	
	public String execute(){
		return SUCCESS;
	}
	
	
	public String list(){
		String result = "";
		result = this.verifyUserAdmin();
		if (result.equals("200")){
			List<Usuario> viajeros = getViajeros(getUsuarioDAO());
			HashMap<Long, Integer> calificaciones_positivas = new HashMap<Long, Integer>();
			HashMap<Long, Integer> calificaciones_negativas = new HashMap<Long, Integer>();
			HashMap<Long, Integer> calificaciones_regulares = new HashMap<Long, Integer>();

			for (int i=0; i< viajeros.size();i++){
				Usuario u = viajeros.get(i);
				calificaciones_positivas.put(u.getId(), calificacionBuenaDAO.getCalificaciones(u).size());
				calificaciones_negativas.put(u.getId(),calificacionMalaDAO.getCalificaciones(u).size());
				calificaciones_regulares.put(u.getId(),calificacionRegularDAO.getCalificaciones(u).size());

			}
			addData("viajeros",viajeros);
			addData("positivas",calificaciones_positivas);
			addData("negativas",calificaciones_negativas);
			addData("regulares",calificaciones_negativas);

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


	public CalificacionBuenaDAO getCalificacionBuenaDAO() {
		return calificacionBuenaDAO;
	}


	public void setCalificacionBuenaDAO(CalificacionBuenaDAO calificacionBuenaDAO) {
		this.calificacionBuenaDAO = calificacionBuenaDAO;
	}


	public CalificacionRegularDAO getCalificacionRegularDAO() {
		return calificacionRegularDAO;
	}


	public void setCalificacionRegularDAO(
			CalificacionRegularDAO calificacionRegularDAO) {
		this.calificacionRegularDAO = calificacionRegularDAO;
	}


	public CalificacionMalaDAO getCalificacionMalaDAO() {
		return calificacionMalaDAO;
	}


	public void setCalificacionMalaDAO(CalificacionMalaDAO calificacionMalaDAO) {
		this.calificacionMalaDAO = calificacionMalaDAO;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
	
	

}
