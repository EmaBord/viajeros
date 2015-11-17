package action.register;
import java.io.IOException;
import java.util.Map;
import model.rol.Rol;
import model.usuario.Usuario;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.rol.RolDAO;
import dao.usuario.UsuarioDAO;
@SuppressWarnings("serial")
public class Register extends ActionSupport{
	
	public String nombre;
	public String apellido;
	public String email;
	public String clave;
	public String clave2;
	private UsuarioDAO usuarioDAO;
	private RolDAO rolDAO;

	public String execute() throws IOException {		
		Map<String, Object> session = ActionContext.getContext().getSession();
		Usuario user = (Usuario) session.get("usuario");		
		if (user == null){			
			if (!usuarioDAO.existe(getEmail())){					
					Usuario u = new Usuario();
					u.setApellido(getApellido());
					u.setClave(getClave());
					u.setEmail(getEmail());					
			        u.setNombre(getNombre());
					Rol r = new Rol();
					if (!rolDAO.existe("viajero")){						
						r.setNombre("viajero");
						rolDAO.save(r);
					}
					else{
						r = rolDAO.getRol("viajero");
					}
					u.setRol(r);					
					usuarioDAO.save(u);
					// crear la session
					return SUCCESS;
				
				
			}else
				return INPUT;
			
		}else{
			
			return user.getRol().getNombre();
		}
		
		
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getApellido() {
		return apellido;
	}


	public void setApellido(String apellido) {
		this.apellido = apellido;
	}


	


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getClave() {
		return clave;
	}


	public void setClave(String clave) {
		this.clave = clave;
	}


	

	public String getClave2() {
		return clave2;
	}


	public void setClave2(String clave2) {
		this.clave2 = clave2;
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





}
