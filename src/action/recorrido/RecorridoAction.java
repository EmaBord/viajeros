package action.recorrido;




import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import template.method.TemplateMethod;
import model.evento.Evento;
import model.recorrido.Recorrido;
import model.recorrido.RecorridoMasUnDia;
import model.recorrido.RecorridoUnico;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.conversion.annotations.Conversion;

import dao.evento.EventoDAO;
import dao.recorrido.RecorridoDAO;
import dao.recorrido.RecorridoMasDeUnDiaDAO;
import dao.recorrido.RecorridoUnicoDAO;

@Conversion
public class RecorridoAction extends TemplateMethod {	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private EventoDAO eventoDAO;
	private RecorridoDAO recorridoDAO;
	private RecorridoUnicoDAO recorridoUnicoDAO;
	private RecorridoMasDeUnDiaDAO recorridoMasUnDiaDAO;
	String salida;
	String desde;
	String llegada;
	String hasta;
	String ruta;
	String periodicidad;
	String evento;
	String [] dias;
	String finaliza;
	String [] nopermitido;
	String asientos;
	
	
	
	public String execute(){
		addData("eventos", eventoDAO.activos());
		return "add_recorrido";
		
	}
	public String mis_viajes(){
		//addData("eventos", eventoDAO.activos());
		return "ok";
		
	}
	public String timeline(){
		addData("recorridosUnicos", recorridoUnicoDAO.activosSinUsuario(this.getUsuario()));
		addData("recorridos", recorridoMasUnDiaDAO.activosSinUsuario(this.getUsuario()));
		return "ok";
	}
	public String new_recorrido(){	
		String result = "add_recorrido";
		HttpServletRequest request = ServletActionContext.getRequest();
		if (!request.getMethod().equals("POST"))
            return Action.ERROR;
		if (this.getPeriodicidad().equals("0"))
			return this.crear_viaje_unico();
		else
			if (this.getPeriodicidad().equals("1"))
				return this.crear_viaje_mas_de_un_dia();
		
		return result;
		
		
	}
	private String crear_viaje_mas_de_un_dia() {
		RecorridoMasUnDia recorrido = new RecorridoMasUnDia();
		this.cargar_datos(recorrido);
		recorrido.setFinaliza(this.getFinaliza());
		recorrido.setDias(this.getDias());
		recorridoDAO.save(recorrido);
		addData("recorridosUnicos", recorridoUnicoDAO.activosSinUsuario(this.getUsuario()));
		addData("recorridos", recorridoMasUnDiaDAO.activosSinUsuario(this.getUsuario()));
		return "home";
		
	}
	private String crear_viaje_unico() {
		RecorridoUnico recorrido = new RecorridoUnico();
		this.cargar_datos(recorrido);
		recorridoDAO.save(recorrido);
		addData("recorridosUnicos", recorridoUnicoDAO.activosSinUsuario(this.getUsuario()));
		addData("recorridos", recorridoMasUnDiaDAO.activosSinUsuario(this.getUsuario()));
		return "home";
	}
	
	private void cargar_datos(Recorrido recorrido){
		recorrido.setSalida(this.getSalida());
		recorrido.setDesde(this.getDesde());
		recorrido.setLlegada(this.getLlegada());
		recorrido.setHasta(this.getHasta());
		recorrido.setAsientos(new Integer(this.getAsientos()));
		if (!this.getRuta().equals("")){
			
			String[] parts = this.getRuta().split("/");
			String apiKey = "AIzaSyDVllt_2i9RbXSzc8ckxRZpENKLHFcsIAA";
			String gmaps = "https://www.google.com/maps/embed/v1/directions?key="+apiKey+"&origin="+parts[5] +"&destination="+parts[6]+"&avoid=tolls|highways";
			recorrido.setUrlMaps(gmaps);
		}
		
		if (this.getEvento()!=null){
			Evento evento = eventoDAO.getEvento(new Long(this.getEvento()));
			recorrido.setEvento(evento);
		}
		recorrido.setNopermitido(this.getNopermitido());
		recorrido.setCreador(this.getUsuario());
		
	}
	//private boolean isValid() {
		// TODO Auto-generated method stub
		//return getNombre() != null  && getFecha()!=null && getLugar() != null && !(getFecha().length()==0);
	//}
	public String list(){	
		String result = "";
		result = this.verifyUserAdmin();
		if (result.equals("200")){	
			addData("eventos",eventoDAO.list());
			return SUCCESS;
		}
		return result;
		
		
	}
	
