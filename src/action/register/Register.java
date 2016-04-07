package action.register;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Map;

import model.rol.Rol;
import model.usuario.Usuario;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.recorrido.RecorridoMasDeUnDiaDAO;
import dao.recorrido.RecorridoUnicoDAO;
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
	private RecorridoUnicoDAO recorridoUnicoDAO;
	private RecorridoMasDeUnDiaDAO recorridoMasUnDiaDAO;

	public String execute() throws IOException, NoSuchAlgorithmException {		
		Map<String, Object> session = ActionContext.getContext().getSession();
		Usuario user = (Usuario) session.get("usuario");		
		if (user == null){			
			if (!usuarioDAO.existe(getEmail())){					
					Usuario u = new Usuario();
					u.setApellido(getApellido());
					u.setClave(this.md5(getClave()));
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
					String timeStamp = new SimpleDateFormat("dd/MM/yyyy").format(Calendar.getInstance().getTime());
					u.setIngreso(timeStamp);
					usuarioDAO.save(u);
					session.put("usuario",u);
					session.put("recorridosUnicos", recorridoUnicoDAO.activosSinUsuario(u));
					session.put("recorridos", recorridoMasUnDiaDAO.activosSinUsuario(u));

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





}
