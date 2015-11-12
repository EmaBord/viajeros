package action.home;
 

import com.opensymphony.xwork2.ActionSupport;
public class Home extends ActionSupport{	
	private String mensaje;

    public String getMensaje()
    {
        return mensaje;
    }
	private static final long serialVersionUID = 1L;

	public String execute() {
		
	return SUCCESS;
	}
	

}
