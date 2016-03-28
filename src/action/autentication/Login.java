package action.autentication;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

import model.rol.Rol;
import model.usuario.Usuario;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.evento.EventoDAO;
import dao.recorrido.RecorridoMasDeUnDiaDAO;
import dao.recorrido.RecorridoUnicoDAO;
import dao.rol.RolDAO;
import dao.usuario.UsuarioDAO;
@SuppressWarnings("serial")
public class Login extends ActionSupport  {
	
	
	String email;
	String clave;
	
	
	private UsuarioDAO usuarioDAO ;
	private RolDAO rolDAO ;
	private EventoDAO eventoDAO ;
	private RecorridoUnicoDAO recorridoUnicoDAO;
	private RecorridoMasDeUnDiaDAO recorridoMasUnDiaDAO;

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
			user.setRol(r);
			/*
			byte[] bytesOfMessage = "admin".getBytes("UTF-8");

			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] thedigest = md.digest(bytesOfMessage);
			
			
			*/
			user.setClave("admin");
			usuarioDAO.save(user);
			
		}
		
		Map<String, Object> session = ActionContext.getContext().getSession();
		Usuario user = (Usuario) session.get("usuario");	
		
		
		if (user == null){

			if (usuarioDAO.existe(this.getEmail())){
				
				Usuario u = usuarioDAO.getUsuario(this.getEmail());
				if (u.getBloquedo())
					return "bloqueado";
				session.put("perfil", u.getRol().getNombre());
				session.put("nombre", u.getNombre());
				session.put("usuario", u);
				if (u.getRol().getNombre().equals("admin"))
					session.put("eventos", eventoDAO.activos());
				if (u.getRol().getNombre().equals("viajero"))
					
					session.put("recorridosUnicos", recorridoUnicoDAO.activosSinUsuario(u));
					session.put("recorridos", recorridoMasUnDiaDAO.activosSinUsuario(u));
					
				return u.getRol().getNombre();

			}else{
				return "input";

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
	
}
