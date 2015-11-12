package action.autentication;








import org.apache.struts2.dispatcher.SessionMap;





import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.usuario.UsuarioDAO;


@SuppressWarnings("serial")
public class Logout extends ActionSupport  {
	



	private UsuarioDAO usuarioDAO;
	@Override
	public String execute(){
		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().getSession();
		session.invalidate();
		return "success";
					
		}
		

	
	
	public void setUsuarioDAO(UsuarioDAO usuarioDAO) {
		this.usuarioDAO = usuarioDAO;
		}
	public UsuarioDAO getUsuarioDAO() {
		return this.usuarioDAO ;
		}

}
