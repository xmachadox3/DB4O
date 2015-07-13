package com.clases;

public class Cliente extends Persona{
	private String ndeposito;
	private Paquete paquete;
	private Pago pago;
	public Cliente(String cedula, String nombre, String apellido,
			String telefono, String clave, String login, String ndeposito,
			Paquete paquete, Pago pago) {
		super(cedula, nombre, apellido, telefono, clave, login);
		this.ndeposito = ndeposito;
		this.paquete = paquete;
		this.pago = pago;
	}
	public String getNdeposito() {
		return ndeposito;
	}
	public void setNdeposito(String ndeposito) {
		this.ndeposito = ndeposito;
	}
	public Paquete getPaquete() {
		return paquete;
	}
	public void setPaquete(Paquete paquete) {
		this.paquete = paquete;
	}
	public Pago getPago() {
		return pago;
	}
	public void setPago(Pago pago) {
		this.pago = pago;
	}
	@Override
	public String toString() {
		return "Cliente [ndeposito=" + ndeposito + ", paquete=" + paquete
				+ ", pago=" + pago + "]";
	}
	
}