package dao.calificacion;

import java.util.List;

import model.calificacion.CalificacionMala;
import model.recorrido.Recorrido;
import model.usuario.Usuario;
import dao.generic.GenericDAO;


public interface CalificacionMalaDAO extends GenericDAO<CalificacionMala, Long>{

	List<CalificacionMala> getCalificaciones(Usuario u);

	Boolean existe(Usuario usuario, Recorrido recorrido, Usuario creador);

}
