package action.autentication;
import org.apache.struts2.dispatcher.SessionMap;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class Logout extends ActionSupport  {	
	@Override
	public String execute(){
		@SuppressWarnings("rawtypes")
		SessionMap session = (SessionMap) ActionContext.getContext().getSession();
		session.invalidate();
		return "logout";
					
		}


}
