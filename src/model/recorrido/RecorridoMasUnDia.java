package model.recorrido;


import javax.persistence.Entity;



@Entity
public class RecorridoMasUnDia extends Recorrido implements Comparable<RecorridoMasUnDia> {

	private String [] dias;
	private String finaliza;
	
	public void setDias(String[] dias) {
		this.dias = dias;
	}
	public String[] getDias() {
		return this.dias;
	}
	public String getFinaliza() {
		return finaliza;
	}
	public void setFinaliza(String finaliza) {
		this.finaliza = finaliza;
	}
	@Override
	public int compareTo(RecorridoMasUnDia arg0) {
		
		
		return this.formatFinaliza(this.getFinaliza()).compareTo(this.formatFinaliza(arg0.getFinaliza()));

	}
	

}
