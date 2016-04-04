package dao.viajero;

import model.viajero.UsuarioViajero;
import dao.generic.GenericDAO;

public interface UsuarioViajeroDAO  extends GenericDAO<UsuarioViajero,Long> {

	UsuarioViajero getRegistro(Long id, Long id2);

	void delete(Long id);

}
