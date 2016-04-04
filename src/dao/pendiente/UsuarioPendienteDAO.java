package dao.pendiente;

import model.pendiente.UsuarioPendiente;
import model.usuario.Usuario;
import dao.generic.GenericDAO;

public interface UsuarioPendienteDAO extends GenericDAO<UsuarioPendiente,Long> {
	public UsuarioPendiente getRegistro(Long idRecorrido, Long idUsuario);

	public Object activosDeUsuario(Usuario usuario);

	void delete(Long id);
}
