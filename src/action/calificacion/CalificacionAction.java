package action.calificacion;

import model.calificacion.CalificacionBuena;
import model.calificacion.CalificacionMala;
import model.calificacion.CalificacionRegular;
import model.viajero.UsuarioViajero;

import org.apache.struts2.ServletActionContext;

import dao.calificacion.CalificacionBuenaDAO;
import dao.calificacion.CalificacionMalaDAO;
import dao.calificacion.CalificacionRegularDAO;
import dao.viajero.UsuarioViajeroDAO;
import template.method.TemplateMethod;

public class CalificacionAction extends TemplateMethod {
		
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CalificacionMalaDAO calificacionMalaDAO;
	private CalificacionRegularDAO calificacionRegularDAO;
	private CalificacionBuenaDAO calificacionBuenaDAO;
	private UsuarioViajeroDAO usuarioViajeroDAO;
	
	public String calificarOK(){
		String id_parameter = ServletActionContext.getRequest().getParameter("viajero");
		Long id = new Long(id_parameter);
		UsuarioViajero uv = usuarioViajeroDAO.findByKey(id);
		
		if (! this.califico(uv)){
		
			CalificacionBuena cb = new CalificacionBuena();
			cb.setCalificado(uv.getRecorrido().getCreador());
			cb.setCalificador(this.getUsuario());
			cb.setRecorrido(uv.getRecorrido());
			calificacionBuenaDAO.save(cb);
			
		}
		else
			addData("existe", getText("ya_califico"));
		return "ok";
	}
	
	public String calificarReg(){
		String id_parameter = ServletActionContext.getRequest().getParameter("viajero");
		Long id = new Long(id_parameter);
		UsuarioViajero uv = usuarioViajeroDAO.findByKey(id);
		if (! this.califico(uv)){
			CalificacionRegular cb = new CalificacionRegular();
			cb.setCalificado(uv.getRecorrido().getCreador());
			cb.setCalificador(this.getUsuario());
			cb.setRecorrido(uv.getRecorrido());
			calificacionRegularDAO.save(cb);
		
		}else
			addData("existe", getText("ya_califico"));
		return "ok";
			
		
	}
	public String denunciar(){
		return "ok";
	}
	public String calificarMal(){
		String id_parameter = ServletActionContext.getRequest().getParameter("viajero");
		Long id = new Long(id_parameter);
		UsuarioViajero uv = usuarioViajeroDAO.findByKey(id);
		if (!this.califico(uv)){
			CalificacionMala cb = new CalificacionMala();
			cb.setCalificado(uv.getRecorrido().getCreador());
			cb.setCalificador(this.getUsuario());
			cb.setRecorrido(uv.getRecorrido());
			calificacionMalaDAO.save(cb);
		}else
			addData("existe", getText("ya_califico"));
		return "ok";
	}
	
	private Boolean califico(UsuarioViajero uv){
		Boolean existe = calificacionBuenaDAO.existe(uv.getUsuario(),uv.getRecorrido(),uv.getRecorrido().getCreador());
		if (! existe){
			Boolean existe2 = calificacionRegularDAO.existe(uv.getUsuario(),uv.getRecorrido(),uv.getRecorrido().getCreador());
			if (! existe2){
				Boolean existe3 = calificacionMalaDAO.existe(uv.getUsuario(),uv.getRecorrido(),uv.getRecorrido().getCreador());
				if (! existe3)
					return false;
			}
		}
	return true;
	}
	
	
	
	public CalificacionMalaDAO getCalificacionMalaDAO() {
		return calificacionMalaDAO;
	}
	public void setCalificacionMalaDAO(CalificacionMalaDAO calificacionMalaDAO) {
		this.calificacionMalaDAO = calificacionMalaDAO;
	}
	public CalificacionRegularDAO getCalificacionRegularDAO() {
		return calificacionRegularDAO;
	}
	public void setCalificacionRegularDAO(
			CalificacionRegularDAO calificacionRegularDAO) {
		this.calificacionRegularDAO = calificacionRegularDAO;
	}
	public CalificacionBuenaDAO getCalificacionBuenaDAO() {
		return calificacionBuenaDAO;
	}
	public void setCalificacionBuenaDAO(CalificacionBuenaDAO calificacionBuenaDAO) {
		this.calificacionBuenaDAO = calificacionBuenaDAO;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}







	public UsuarioViajeroDAO getUsuarioViajeroDAO() {
		return usuarioViajeroDAO;
	}







	public void setUsuarioViajeroDAO(UsuarioViajeroDAO usuarioViajeroDAO) {
		this.usuarioViajeroDAO = usuarioViajeroDAO;
	}
	

	
}
