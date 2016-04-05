package action.adminViajeros;

import java.util.HashMap;
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
			HashMap<Long, Integer> calificaciones_positivas = new HashMap<Long, Integer>();
			HashMap<Long, Integer> calificaciones_negativas = new HashMap<Long, Integer>();
			HashMap<Long, Integer> denuncias_hechas = new HashMap<Long, Integer>();
			HashMap<Long, Integer> denuncias_recibidas = new HashMap<Long, Integer>();
			for (int i=0; i< viajeros.size();i++){
				Usuario u = viajeros.get(i);
				calificaciones_positivas.put(u.getId(), u.getRecibidasbuenas().size());
				calificaciones_negativas.put(u.getId(), u.getRecibidasmalas().size());
				denuncias_hechas.put(u.getId(), u.getDenunciashechas().size());
				denuncias_recibidas.put(u.getId(), u.getDenunciasrecibidas().size());
			}
			addData("viajeros",viajeros);
			addData("positivas",calificaciones_positivas);
			addData("negativas",calificaciones_negativas);
			addData("d_recibidas",denuncias_recibidas);
			addData("d_hechas",denuncias_hechas);
			return SUCCESS;
		}
		return result;
	}
	
	public String bloquear(){	
		System.out.println(55555);
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
