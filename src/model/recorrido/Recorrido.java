package model.recorrido;

import javax.persistence.*;



import com.sun.istack.internal.Nullable;

import model.evento.Evento;
import model.usuario.Usuario;
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class Recorrido {
   @Id
   @GeneratedValue
    private Long id;	
	private String salida;
	private String desde;
	private String llegada;
	private String hasta;
	private String urlMaps;
	@ManyToOne(optional=true,cascade={CascadeType.ALL})
	@Nullable
	private Evento evento;
	private String [] nopermitido;
	@ManyToOne(optional=false)
	private Usuario creador;
	private Integer asientos;
	
	
	public Usuario getCreador() {
		return creador;
	}
	public void setCreador(Usuario creador) {
		this.creador = creador;
	}
	public Integer getAsientos() {
		return asientos;
	}
	public void setAsientos(Integer asientos) {
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
	public String getUrlMaps() {
		return urlMaps;
	}
	public void setUrlMaps(String urlMaps) {
		this.urlMaps = urlMaps;
	}
	public Evento getEvento() {
		return evento;
	}
	public void setEvento(Evento evento) {
		this.evento = evento;
	}
	public String[] getNopermitido() {
		return nopermitido;
	}
	public void setNopermitido(String[] nopermitido) {
		this.nopermitido = nopermitido;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String format(String fecha_formatear){
		String []partes_fecha = fecha_formatear.split(" ")[0].split("/");
		String [] partes_hora = fecha_formatear.split(" ");
		String hora  = partes_hora[1];
		String fecha = partes_fecha[2]+"/"+partes_fecha[1]+"/"+partes_fecha[0];
		return fecha+" "+hora;
	}
	public String formatFinaliza(String fecha_formatear){
		String []partes_fecha = fecha_formatear.split("/");
		String fecha = partes_fecha[2]+"/"+partes_fecha[1]+"/"+partes_fecha[0];
		return fecha;
	}
}
