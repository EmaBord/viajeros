package dao.recorrido;

import java.util.List;

import model.recorrido.RecorridoUnico;
import model.usuario.Usuario;
import dao.generic.GenericDAO;

public interface RecorridoUnicoDAO extends GenericDAO<RecorridoUnico, Long>  {

	public abstract List<RecorridoUnico> activos();

	List<RecorridoUnico> activosSinUsuario(Usuario u);
	List<RecorridoUnico> activosDeUsuario(Usuario u);

	
}
