package dao.calificacion;



import java.util.List;

import model.calificacion.Calificacion;
import model.usuario.Usuario;
import dao.generic.GenericDAO;

public interface CalificacionDAO extends GenericDAO<Calificacion, Long> {

      List<Calificacion> getCalificaciones(Usuario u);
}
