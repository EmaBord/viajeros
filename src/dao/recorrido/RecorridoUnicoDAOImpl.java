package dao.recorrido;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import model.recorrido.RecorridoUnico;
import model.usuario.Usuario;
import dao.generic.GenericDAOImpl;

public class RecorridoUnicoDAOImpl extends GenericDAOImpl<RecorridoUnico,Long> implements RecorridoUnicoDAO {

	public RecorridoUnicoDAOImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
		// TODO Auto-generated constructor stub
	}
	@Override
	@Transactional
	public List<RecorridoUnico> activos(){
		Query query = getCurrentSession().createQuery(
                "from RecorridoUnico");
	    List<RecorridoUnico> recorridos = (List<RecorridoUnico>) query.list();
		return recorridos;
		
	}
	@Override
	@Transactional
	public List<RecorridoUnico> activosSinUsuario(Usuario u){
		Query query = getCurrentSession().createQuery(
                "select r from RecorridoUnico r where creador_id <>:usuario_id");
		query.setParameter("usuario_id", u.getId());
	    List<RecorridoUnico> recorridos = (List<RecorridoUnico>) query.list();
		return recorridos;
		
	}

}
