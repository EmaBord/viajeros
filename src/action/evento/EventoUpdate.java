package action.evento;
import model.evento.Evento;
import org.apache.struts2.ServletActionContext;
import template.method.TemplateMethod;
import dao.evento.EventoDAO;
public class EventoUpdate extends TemplateMethod{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private EventoDAO eventoDAO;
	private String clave;
	private String nombre;
	private String fecha;
	private String sitioweb;
	private String lugar;
	private String hora;
	public String execute() {
		String result = "";
		result = this.verifyUserAdmin();
		if (result.equals("200")){
				addData("eventos", eventoDAO.list());
				if (isValid()){					
					Long id = new Long(getClave());
					Evento e = eventoDAO.getEvento(id);					
					e.setLugar(getLugar());
					e.setNombre(getNombre());
					e.setSitio_web(getSitioweb());
					this.reformat();
					e.setFecha(getFecha());
					e.setHora(getHora());
					e.setUsuario(getUsuario());
					eventoDAO.update(e);					
					addMessage("update_evento", "Se ha modificado correctamente el evento");
					addData("eventos", eventoDAO.list());
					return SUCCESS;					
				}else
					addMessage("update_evento_error", "Deben completarse todos los campos excepto sitio web!");
					
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

	private void setClave(String clave) {
		this.clave = clave;
		
	}
	private String getClave() {
		setClave(ServletActionContext.getRequest().getParameter("clave"));
		return clave;
		
	}

	private boolean isValid() {
		// TODO Auto-generated method stub
		return getNombre() != null  && getFecha()!=null && getLugar() != null;
	}
	
	
	
	public EventoDAO getEventoDAO() {
		return eventoDAO;
	}
	public void setEventoDAO(EventoDAO eventoDAO) {
		this.eventoDAO = eventoDAO;
	}
	
	private void reformat(){
		System.out.println("Fecha:" +fecha);
		String[] r = this.fecha.split("/");
		this.setFecha (r[2].split(" ")[0]+"/"+r[1]+"/"+r[0]);
		this.setHora(r[2].split(" ")[1]);

		
		
	}
}
