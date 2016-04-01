package dao.recorrido;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Iterator;
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
	    @SuppressWarnings("unchecked")
		List<RecorridoUnico> recorridos = (List<RecorridoUnico>) query.list();
		return recorridos;
		
	}
	@Override
	@Transactional
	public List<RecorridoUnico> activosSinUsuario(Usuario u){
		String timeStamp = new SimpleDateFormat("yyyy/MM/dd HH:mm").format(Calendar.getInstance().getTime());
		List<RecorridoUnico> activos = new ArrayList<RecorridoUnico>();
		Query query = getCurrentSession().createQuery(
                "select r from RecorridoUnico r where creador_id <>:usuario_id");
		query.setParameter("usuario_id", u.getId());
	    @SuppressWarnings("unchecked")
		List<RecorridoUnico> recorridos = (List<RecorridoUnico>) query.list();
	    Iterator<RecorridoUnico> iterator = recorridos.iterator();
		while (iterator.hasNext()) {
			RecorridoUnico recorrido = iterator.next();
			int result = recorrido.format(recorrido.getSalida()).compareTo(timeStamp);
			if (! (recorrido.getCreador().getBloqueado()) && (result >= 0)&& recorrido.getAsientos()>0)
				activos.add(recorrido);
		}
	    Collections.sort(activos);
	    return activos;
		
	}
	@Override
	@Transactional
	public List<RecorridoUnico> activosDeUsuario(Usuario u) {
		
		Query query = getCurrentSession().createQuery(
                "select r from RecorridoUnico r where creador_id =:usuario_id");
		query.setParameter("usuario_id", u.getId());
	    @SuppressWarnings("unchecked")
		List<RecorridoUnico> recorridos = (List<RecorridoUnico>) query.list();

	    return recorridos;
	}

}
