package template.method;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import model.usuario.Usuario;

public class TemplateMethod extends ActionSupport{	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String verifyUserAdmin(){
		this.updateSession();
		Usuario u = getUsuario();
		if (u == null)
			return "login";
		else
			if (!(u.getRol().getNombre().equals("admin")))
				return "error";
			
		return "200";		
	}
	
	public void updateSession(){
		Map<String, Object> session = ActionContext.getContext().getSession();
		session.remove("evento");
		session.remove("eventos");
		session.remove("mensaje_nuevo_evento");
		session.remove("update_evento");			
		session.remove("mensaje_nuevo_evento_error");
		session.remove("update_evento_error");
		
	}
	public Usuario getUsuario(){
		Map<String, Object> session = ActionContext.getContext().getSession();
		Usuario user = (Usuario) session.get("usuario");	
		return user;
		
		
	}
	public Map<String,Object> getSession(){
		Map<String, Object> session = ActionContext.getContext().getSession();
		return session;
	}
	
	public void addMessage(String value,Object o){
		Map<String, Object> session = ActionContext.getContext().getSession();
		session.put(value,o);
		
	}
	public void addData(String value,Object o){
		Map<String, Object> session = ActionContext.getContext().getSession();
		session.put(value,o);
		
	}
	

}
