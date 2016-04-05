package dao.recorrido;



import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import model.recorrido.Recorrido;
import dao.generic.GenericDAOImpl;


public class RecorridoDAOImpl extends GenericDAOImpl<Recorrido,Long> implements RecorridoDAO {

	public RecorridoDAOImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
		// TODO Auto-generated constructor stub
	}
	@Transactional
	@SuppressWarnings("unchecked")
	@Override
	public List<Recorrido> findByUser(Long idUsuarioBloqueado) {
		Query query = getCurrentSession().createQuery(
                "select r from Recorrido r where creador_id=:creador_id ");
		query.setParameter("creador_id", idUsuarioBloqueado);
		return (List<Recorrido>) query.list();
	}

	
}
