package dao.usuario;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;
import dao.generic.GenericDAOImpl;
import model.usuario.Usuario;
public class UsuarioDAOImpl extends GenericDAOImpl<Usuario, Long>  implements UsuarioDAO {


	 
	public UsuarioDAOImpl(SessionFactory sessionFactory) {
		super(sessionFactory);	
	}

	@Override
	@Transactional
    public boolean eliminarUsuario(Usuario u) {
		u.setBloquedo(true);
		this.update(u);
		return true;
		
    }

	@Override
	@Transactional
    public boolean existe(String email) {		
		Query usuarioTaskQuery = getCurrentSession().createQuery(
                "select u from Usuario u where email=:email");
        usuarioTaskQuery.setParameter("email", email);        
        return usuarioTaskQuery.list().size() > 0;
    }
	@Override
	@Transactional
	public Usuario getUsuario(String email) {		
		Query usuarioTaskQuery = getCurrentSession().createQuery(
                "select u from Usuario u where email=:email");
        usuarioTaskQuery.setParameter("email", email);        
        if (usuarioTaskQuery.list().size() > 0)
        	return (Usuario) usuarioTaskQuery.list().get(0);
        else 
        	return null;
    }
	

	

 
    



	
}