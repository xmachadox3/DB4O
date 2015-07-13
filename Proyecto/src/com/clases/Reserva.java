package com.clases;

public class Reserva {
	String codigo;
	Cliente cliente;
	Paquete paquete;
	public Reserva(String codigo, Cliente cliente, Paquete paquete) {
		super();
		this.codigo = codigo;
		this.cliente = cliente;
		this.paquete = paquete;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	public Paquete getPaquete() {
		return paquete;
	}
	public void setPaquete(Paquete paquete) {
		this.paquete = paquete;
	}
	@Override
	public String toString() {
		return "Reserva [codigo=" + codigo + ", cliente=" + cliente
				+ ", paquete=" + paquete + "]";
	}
	
}
