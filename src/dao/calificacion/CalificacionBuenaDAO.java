package dao.calificacion;

import java.util.List;

import model.calificacion.CalificacionBuena;
import model.recorrido.Recorrido;
import model.usuario.Usuario;
import dao.generic.GenericDAO;


public interface CalificacionBuenaDAO extends GenericDAO<CalificacionBuena, Long> {

	List<CalificacionBuena> getCalificaciones(Usuario u);

	Boolean existe(Usuario usuario, Recorrido recorrido, Usuario creador);

}
