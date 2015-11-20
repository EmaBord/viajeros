package action.evento;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import model.evento.Evento;
import model.usuario.Usuario;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.conversion.annotations.Conversion;

import dao.evento.EventoDAO;

@Conversion
public class EventoNew extends ActionSupport{	/**
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
	
	
	public String execute() throws ParseException{
		Map<String, Object> session = ActionContext.getContext().getSession();
		Usuario user = (Usuario) session.get("usuario");		
		if (user == null){
			return "login";
		}else{
			if (!(user.getRol().getNombre().equals("admin"))){
				return "error";
			}else{
				if (getNombre() != null  && getFecha()!=null && getLugar() != null){

					Evento e;
					e = new Evento();
					e.setLugar(getLugar());
					e.setNombre(getNombre());
					e.setSitio_web(getSitioweb());
					this.reformat();
					e.setFecha(getFecha());
					e.setHora(getHora());
					if (!eventoDAO.existe(getNombre(), getFecha(),getLugar(),hora)){						
						e.setUsuario(user);
						eventoDAO.save(e);
						session.put("eventos", eventoDAO.list());
						session.put("mensaje", "El evento "+getNombre()+" ha sido agregado con éxito");
						session.remove("evento");
						return "add_evento_ok";
					}else{
						session.remove("mensaje");
						session.put("evento",e);
						return "add_evento_existe";
					}
					
				}else{
					session.remove("evento");
					session.remove("mensaje");
					return "add_evento";
					
				}
				
			}
		}
		
	}
	public String list(){	
		Map<String, Object> session = ActionContext.getContext().getSession();
		Usuario user = (Usuario) session.get("usuario");		
		if (user == null){
			return "login";
		}else{
			if (!(user.getRol().getNombre().equals("admin"))){
				return "error";
			}else{
				setEventos(eventoDAO.list()); 
				return "success";
			}
		}
		
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
		String[] r = this.fecha.split("/");
		this.setFecha (r[2].split(" ")[0]+"/"+r[1]+"/"+r[0]);
		this.setHora(r[2].split(" ")[1]);

		
		
	}
}
