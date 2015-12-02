package action.evento;
import java.util.ArrayList;
import java.util.List;
import template.method.TemplateMethod;
import model.evento.Evento;
import com.opensymphony.xwork2.conversion.annotations.Conversion;
import dao.evento.EventoDAO;

@Conversion
public class EventoNew extends TemplateMethod {	/**
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
						addData("eventos", eventoDAO.list());
						addMessage("mensaje_nuevo_evento", "El evento "+getNombre()+" ha sido agregado con éxito");
						return "add_evento_ok";
					}else{						
						addMessage("evento_existe",e);
						return "add_evento_existe";
					}					
				}else{
					addMessage("mensaje_nuevo_evento_error", "Deben completarse todos los campos excepto sitio web!");
					return "add_evento";
				}
				
			}
		return result;
		
	}
	private boolean isValid() {
		// TODO Auto-generated method stub
		return getNombre() != null  && getFecha()!=null && getLugar() != null;
	}
	public String list(){	
		String result = "";
		result = this.verifyUserAdmin();
		if (result.equals("200")){	
			addData("eventos",eventoDAO.list());
			return SUCCESS;
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
		String[] r = this.fecha.split("/");
		this.setFecha (r[2].split(" ")[0]+"/"+r[1]+"/"+r[0]);
		this.setHora(r[2].split(" ")[1]);

		
		
	}
}
