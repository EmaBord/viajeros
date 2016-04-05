package dao.calificacion;

import java.util.List;

import model.calificacion.CalificacionRegular;
import model.recorrido.Recorrido;
import model.usuario.Usuario;
import dao.generic.GenericDAO;



public interface CalificacionRegularDAO extends GenericDAO<CalificacionRegular, Long>{

	List<CalificacionRegular> getCalificaciones(Usuario u);

	Boolean existe(Usuario usuario, Recorrido recorrido, Usuario creador);

}
