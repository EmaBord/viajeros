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

import model.recorrido.RecorridoMasUnDia;
import model.usuario.Usuario;
import dao.generic.GenericDAOImpl;

public class RecorridoMasUnDiaDAOImpl extends GenericDAOImpl<RecorridoMasUnDia,Long> implements RecorridoMasDeUnDiaDAO{

	public RecorridoMasUnDiaDAOImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
		// TODO Auto-generated constructor stub
	}

	@Override
	@Transactional
	public List<RecorridoMasUnDia> activos() {
		List<RecorridoMasUnDia> activos = new ArrayList<RecorridoMasUnDia>();
       
		Query query = getCurrentSession().createQuery(
                "from RecorridoMasUnDia");
	    List<RecorridoMasUnDia> recorridos = (List<RecorridoMasUnDia>) query.list();
	    Iterator<RecorridoMasUnDia> iterator = recorridos.iterator();
		while (iterator.hasNext()) {
			RecorridoMasUnDia recorrido = iterator.next();
			if (! recorrido.getCreador().getBloqueado())
				activos.add(recorrido);
		}
	    return activos;
	}

	@Override
	@Transactional
	public List<RecorridoMasUnDia> activosSinUsuario(Usuario u) {
		String timeStamp = new SimpleDateFormat("yyyy/MM/dd HH:mm").format(Calendar.getInstance().getTime());
		List<RecorridoMasUnDia> activos = new ArrayList<RecorridoMasUnDia>();
        
		Query query = getCurrentSession().createQuery(
                "select r from RecorridoMasUnDia r where creador_id <>:usuario_id");
		query.setParameter("usuario_id", u.getId());
	    List<RecorridoMasUnDia> recorridos = (List<RecorridoMasUnDia>) query.list();
	    Iterator<RecorridoMasUnDia> iterator = recorridos.iterator();
		while (iterator.hasNext()) {
			RecorridoMasUnDia recorrido = iterator.next();
			int result = recorrido.formatFinaliza(recorrido.getFinaliza()).compareTo(timeStamp);
			if (! (recorrido.getCreador().getBloqueado()) && (result >= 0) && recorrido.getAsientos()>0)
				activos.add(recorrido);
		}
		Collections.sort(activos);
	
		
	    return activos;
	}

}


