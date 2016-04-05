package dao.recorrido;


import java.util.List;

import model.recorrido.RecorridoMasUnDia;
import model.usuario.Usuario;
import dao.generic.GenericDAO;

public interface RecorridoMasDeUnDiaDAO extends GenericDAO<RecorridoMasUnDia, Long>  {
	public abstract List<RecorridoMasUnDia> activos();

	List<RecorridoMasUnDia> activosSinUsuario(Usuario u);
	List<RecorridoMasUnDia> activosDeUsuario(Usuario u);

	
}
