package action.recorrido;





import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import template.method.TemplateMethod;
import model.evento.Evento;
import model.pendiente.UsuarioPendiente;
import model.recorrido.Recorrido;
import model.recorrido.RecorridoMasUnDia;
import model.recorrido.RecorridoUnico;
import model.viajero.UsuarioViajero;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.conversion.annotations.Conversion;

import dao.evento.EventoDAO;
import dao.pendiente.UsuarioPendienteDAO;
import dao.recorrido.RecorridoDAO;
import dao.recorrido.RecorridoMasDeUnDiaDAO;
import dao.recorrido.RecorridoUnicoDAO;
import dao.usuario.UsuarioDAO;
import dao.viajero.UsuarioViajeroDAO;

@Conversion
public class RecorridoAction extends TemplateMethod {	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private EventoDAO eventoDAO;
	private RecorridoDAO recorridoDAO;
	private RecorridoUnicoDAO recorridoUnicoDAO;
	private RecorridoMasDeUnDiaDAO recorridoMasUnDiaDAO;
	private UsuarioDAO usuarioDAO;
	private UsuarioPendienteDAO usuarioPendienteDAO;
	private UsuarioViajeroDAO usuarioViajeroDAO;
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
		updateSession();
		addData("recorridosUnicos", recorridoUnicoDAO.activosDeUsuario(this.getUsuario()));	
		addData("recorridosMasUnDia", recorridoMasUnDiaDAO.activosDeUsuario(this.getUsuario()));
		addData("viajeros", usuarioViajeroDAO.list());
		return "ok";
		
	}
	public String pendientes(){
		updateSession();
		addData("pendientes", usuarioPendienteDAO.activosDeUsuario(this.getUsuario()));			
		return "ok";
		
	}
	
	public String timeline(){
		updateSession();
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
		updateSession();
		addData("recorridosUnicos", recorridoUnicoDAO.activosSinUsuario(this.getUsuario()));
		addData("recorridos", recorridoMasUnDiaDAO.activosSinUsuario(this.getUsuario()));
		return "home";
		
	}
	private String crear_viaje_unico() {
		RecorridoUnico recorrido = new RecorridoUnico();
		this.cargar_datos(recorrido);
		recorridoDAO.save(recorrido);
		updateSession();
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
			recorrido.setUrlMapsPura(this.getRuta());
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
	


	public String eliminar(){
			String id_parameter = ServletActionContext.getRequest().getParameter("clave");
			Long id = new Long(id_parameter);
			Recorrido recorrido = recorridoDAO.findByKey(id);
			recorridoDAO.delete(recorrido);
			usuarioViajeroDAO.delete(id);
			usuarioPendienteDAO.delete(id);
			addData("recorridosUnicos", recorridoUnicoDAO.activosDeUsuario(this.getUsuario()));	
			addData("recorridosMasUnDia", recorridoMasUnDiaDAO.activosDeUsuario(this.getUsuario()));
			addData("viajeros", usuarioViajeroDAO.list());
			return "ok";
		
	}
	public String aceptarUsuario(){
		String id_parameter = ServletActionContext.getRequest().getParameter("clave");
		Long id = new Long(id_parameter);
		UsuarioPendiente usuarioPendiente = usuarioPendienteDAO.findByKey(id);
		Recorrido recorrido = usuarioPendiente.getRecorrido();
		UsuarioViajero userv = new UsuarioViajero();
		userv.setRecorrido(recorrido);
		userv.setUsuario(usuarioPendiente.getUsuario());
		usuarioViajeroDAO.save(userv);
		recorrido.setAsientos(recorrido.getAsientos()-1);
		recorridoDAO.update(recorrido);
		usuarioPendienteDAO.delete(usuarioPendiente);
		addData("pendientes", usuarioPendienteDAO.activosDeUsuario(this.getUsuario()));
		return "ok";
	}
	public String rechazarUsuario(){
		String id_parameter = ServletActionContext.getRequest().getParameter("clave");
		Long id = new Long(id_parameter);		
		UsuarioPendiente usuarioPendiente = usuarioPendienteDAO.findByKey(id);
		usuarioPendienteDAO.delete(usuarioPendiente);
		addData("pendientes", usuarioPendienteDAO.activosDeUsuario(this.getUsuario()));	
		return "ok";
	}
	public String subir(){
		String id_parameter = ServletActionContext.getRequest().getParameter("recorrido");
		Long id = new Long(id_parameter);
		Recorrido recorrido = recorridoDAO.findByKey(id);
		UsuarioPendiente upen = new UsuarioPendiente();
		upen.setRecorrido(recorrido);
		upen.setUsuario(this.getUsuario());
		usuarioPendienteDAO.save(upen);
		addData("recorridosUnicos", recorridoUnicoDAO.activosSinUsuario(this.getUsuario()));
		addData("recorridos", recorridoMasUnDiaDAO.activosSinUsuario(this.getUsuario()));
		return "ok";
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

	public String actualizar(){	
				Recorrido r = null;
				Long id = new Long(ServletActionContext.getRequest().getParameter("clave"));
				if (this.getFinaliza() != null && !this.getFinaliza().equals("")){
					 r = recorridoMasUnDiaDAO.findByKey(id);
					 ((RecorridoMasUnDia) r).setFinaliza(getFinaliza());
				}else{
					r = recorridoDAO.findByKey(id);
				}				
				r.setAsientos(new Integer(getAsientos()));
				r.setDesde(getDesde());
				r.setHasta(getHasta());
				if (! this.getSalida().equals(""))
					r.setSalida(getSalida());
				if (! this.getLlegada().equals(""))
					r.setLlegada(getLlegada());
				if (!this.getRuta().equals("")){
					r.setUrlMapsPura(this.getRuta());
					String[] parts = this.getRuta().split("/");
					String apiKey = "AIzaSyDVllt_2i9RbXSzc8ckxRZpENKLHFcsIAA";
					String gmaps = "https://www.google.com/maps/embed/v1/directions?key="+apiKey+"&origin="+parts[5] +"&destination="+parts[6]+"&avoid=tolls|highways";
					r.setUrlMaps(gmaps);
				}
				
				recorridoDAO.update(r);			
				addMessage("update_viaje", getText("update_viaje"));
				addData("recorridosUnicos", recorridoUnicoDAO.activosDeUsuario(this.getUsuario()));	
				addData("recorridosMasUnDia", recorridoMasUnDiaDAO.activosDeUsuario(this.getUsuario()));	
				return "ok";					
			
				
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public UsuarioDAO getUsuarioDAO() {
		return usuarioDAO;
	}
	public void setUsuarioDAO(UsuarioDAO usuarioDAO) {
		this.usuarioDAO = usuarioDAO;
	}
	public UsuarioPendienteDAO getUsuarioPendienteDAO() {
		return usuarioPendienteDAO;
	}
	public void setUsuarioPendienteDAO(UsuarioPendienteDAO usuarioPendienteDAO) {
		this.usuarioPendienteDAO = usuarioPendienteDAO;
	}
	public UsuarioViajeroDAO getUsuarioViajeroDAO() {
		return usuarioViajeroDAO;
	}
	public void setUsuarioViajeroDAO(UsuarioViajeroDAO usuarioViajeroDAO) {
		this.usuarioViajeroDAO = usuarioViajeroDAO;
	}
	
	





}
