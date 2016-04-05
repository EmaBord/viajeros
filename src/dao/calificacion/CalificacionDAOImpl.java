package dao.calificacion;

import java.util.List;

import model.calificacion.Calificacion;
import model.usuario.Usuario;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import dao.generic.GenericDAOImpl;
public class CalificacionDAOImpl extends GenericDAOImpl<Calificacion, Long> implements CalificacionDAO {

	public CalificacionDAOImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
		// TODO Auto-generated constructor stub
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Calificacion> getCalificaciones(Usuario u) {
		Query query = getCurrentSession().createQuery(
                "select u from Calificacion u where calificado_id=:id");
		query.setParameter("id", u.getId());		
                
		return (List<Calificacion>) query.list();
	}

	

}
