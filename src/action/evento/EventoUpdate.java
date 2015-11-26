package action.evento;
import java.util.Map;
import org.apache.struts2.ServletActionContext;
import model.evento.Evento;
import model.usuario.Usuario;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import dao.evento.EventoDAO;

public class EventoUpdate implements Action{
	private EventoDAO eventoDAO;
	private String clave;
	private String nombre;
	private String fecha;
	private String sitioweb;
	private String lugar;
	private String hora;
	public String execute() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		Usuario user = (Usuario) session.get("usuario");		
		if (user == null){
			return "login";
		}else{
			if (!(user.getRol().getNombre().equals("admin"))){
				return "error";
			}else{
				if (getNombre() != null  && getFecha()!=null && getLugar() != null){					
					Long id = new Long(getClave());
					Evento e = eventoDAO.getEvento(id);					
					e.setLugar(getLugar());
					e.setNombre(getNombre());
					e.setSitio_web(getSitioweb());
					this.reformat();
					e.setFecha(getFecha());
					e.setHora(getHora());
					e.setUsuario(user);
					eventoDAO.update(e);
					session.remove("update_evento");
					session.put("update_evento", "Se ha modificado correctamente el evento");
					session.put("eventos", eventoDAO.list());
					return SUCCESS;					
				}
			}
		}
		return NONE;	
				
	}
	
	public void setLugar(String lugar){
		this.lugar = lugar;
	}
	public String getLugar(){
		return lugar;
	}
	
	public void setSitioweb(String sitio_web){
		this.sitioweb = sitio_web;
	}
	public String getSitioweb(){
		return sitioweb;
	}

	
	public void setNombre(String nombre){
		this.nombre = nombre;
	}
	
	public String getNombre() {
		// TODO Auto-generated method stub
		return nombre;
	}

	

	public void setFecha(String fecha){
			this.fecha = fecha;
			
	}

	private void setHora(String hora) {
		this.hora = hora;
		
	}
	private String getHora() {
		return hora;
		
	}
	public String getFecha() {
		// TODO Auto-generated method stub
		return fecha;
	}

	private void setClave(String clave) {
		this.clave = clave;
		
	}
	private String getClave() {
		setClave(ServletActionContext.getRequest().getParameter("clave"));
		return clave;
		
	}


	
	
	
	public EventoDAO getEventoDAO() {
		return eventoDAO;
	}
	public void setEventoDAO(EventoDAO eventoDAO) {
		this.eventoDAO = eventoDAO;
	}
	
	private void reformat(){
		String[] r = this.fecha.split("/");
		this.setFecha (r[2].split(" ")[0]+"/"+r[1]+"/"+r[0]);
		this.setHora(r[2].split(" ")[1]);

		
		
	}
}
