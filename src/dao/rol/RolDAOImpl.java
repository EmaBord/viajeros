package dao.rol;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import model.rol.Rol;
import dao.generic.GenericDAOImpl;

public class RolDAOImpl extends GenericDAOImpl<Rol, Integer> 
implements RolDAO{
	public RolDAOImpl(SessionFactory sessionFactory) {
		super(sessionFactory);

	}

	@Override
	@Transactional
	public Rol getRol(String nombre) {
		Query rolTaskQuery = getCurrentSession().createQuery(
                "select r from Rol r where nombre=:nombre");
        rolTaskQuery.setParameter("nombre", nombre);        
        if (rolTaskQuery.list().size() > 0)
        	return (Rol) rolTaskQuery.list().get(0);
        else 
        	return null;
	}

	@Override
	@Transactional
    public boolean existe(String nombre) {		
		Query rolTaskQuery = getCurrentSession().createQuery(
                "select u from Rol u where nombre=:nombre");
        rolTaskQuery.setParameter("nombre", nombre);        
        return rolTaskQuery.list().size() > 0;
    }
}
