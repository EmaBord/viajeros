package dao.calificacion;

import model.calificacion.Calificacion;
import org.hibernate.SessionFactory;
import dao.generic.GenericDAOImpl;
public class CalificacionDAOImpl extends GenericDAOImpl<Calificacion, Long> implements CalificacionDAO {

	public CalificacionDAOImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
		// TODO Auto-generated constructor stub
	}

	

}
