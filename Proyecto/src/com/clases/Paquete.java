package com.clases;

import java.util.Date;

public class Paquete {
	private String codigo;
	private Date fechainicio;
	private Date fechafinal;
	private Float precio;
	private Integer estados; //1 - SIN RESERVAR, 2 - RESERVADO, 3 - PAGADO. 
	private Cliente cliente;
	private Pago pago;
	private CasaPlaya casaplaya;
	public Paquete(String codigo, Date fechainicio, Date fechafinal,
			Float precio, Integer estados, Cliente cliente, Pago pago,
			CasaPlaya casaplaya) {
		super();
		this.codigo = codigo;
		this.fechainicio = fechainicio;
		this.fechafinal = fechafinal;
		this.precio = precio;
		this.estados = estados;
		this.cliente = cliente;
		this.pago = pago;
		this.casaplaya = casaplaya;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public Date getFechainicio() {
		return fechainicio;
	}
	public void setFechainicio(Date fechainicio) {
		this.fechainicio = fechainicio;
	}
	public Date getFechafinal() {
		return fechafinal;
	}
	public void setFechafinal(Date fechafinal) {
		this.fechafinal = fechafinal;
	}
	public Float getPrecio() {
		return precio;
	}
	public void setPrecio(Float precio) {
		this.precio = precio;
	}
	public Integer getEstados() {
		return estados;
	}
	public void setEstados(Integer estados) {
		this.estados = estados;
	}
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	public Pago getPago() {
		return pago;
	}
	public void setPago(Pago pago) {
		this.pago = pago;
	}
	public CasaPlaya getCasaplaya() {
		return casaplaya;
	}
	public void setCasaplaya(CasaPlaya casaplaya) {
		this.casaplaya = casaplaya;
	}
	@Override
	public String toString() {
		return "Paquete [codigo=" + codigo + ", fechainicio=" + fechainicio
				+ ", fechafinal=" + fechafinal + ", precio=" + precio
				+ ", estados=" + estados + ", cliente=" + cliente + ", pago="
				+ pago + ", casaplaya=" + casaplaya + "]";
	}
	
	
}
