package aspectos;


import java.util.List;

import model.pendiente.UsuarioPendiente;
import model.recorrido.Recorrido;
import model.usuario.Usuario;
import model.viajero.UsuarioViajero;

import org.apache.struts2.ServletActionContext;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.stereotype.Component;

import services.mail.MailService;
import dao.pendiente.UsuarioPendienteDAO;
import dao.recorrido.RecorridoDAO;
import dao.usuario.UsuarioDAO;
import dao.viajero.UsuarioViajeroDAO;

@Configurable
@Component
@Aspect
public class NotificaionAspect {

	private RecorridoDAO recorridoDAO;
	private UsuarioPendienteDAO usuarioPendienteDAO;
	private MailService mailService;
	private UsuarioViajeroDAO usuarioViajeroDAO;
	private UsuarioDAO usuarioDAO;

	
	
	
	@Around("execution (* action.recorrido.RecorridoAction.subir())")
	public String NoficacionSubir(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		String result = (String) proceedingJoinPoint.proceed();
		if (result.equals("ok")){
			String id_parameter = ServletActionContext.getRequest().getParameter("recorrido");
			Long id = new Long(id_parameter);
			Recorrido recorrido = recorridoDAO.findByKey(id);
			
			Usuario viajero = (Usuario) ServletActionContext.getRequest().getSession().getAttribute("usuario");
			mailService.sendMail("info.infopool@gmail.com",
								recorrido.getCreador().getEmail(),
								"Participacion pendiente",
								"El usuario "+ viajero.getNombre() +" "+viajero.getApellido() +" quiere participar del viaje "+ recorrido.getDesde()+"-"+recorrido.getHasta());
			
		}
		return result;
	
	}
	
	@Around("execution (* action.recorrido.RecorridoAction.aceptarUsuario())")
	public String NoficacionAceptarUsuario(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		String id_parameter = ServletActionContext.getRequest().getParameter("clave");
		Long id = new Long(id_parameter);
		UsuarioPendiente usuarioPendiente = usuarioPendienteDAO.findByKey(id);
		String email = usuarioPendiente.getUsuario().getEmail();
		Recorrido recorrido = usuarioPendiente.getRecorrido();
		String result = (String) proceedingJoinPoint.proceed();
		if (result.equals("ok")){			
			
			mailService.sendMail("info.infopool@gmail.com",
								email,
								"Aceptación en viaje",
								"El usuario "+ recorrido.getCreador().getNombre() +" "+recorrido.getCreador().getApellido() +" te ha aceptado en el viaje "+ recorrido.getDesde()+"-"+recorrido.getHasta());
			
		}
		return result;
	
	}

	@Around("execution (* action.recorrido.RecorridoAction.rechazarUsuario())")
	public String NoficacionRezchazarUsuario(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		String id_parameter = ServletActionContext.getRequest().getParameter("clave");
		Long id = new Long(id_parameter);
		UsuarioPendiente usuarioPendiente = usuarioPendienteDAO.findByKey(id);
		String email = usuarioPendiente.getUsuario().getEmail();
		Recorrido recorrido = usuarioPendiente.getRecorrido();
		String result = (String) proceedingJoinPoint.proceed();
		if (result.equals("ok")){		
			
			mailService.sendMail("info.infopool@gmail.com",
								email,
								"Participación rechazada",
								"El usuario "+ recorrido.getCreador().getNombre() +" "+recorrido.getCreador().getApellido() +" te ha rechazado en el viaje "+ recorrido.getDesde()+"-"+recorrido.getHasta());
			
		}
		return result;
	
	}
	@Around("execution (* action.recorrido.RecorridoAction.eliminar())")
	public String NoficacionEliminarViaje(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		String id_parameter = ServletActionContext.getRequest().getParameter("clave");
		Long id = new Long(id_parameter);
		Recorrido recorrido = recorridoDAO.findByKey(id);
		String desde = recorrido.getDesde();
		String hasta = recorrido.getHasta();
		List<UsuarioPendiente> usuariosPendientes = usuarioPendienteDAO.getUser(recorrido.getId());
		List<UsuarioViajero>  usuariosViajeros = usuarioViajeroDAO.getUser(recorrido.getId());
		String [] emails = new String [usuariosPendientes.size()+ usuariosViajeros.size()];
		int i = 0;
		for (UsuarioPendiente u:usuariosPendientes){
			emails[i] = u.getUsuario().getEmail();
			i++;
		}
		for (UsuarioViajero u:usuariosViajeros){
			emails[i] = u.getUsuario().getEmail();
			i++;
		}
		
		String result = (String) proceedingJoinPoint.proceed();
		if (result.equals("ok")){	
			mailService.sendMailBcc("info.infopool@gmail.com",
								   emails,
								   "Viaje cancelado",
								   "Se ha cancelado el viaje "+ desde+"-"+hasta );
			
		}
		return result;
	
	}
	
	
	
