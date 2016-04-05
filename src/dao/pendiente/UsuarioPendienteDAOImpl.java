package dao.pendiente;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import model.pendiente.UsuarioPendiente;
import model.usuario.Usuario;
import dao.generic.GenericDAOImpl;

public class UsuarioPendienteDAOImpl extends GenericDAOImpl<UsuarioPendiente,Long>  implements UsuarioPendienteDAO{

	public UsuarioPendienteDAOImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
		// TODO Auto-generated constructor stub
	}
	@Transactional
	public UsuarioPendiente getRegistro(Long idRecorrido, Long idUsuario){
		Query query = getCurrentSession().createQuery(
                "select r from UsuarioPendiente r where usuario_id=:usuario_id and recorrido_id=:recorrido_id");
		query.setParameter("usuario_id", idUsuario);
		query.setParameter("recorrido_id", idRecorrido);		
		return (UsuarioPendiente) query.uniqueResult();
		
	}
	@Transactional
	public List<UsuarioPendiente> activosDeUsuario(Usuario u){
		
		List<UsuarioPendiente> resultado = new ArrayList<UsuarioPendiente>();
		List<UsuarioPendiente> all = (List<UsuarioPendiente>)this.list();
		for (UsuarioPendiente upen:all){
			if (upen.getRecorrido().getCreador().getEmail().equals(u.getEmail()) && upen.getRecorrido().getAsientos()>0)
				resultado.add(upen);
		}
		return resultado;
		
	}
	
	@Transactional
	public void delete(Long id) {
		Query query = getCurrentSession().createQuery(
                " delete from UsuarioPendiente r where recorrido_id =:id");
		query.setParameter("id", id);
		query.executeUpdate();
		
	}
	@Transactional
	@SuppressWarnings("unchecked")
	@Override
	public List<UsuarioPendiente> getUser(Long id) {
		Query query = getCurrentSession().createQuery(
                "select r from UsuarioPendiente r where  recorrido_id=:recorrido_id");
		query.setParameter("recorrido_id", id);
		return (List<UsuarioPendiente>)query.list();
	}

}
