package com.clases;


import java.util.List;

public class Propietario extends Persona{
	private String ncuenta;
	private List<CasaPlaya> casasplayas;
	public Propietario(String cedula, String nombre, String apellido,
			String telefono, String clave, String login, String ncuenta,
			List<CasaPlaya> casasplayas) {
		super(cedula, nombre, apellido, telefono, clave, login);
		this.ncuenta = ncuenta;
		this.casasplayas = casasplayas;
	}
	public String getNcuenta() {
		return ncuenta;
	}
	public void setNcuenta(String ncuenta) {
		this.ncuenta = ncuenta;
	}
	public List<CasaPlaya> getCasasplayas() {
		return casasplayas;
	}
	public void setCasasplayas(List<CasaPlaya> casasplayas) {
		this.casasplayas = casasplayas;
	}
	@Override
	public String toString() {
		return "Propietario [ncuenta=" + ncuenta + ", casasplayas="
				+ casasplayas + "]";
	}
}
