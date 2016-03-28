package dao.evento;
import java.util.Iterator;
import java.util.List;

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
		e.setEliminado(true);
		this.update(e);
		
	}

	

	@Override
	@Transactional
	public boolean existe(String nombre, String fecha, String lugar, String hora) {
		Query eventoTaskQuery = getCurrentSession().createQuery(
                "select e from Evento e where nombre=:nombre and fecha=:fecha and lugar=:lugar and hora=:hora");
        eventoTaskQuery.setParameter("nombre", nombre);
        eventoTaskQuery.setParameter("fecha", fecha);
        eventoTaskQuery.setParameter("lugar", lugar);
        eventoTaskQuery.setParameter("hora", hora);
        return (eventoTaskQuery.list().size() > 0);
	}

	@Override
	@Transactional
	public Evento getEvento(String nombre, String fecha,String lugar, String hora) {
		Query eventoTaskQuery = getCurrentSession().createQuery(
                "select e from Evento e where nombre=:nombre and fecha=:fecha and lugar=:lugar and hora=:hora");
        eventoTaskQuery.setParameter("nombre", nombre);
        eventoTaskQuery.setParameter("fecha", fecha);
        eventoTaskQuery.setParameter("lugar", lugar);
        eventoTaskQuery.setParameter("hora", hora);
        if (eventoTaskQuery.list().size() > 0)
        	return (Evento) eventoTaskQuery.list().get(0);
        else 
        	return null;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Evento> activos() {
		Query eventoTaskQuery = getCurrentSession().createQuery(
                "select e from Evento e where eliminado=:eliminado");
        eventoTaskQuery.setParameter("eliminado", false);
        return (List<Evento>) eventoTaskQuery.list();
        
	}

	@Override
	@Transactional
	public Evento getEvento(Long id) {
		Query eventoTaskQuery = getCurrentSession().createQuery(
                "select e from Evento e where id=:id and eliminado=:eliminado");
        eventoTaskQuery.setParameter("id", id);
        eventoTaskQuery.setParameter("eliminado", false);
        if (eventoTaskQuery.list().size() > 0)
        	return (Evento) eventoTaskQuery.list().get(0);
        else 
        	return null;
	}



}
