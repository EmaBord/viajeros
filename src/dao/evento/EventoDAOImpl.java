package dao.evento;

import java.util.Date;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import model.evento.Evento;
import dao.generic.GenericDAOImpl;


public class EventoDAOImpl extends GenericDAOImpl<Evento, Integer>  implements EventoDAO {

	public EventoDAOImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
		// TODO Auto-generated constructor stub
	}

	@Override
	@Transactional
	public void eliminarEvento(Evento e) {
		// TODO Auto-generated method stub
		this.delete(e);
	}

	

	@Override
	@Transactional
	public boolean existe(String nombre, Date fecha) {
		Query eventoTaskQuery = getCurrentSession().createQuery(
                "select e from Evento e where nombre=:nombre and fecha=:fecha");
        eventoTaskQuery.setParameter("nombre", nombre);
        eventoTaskQuery.setParameter("fecha", fecha);
        return (eventoTaskQuery.list().size() > 0);
	}

	@Override
	@Transactional
	public Evento getEvento(String nombre, Date fecha) {
		Query eventoTaskQuery = getCurrentSession().createQuery(
                "select e from Evento e where nombre=:nombre and fecha=:fecha");
        eventoTaskQuery.setParameter("nombre", nombre);
        eventoTaskQuery.setParameter("fecha", fecha);
        if (eventoTaskQuery.list().size() > 0)
        	return (Evento) eventoTaskQuery.list().get(0);
        else 
        	return null;
	}

}
