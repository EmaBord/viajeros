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
	    System.out.println("q1 "+recorridos.size());
	    Iterator<RecorridoUnico> iterator = recorridos.iterator();
		while (iterator.hasNext()) {
			RecorridoUnico recorrido = iterator.next();
			int result = recorrido.format(recorrido.getSalida()).compareTo(timeStamp);
			if ( (!recorrido.getCreador().getBloqueado()) && (result >= 0)&& recorrido.getAsientos()>0 ){
				Query query2  = getCurrentSession().createQuery(
		                "select r from UsuarioViajero r where usuario_id =:usuario_id and recorrido_id=:recorrido_id");
				query2.setParameter("usuario_id", u.getId());
				query2.setParameter("recorrido_id", recorrido.getId());
				
				Query query3  = getCurrentSession().createQuery(
		                "select r from UsuarioPendiente r where usuario_id =:usuario_id and recorrido_id=:recorrido_id");
				query3.setParameter("usuario_id", u.getId());
				query3.setParameter("recorrido_id", recorrido.getId());
				System.out.println("q2 "+query2.list().size() );
				System.out.println("q3 "+query3.list().size() );
				if (query2.list().size()==0 && query3.list().size()==0)
					activos.add(recorrido);
				
			}
				
				
		}
	    Collections.sort(activos);
	    return activos;
		
	}
	@Override
	@Transactional
	public List<RecorridoUnico> activosDeUsuario(Usuario u) {
		List<RecorridoUnico> recoUser = new ArrayList<RecorridoUnico>();
		List<RecorridoUnico> recorridos = this.list();
		for (RecorridoUnico reco:recorridos){
			if (reco.getCreador().getEmail().equals(u.getEmail()))
				recoUser.add(reco);
		}

		return recoUser;
	}

}
