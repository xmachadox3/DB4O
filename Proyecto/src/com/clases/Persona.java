package com.clases;

public class Persona {
	
	private String cedula;
	private String nombre;
	private String apellido;
	private String telefono;
	private String clave;
	private String login;
	public String getCedula() {
		return cedula;
	}
	public void setCedula(String cedula) {
		this.cedula = cedula;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getClave() {
		return clave;
	}
	public void setClave(String clave) {
		this.clave = clave;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	@Override
	public String toString() {
		return "Persona [cedula=" + cedula + ", nombre=" + nombre
				+ ", apellido=" + apellido + ", telefono=" + telefono
				+ ", clave=" + clave + ", login=" + login + "]";
	}
	public Persona(String cedula, String nombre, String apellido,
			String telefono, String clave, String login) {
		super();
		this.cedula = cedula;
		this.nombre = nombre;
		this.apellido = apellido;
		this.telefono = telefono;
		this.clave = clave;
		this.login = login;
	}
}