	@Around("execution (* action.adminViajeros.AdminViajerosAction.bloquear())")
	public String NoficacionUsuarioBloqueado(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		String id_parameter = ServletActionContext.getRequest().getParameter("clave");
		Long idUsuarioBloqueado = new Long(id_parameter);
		String result = (String) proceedingJoinPoint.proceed();
		if (result.equals("ok")){
			String emailUsuarioBloqueado = usuarioDAO.findByKey(idUsuarioBloqueado).getEmail();
			List<Recorrido> recorridos = recorridoDAO.findByUser(idUsuarioBloqueado);
			for (Recorrido recorrido:recorridos){
				List<UsuarioPendiente> usuariosPendientes = usuarioPendienteDAO.getUser(recorrido.getId());
				List<UsuarioViajero>  usuariosViajeros = usuarioViajeroDAO.getUser(recorrido.getId());
				String [] emailsArray = new String [usuariosPendientes.size()+usuariosViajeros.size()];
				int i = 0;
				for (UsuarioPendiente u:usuariosPendientes){
					emailsArray[i] = u.getUsuario().getEmail();
					i++;
				}
				for (UsuarioViajero u:usuariosViajeros){
					emailsArray[i] = u.getUsuario().getEmail();
					i++;
				}	
				mailService.sendMailBcc("info.infopool@gmail.com",
						   emailsArray,
						   "Viaje cancelado",
						   "Se ha suspendido el viaje "+ recorrido.getDesde()+"-"+recorrido.getHasta() );
			}			
			mailService.sendMail("info.infopool@gmail.com",
								  emailUsuarioBloqueado,
								  "Cuenta suspendida",
								  "Su cuenta ha sido suspendida por no cumplir con las politicas del sitio"								  
					
								);
			
			
		}
		return result;
	
	}
	
	@Around("execution (* action.adminViajeros.AdminViajerosAction.desbloquear())")
	public String NoficacionUsuarioDesbloqueado(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		String id_parameter = ServletActionContext.getRequest().getParameter("clave");
		Long idUsuarioBloqueado = new Long(id_parameter);
		String result = (String) proceedingJoinPoint.proceed();
		if (result.equals("ok")){
			String emailUsuarioBloqueado = usuarioDAO.findByKey(idUsuarioBloqueado).getEmail();
			mailService.sendMail("info.infopool@gmail.com",
					  emailUsuarioBloqueado,
					  "Cuenta reestablecida",
					  "Su cuenta ha sido reestablecida luego de verificar su reclamo."								  
		
					);
		
	    
		}
		return result;
	}
	



	public RecorridoDAO getRecorridoDAO() {
		return recorridoDAO;
	}




	public void setRecorridoDAO(RecorridoDAO recorridoDAO) {
		this.recorridoDAO = recorridoDAO;
	}




	public MailService getMailService() {
		return mailService;
	}




	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}

	public UsuarioPendienteDAO getUsuarioPendienteDAO() {
		return usuarioPendienteDAO;
	}

	public void setUsuarioPendienteDAO(UsuarioPendienteDAO usuarioPendienteDAO) {
		this.usuarioPendienteDAO = usuarioPendienteDAO;
	}

	public UsuarioViajeroDAO getUsuarioViajeroDAO() {
		return usuarioViajeroDAO;
	}

	public void setUsuarioViajeroDAO(UsuarioViajeroDAO usuarioViajeroDAO) {
		this.usuarioViajeroDAO = usuarioViajeroDAO;
	}

	public UsuarioDAO getUsuarioDAO() {
		return usuarioDAO;
	}

	public void setUsuarioDAO(UsuarioDAO usuarioDAO) {
		this.usuarioDAO = usuarioDAO;
	}
	
	

}
