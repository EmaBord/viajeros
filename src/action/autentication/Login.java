package action.autentication;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import template.method.TemplateMethod;
import model.rol.Rol;
import model.usuario.Usuario;

import com.opensymphony.xwork2.ActionContext;

import dao.calificacion.CalificacionBuenaDAO;
import dao.calificacion.CalificacionMalaDAO;
import dao.calificacion.CalificacionRegularDAO;
import dao.evento.EventoDAO;
import dao.recorrido.RecorridoMasDeUnDiaDAO;
import dao.recorrido.RecorridoUnicoDAO;
import dao.rol.RolDAO;
import dao.usuario.UsuarioDAO;
@SuppressWarnings("serial")
public class Login extends TemplateMethod  {
	
	
	String email;
	String clave;
	
	
	private UsuarioDAO usuarioDAO ;
	private RolDAO rolDAO ;
	private EventoDAO eventoDAO ;
	private RecorridoUnicoDAO recorridoUnicoDAO;
	private RecorridoMasDeUnDiaDAO recorridoMasUnDiaDAO;
	private CalificacionBuenaDAO calificacionBuenaDAO;
	private CalificacionRegularDAO calificacionRegularDAO;
	private CalificacionMalaDAO calificacionMalaDAO;

	@Override
	public String execute() throws NoSuchAlgorithmException, UnsupportedEncodingException{

		if (rolDAO.getRol("admin")== null){
			Rol r = new Rol();
			r.setNombre("admin");
			rolDAO.save(r);
			Usuario user = new Usuario();
			user.setApellido("Administrador");
			user.setEmail("admin@admin.com");
			user.setNombre("Admin");
			user.setClave(this.md5("admin"));
			String timeStamp = new SimpleDateFormat("dd/MM/yyyy").format(Calendar.getInstance().getTime());
			user.setIngreso(timeStamp);
			user.setRol(r);
			usuarioDAO.save(user);
			
		}
		
		Map<String, Object> session = ActionContext.getContext().getSession();
		Usuario user = (Usuario) session.get("usuario");	
		
		
		if (user == null){

			if (usuarioDAO.existe(this.getEmail())){
				
				Usuario u = usuarioDAO.getUsuario(this.getEmail());
				if (u.getBloquedo())
					return "bloqueado";
				if (!u.getClave().equals(this.md5(this.getClave())))
					return "incorrecto";
				session.put("perfil", u.getRol().getNombre());
				session.put("nombre", u.getNombre());
				session.put("usuario", u);
				if (u.getRol().getNombre().equals("admin")){
					session.put("eventos", eventoDAO.activos());
					List<Usuario> viajeros = getViajeros(getUsuarioDAO());
					HashMap<Long, Integer> calificaciones_positivas = new HashMap<Long, Integer>();
					HashMap<Long, Integer> calificaciones_negativas = new HashMap<Long, Integer>();
					HashMap<Long, Integer> calificaciones_regulares = new HashMap<Long, Integer>();

					for (int i=0; i< viajeros.size();i++){
						Usuario us = viajeros.get(i);
						calificaciones_positivas.put(us.getId(), calificacionBuenaDAO.getCalificaciones(us).size());
						calificaciones_negativas.put(us.getId(),calificacionMalaDAO.getCalificaciones(us).size());
						calificaciones_regulares.put(us.getId(),calificacionRegularDAO.getCalificaciones(us).size());

					}
					session.put("viajeros",viajeros);
					session.put("positivas",calificaciones_positivas);
					session.put("negativas",calificaciones_negativas);
					session.put("regulares",calificaciones_negativas);
					
				}
				
				session.put("recorridosUnicos", recorridoUnicoDAO.activosSinUsuario(u));
				session.put("recorridos", recorridoMasUnDiaDAO.activosSinUsuario(u));
				session.put("gravatar", this.md5(u.getEmail()));
				return u.getRol().getNombre();

			}else{
				return "incorrecto";

				}
		}else{
			return user.getRol().getNombre();

			}
			
		}
		

	
	public String getEmail() {
		// TODO Auto-generated method stub
		return email;
	}
	public void setEmail(String email){
		this.email = email;
	}
	
	public void setClave(String clave){
		this.clave = clave;
	}
	
	public String getClave() {
		// TODO Auto-generated method stub
		return clave;
	}
	
	
	public void setUsuarioDAO(UsuarioDAO usuarioDAO) {
		this.usuarioDAO = usuarioDAO;
		
		
		}
	public UsuarioDAO getUsuarioDAO() {
		return this.usuarioDAO ;
		}

	public RolDAO getRolDAO() {
		return this.rolDAO ;
		}
	public void setRolDAO(RolDAO rolDAO){
		this.rolDAO = rolDAO;
	}
	public EventoDAO getEventoDAO() {
		return this.eventoDAO ;
		}
	public void setEventoDAO(EventoDAO eventoDAO){
		this.eventoDAO = eventoDAO;
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
	
	private String md5(String word) throws NoSuchAlgorithmException{
		
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(word.getBytes());
        
        byte byteData[] = md.digest();
 
        //convert the byte to hex format method 1
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }
        return sb.toString();
     
	}



	public CalificacionBuenaDAO getCalificacionBuenaDAO() {
		return calificacionBuenaDAO;
	}



	public void setCalificacionBuenaDAO(CalificacionBuenaDAO calificacionBuenaDAO) {
		this.calificacionBuenaDAO = calificacionBuenaDAO;
	}



	public CalificacionRegularDAO getCalificacionRegularDAO() {
		return calificacionRegularDAO;
	}



	public void setCalificacionRegularDAO(
			CalificacionRegularDAO calificacionRegularDAO) {
		this.calificacionRegularDAO = calificacionRegularDAO;
	}



	public CalificacionMalaDAO getCalificacionMalaDAO() {
		return calificacionMalaDAO;
	}



	public void setCalificacionMalaDAO(CalificacionMalaDAO calificacionMalaDAO) {
		this.calificacionMalaDAO = calificacionMalaDAO;
	}
	
	
}
