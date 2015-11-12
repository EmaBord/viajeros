package dao.generic;

import java.util.List;

public interface GenericDAO<T, E>{
	     void save(T entity);
	     void update(T entity);
	     void delete(T entity);
	     T findByKey(E key);
	     List<T> list();
	}
