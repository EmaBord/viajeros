package dao.evento;

import java.util.List;

import model.evento.Evento;
import dao.generic.GenericDAO;

public interface EventoDAO extends GenericDAO<Evento, Integer> {
	public void eliminarEvento(Evento e);
    public boolean existe(String nombre,String fecha,String lugar,String hora);
    public Evento getEvento(String nombre,String fecha,String lugar,String hora);
	public List<Evento> activos();
	public Evento getEvento(Long id);
	


}
