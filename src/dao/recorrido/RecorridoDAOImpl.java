package dao.recorrido;



import org.hibernate.SessionFactory;

import model.recorrido.Recorrido;
import dao.generic.GenericDAOImpl;


public class RecorridoDAOImpl extends GenericDAOImpl<Recorrido,Long> implements RecorridoDAO {

	public RecorridoDAOImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
		// TODO Auto-generated constructor stub
	}

	
}
