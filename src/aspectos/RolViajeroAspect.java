package aspectos;

import javax.servlet.http.HttpSession;

import model.usuario.Usuario;

import org.apache.struts2.ServletActionContext;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;



@Aspect
public class RolViajeroAspect {

	@Around("execution (* action.recorrido.RecorridoAction.*())")
	public String validarUsuarioViajero(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		HttpSession session = ServletActionContext.getRequest().getSession();
		Usuario u = (Usuario) session.getAttribute("usuario");
		if (u != null && u.getRol().getNombre().equals("viajero"))
			return  (String) proceedingJoinPoint.proceed();
		else{
			if (u != null && u.getRol().getNombre().equals("admin"))
					return "admin";
		}
		return "login";
		
		
	}
	@Around("execution (* action.calificacion.CalificacionAction.*())")
	public String validarUsuarioViajeroEnCalificaciones(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		HttpSession session = ServletActionContext.getRequest().getSession();
		Usuario u = (Usuario) session.getAttribute("usuario");
		if (u != null && u.getRol().getNombre().equals("viajero"))
			return  (String) proceedingJoinPoint.proceed();
		else{
			if (u != null && u.getRol().getNombre().equals("admin"))
					return "admin";
		}
		return "login";
		
		
	}
	
	
}
