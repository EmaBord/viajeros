package dao.recorrido;

import java.util.List;

import model.recorrido.Recorrido;
import dao.generic.GenericDAO;

public interface RecorridoDAO extends GenericDAO<Recorrido, Long>  {

	List<Recorrido> findByUser(Long idUsuarioBloqueado);

}
