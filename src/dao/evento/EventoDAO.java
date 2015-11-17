package dao.evento;

import java.util.Date;

import model.evento.Evento;
import dao.generic.GenericDAO;

public interface EventoDAO extends GenericDAO<Evento, Integer> {
	public void eliminarEvento(Evento e);
    public boolean existe(String nombre,Date fecha);
    public Evento getEvento(String nombre,Date fecha);

}
