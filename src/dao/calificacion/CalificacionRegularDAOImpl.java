package dao.calificacion;

import java.util.List;

import model.calificacion.CalificacionMala;
import model.calificacion.CalificacionRegular;
import model.recorrido.Recorrido;
import model.usuario.Usuario;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import dao.generic.GenericDAOImpl;


public class CalificacionRegularDAOImpl extends GenericDAOImpl<CalificacionRegular, Long> implements CalificacionRegularDAO {

	public CalificacionRegularDAOImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
		// TODO Auto-generated constructor stub
	}
	@Transactional
	public List<CalificacionRegular> getCalificaciones(Usuario u) {
		Query query = getCurrentSession().createQuery(
                "select u from CalificacionRegular u where calificado_id=:id");
		query.setParameter("id", u.getId());		
                
		return (List<CalificacionRegular>) query.list();
	}
	@Transactional
	@Override
	public Boolean existe(Usuario usuario, Recorrido recorrido, Usuario creador) {
		Query query = getCurrentSession().createQuery("select u from CalificacionRegular u where "
				+ " calificado_id=:calificado_id and calificador_id=:calificador_id"
				+ " and recorrido_id=:recorrido_id");
				query.setParameter("calificado_id",creador.getId());
				query.setParameter("calificador_id",usuario.getId());
				query.setParameter("recorrido_id",recorrido.getId());
		return query.list().size()>0;
	}
}
