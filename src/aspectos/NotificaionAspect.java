package aspectos;

import model.pendiente.UsuarioPendiente;
import model.recorrido.Recorrido;
import model.usuario.Usuario;

import org.apache.struts2.ServletActionContext;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.stereotype.Component;

import services.mail.MailService;
import dao.pendiente.UsuarioPendienteDAO;
import dao.recorrido.RecorridoDAO;

@Configurable
@Component
@Aspect
public class NotificaionAspect {

	private RecorridoDAO recorridoDAO;
	private UsuarioPendienteDAO usuarioPendienteDAO;
	private MailService mailService;

	
	
	
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
	
	

}
