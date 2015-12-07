
package dao.usuario;
import dao.generic.GenericDAO;
import model.usuario.Usuario;
public interface UsuarioDAO extends GenericDAO<Usuario, Long> {
	public boolean eliminarUsuario(Usuario u);
    public boolean existe(String email);
    public Usuario getUsuario(String email);
}
