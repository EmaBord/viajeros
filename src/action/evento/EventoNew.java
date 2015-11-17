package action.evento;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
	Date fecha;
	String sitio_web;
	String lugar;
	private List<Evento> eventos = new ArrayList<Evento>();
	
	public String execute(){
		Map<String, Object> session = ActionContext.getContext().getSession();
		Usuario user = (Usuario) session.get("usuario");		
		if (user == null){
			return "login";
		}else{
			if (!(user.getRol().getNombre().equals("admin"))){
				return "error";
			}else{
				if (getNombre() != null){

					Evento e;

					if (!eventoDAO.existe(getNombre(), getFecha())){
						e = new Evento();
						e.setFecha(getFecha());
						e.setLugar(getLugar());
						e.setNombre(getNombre());
						e.setSitio_web(getSitioWeb());
						e.setUsuario(user);
						eventoDAO.save(e);
						return "add_evento_ok";
					}else
						return "add_evento_existe";
					
				}else{
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
	
	public void setSitioWeb(String sitio_web){
		this.sitio_web = sitio_web;
	}
	public String getSitioWeb(){
		return sitio_web;
	}

	
	public void setNombre(String nombre){
		this.nombre = nombre;
	}
	
	public String getNombre() {
		// TODO Auto-generated method stub
		return nombre;
	}

	
	public void setFecha(String fecha) throws ParseException{
		System.out.println("type "+fecha.getClass());
		System.out.println("value "+ fecha);		
		try {
			this.fecha = new SimpleDateFormat("yyyy/MM/dd hh:mm").parse(fecha);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Date getFecha() {
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
}
