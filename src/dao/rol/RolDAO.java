package dao.rol;

import model.rol.Rol;
import dao.generic.GenericDAO;

public interface RolDAO extends GenericDAO<Rol, Integer> {
	public Rol getRol(String nombre);

}
