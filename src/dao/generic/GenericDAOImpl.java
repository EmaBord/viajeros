package dao.generic;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.annotation.PostConstruct;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;



@Repository("genericDAO")
public abstract class GenericDAOImpl <T, E>
        implements GenericDAO<T, E>{



	@Autowired
	private SessionFactory sessionFactory;

	protected Class<? extends E> daoType;
	
	@PostConstruct
	public void init(){
		sessionFactory = (SessionFactory) sessionFactory.openSession();
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public GenericDAOImpl(SessionFactory sessionFactory){
		 Type t = getClass().getGenericSuperclass();
	        ParameterizedType pt = (ParameterizedType) t;
	        daoType = (Class) pt.getActualTypeArguments()[0];
	        this.sessionFactory = sessionFactory;
	}
	

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	@Transactional
	public void save(T entity) {
		getCurrentSession().save(entity);
	}
	@Transactional
	public void update(T entity) {
		//getCurrentSession().merge(entity);
		getCurrentSession().saveOrUpdate(entity);
	}
	@Transactional
	public void delete(T entity) {
		getCurrentSession().delete(entity);
	}
	@SuppressWarnings("unchecked")
	@Transactional
	public T findByKey(E key) {
		return (T) getCurrentSession().get(daoType, (Serializable) key);
	}
	@SuppressWarnings("unchecked")
	@Transactional
	public List<T> list() {
		return getCurrentSession().createCriteria(daoType).list();
	}
}