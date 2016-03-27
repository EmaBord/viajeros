package model.recorrido;

import javax.persistence.Entity;

import org.hibernate.annotations.ForeignKey;

@Entity
@ForeignKey(name = "id")
public class RecorridoUnico extends Recorrido {
	

}
