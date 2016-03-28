package model.recorrido;

import javax.persistence.Entity;

import org.hibernate.annotations.ForeignKey;

@Entity
@ForeignKey(name = "id")
public class RecorridoUnico extends Recorrido implements Comparable<Recorrido>{

	@Override
	public int compareTo(Recorrido o) {
		return this.format(this.getSalida()).compareTo(this.format(o.getSalida()));
	}
	

}
