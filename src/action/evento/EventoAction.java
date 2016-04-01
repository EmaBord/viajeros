package action.evento;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import template.method.TemplateMethod;
import model.evento.Evento;

import com.opensymphony.xwork2.conversion.annotations.Conversion;

import dao.evento.EventoDAO;

@Conversion
public class EventoAction extends TemplateMethod {	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private EventoDAO eventoDAO;	
	String nombre;
	String fecha;
	String sitioweb;
	String lugar;
	private List<Evento> eventos = new ArrayList<Evento>();
	String hora;	
	
	public String execute(){
		@SuppressWarnings("unused")
		HttpServletRequest request = ServletActionContext.getRequest();
		String result = "";		
		result = this.verifyUserAdmin();
		if (result.equals("200")){	
				if (this.isValid()){
					Evento e;
					e = new Evento();
					e.setLugar(getLugar());
					e.setNombre(getNombre());
					e.setSitio_web(getSitioweb());
					this.reformat();
					e.setFecha(getFecha());
					e.setHora(getHora());						
					if (!eventoDAO.existe(getNombre(), getFecha(),getLugar(),hora)){						
						e.setUsuario(getUsuario());
						eventoDAO.save(e);	
						addData("eventos", eventoDAO.activos());						
						addMessage("mensaje_nuevo_evento", getText("evento_exito"));
						return "add_evento";
					}else{						
						addMessage("evento_existe",e);
						return "add_evento";
					}					
				}else{
					//addMessage("mensaje_nuevo_evento_error", "Recuerde que debe selecionar la fecha y hora del evento, ingresar el nombre y el lugar ");
					return "add_evento";
				}
				
			}
		return result;
		
	}
	private boolean isValid() {
		// TODO Auto-generated method stub
		return getNombre() != null  && getFecha()!=null && getLugar() != null && !(getFecha().length()==0);
	}
	public String list(){	
		String result = "";
		result = this.verifyUserAdmin();
		if (result.equals("200")){	
			addData("eventos",eventoDAO.activos());
			return SUCCESS;
		}
		return result;
		
		
	}
	public String delete(){	
		String result = "";
		result = this.verifyUserAdmin();
		if (result.equals("200")){	
			String id_parameter = ServletActionContext.getRequest().getParameter("clave");
			System.out.println(id_parameter);
			Long id = new Long(id_parameter);
			Evento evento = eventoDAO.getEvento(id);
			eventoDAO.eliminarEvento(evento);
			addData("eventos",eventoDAO.activos());
			return SUCCESS;
		}
		return result;		
	}
	
	public String update(){	
		String result = "";
		result = this.verifyUserAdmin();
		if (result.equals("200")){	
			if (isValid()){					
				Long id = new Long(ServletActionContext.getRequest().getParameter("clave"));
				Evento e = eventoDAO.getEvento(id);					
				e.setLugar(getLugar());
				e.setNombre(getNombre());
				e.setSitio_web(getSitioweb());
				this.reformat();
				e.setFecha(getFecha());
				e.setHora(getHora());
				e.setUsuario(getUsuario());
				eventoDAO.update(e);					
				addMessage("update_evento", getText("evento_update"));
				addData("eventos", eventoDAO.activos());
				return SUCCESS;					
			}else
				addMessage("update_evento_error", getText("evento_update_error"));		
		}
		return result;		
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




	
	
	public List<Evento> getEventos(){
		return eventos;
	}
	public void setEventos(List<Evento> eventos){
		this.eventos = eventos;
	}
	public EventoDAO getEventoDAO() {
		return eventoDAO;
	}
	public void setEventoDAO(EventoDAO eventoDAO) {
		this.eventoDAO = eventoDAO;
	}
	
	private void reformat(){
		String[] r = this.fecha.split("-");
		this.setFecha (r[2].split(" ")[0]+"-"+r[1]+"-"+r[0]);
		this.setHora(r[2].split(" ")[1]);

		
		
	}
}