	public String getAsientos() {
		return asientos;
	}
	public void setAsientos(String asientos) {
		this.asientos = asientos;
	}
	public String getSalida() {
		return salida;
	}
	public void setSalida(String salida) {
		this.salida = salida;
	}
	public String getDesde() {
		return desde;
	}
	public void setDesde(String desde) {
		this.desde = desde;
	}
	public String getLlegada() {
		return llegada;
	}
	public void setLlegada(String llegada) {
		this.llegada = llegada;
	}
	public String getHasta() {
		return hasta;
	}
	public void setHasta(String hasta) {
		this.hasta = hasta;
	}
	public String getRuta() {
		return ruta;
	}
	public void setRuta(String ruta) {
		this.ruta = ruta;
	}
	public String getPeriodicidad() {
		return periodicidad;
	}
	public void setPeriodicidad(String periodicidad) {
		this.periodicidad = periodicidad;
	}

	public String getEvento() {
		return evento;
	}
	public void setEvento(String evento) {
		this.evento = evento;
	}
	public String[] getDias() {
		return dias;
	}
	public void setDias(String[] dias) {
		this.dias = dias;
	}
	public String getFinaliza() {
		return finaliza;
	}
	public void setFinaliza(String finaliza) {
		this.finaliza = finaliza;
	}
	
	public String delete(){	
		String result = "";
		result = this.verifyUserAdmin();
		if (result.equals("200")){	
			String id_parameter = ServletActionContext.getRequest().getParameter("clave");
			System.out.println(id_parameter);
			Long id = new Long(id_parameter);
			Evento evento = eventoDAO.getEvento(id);
			eventoDAO.delete(evento);
			addData("eventos",eventoDAO.list());
			return SUCCESS;
		}
		return result;		
	}
	public RecorridoDAO getRecorridoDAO() {
		return recorridoDAO;
	}
	public void setRecorridoDAO(RecorridoDAO recorridoDAO) {
		this.recorridoDAO = recorridoDAO;
	}
	
	public EventoDAO getEventoDAO() {
		return eventoDAO;
	}
	public void setEventoDAO(EventoDAO eventoDAO) {
		this.eventoDAO = eventoDAO;
	}
	
	
	public String[] getNopermitido() {
		return nopermitido;
	}
	public void setNopermitido(String[] nopermitido) {
		this.nopermitido = nopermitido;
	}
	public RecorridoUnicoDAO getRecorridoUnicoDAO() {
		return recorridoUnicoDAO;
	}
	public void setRecorridoUnicoDAO(RecorridoUnicoDAO recorridoUnicoDAO) {
		this.recorridoUnicoDAO = recorridoUnicoDAO;
	}
	public RecorridoMasDeUnDiaDAO getRecorridoMasUnDiaDAO() {
		return recorridoMasUnDiaDAO;
	}
	public void setRecorridoMasUnDiaDAO(RecorridoMasDeUnDiaDAO recorridoMasUnDiaDAO) {
		this.recorridoMasUnDiaDAO = recorridoMasUnDiaDAO;
	}
	
	/*public String update(){	
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
				addMessage("update_evento", "Se ha modificado correctamente el evento");
				addData("eventos", eventoDAO.list());
				return SUCCESS;					
			}else
				addMessage("update_evento_error", "Deben completarse todos los campos excepto sitio web!");		
		}
		return result;		
	}*/





	/*
	
	private void reformat(){
		String[] r = this.fecha.split("/");
		this.setFecha (r[2].split(" ")[0]+"/"+r[1]+"/"+r[0]);
		this.setHora(r[2].split(" ")[1]);

		
		
	}*/
}
