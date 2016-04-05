package dao.viajero;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import model.viajero.UsuarioViajero;
import dao.generic.GenericDAOImpl;

public class UsuarioViajeroDAOImpl extends GenericDAOImpl<UsuarioViajero,Long> implements UsuarioViajeroDAO {

	public UsuarioViajeroDAOImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
		// TODO Auto-generated constructor stub
	}

	@Override
	public UsuarioViajero getRegistro(Long id, Long id2) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public void delete(Long id) {
		Query query = getCurrentSession().createQuery(
                " delete from UsuarioViajero r where recorrido_id =:id");
		query.setParameter("id", id);
		query.executeUpdate();
		
	}
	@Transactional
	@SuppressWarnings("unchecked")
	@Override
	public List<UsuarioViajero> getUser(Long id) {
		Query query = getCurrentSession().createQuery(
                "select r from UsuarioViajero r where  recorrido_id=:recorrido_id");
		query.setParameter("recorrido_id", id);
		return (List<UsuarioViajero>) query.list();
	}

}
