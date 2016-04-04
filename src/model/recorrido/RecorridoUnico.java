package model.recorrido;

import javax.persistence.Entity;


@Entity
public class RecorridoUnico extends Recorrido implements Comparable<RecorridoUnico>{

	
	
	@Override
	public int compareTo(RecorridoUnico o) {
		return this.format(this.getSalida()).compareTo(this.format(o.getSalida()));
	}


	
	

}
