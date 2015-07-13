package com.clases;

public class CasaPlaya {
	
	private String codigo;
	private String poblacion;
	private Integer nhabitaciones;
	private Integer nbanos;
	private Integer ncocinas;
	private Integer ncomedores;
	private Integer nestacionamientos;
	private boolean estadoactual;
	private Paquete paquete;
	private Propietario propietario;
	public CasaPlaya(String codigo, String poblacion, Integer nhabitaciones,
			Integer nbanos, Integer ncocinas, Integer ncomedores,
			Integer nestacionamientos, boolean estadoactual, Paquete paquete,
			Propietario propietario) {
		super();
		this.codigo = codigo;
		this.poblacion = poblacion;
		this.nhabitaciones = nhabitaciones;
		this.nbanos = nbanos;
		this.ncocinas = ncocinas;
		this.ncomedores = ncomedores;
		this.nestacionamientos = nestacionamientos;
		this.estadoactual = estadoactual;
		this.paquete = paquete;
		this.propietario = propietario;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getPoblacion() {
		return poblacion;
	}
	public void setPoblacion(String poblacion) {
		this.poblacion = poblacion;
	}
	public Integer getNhabitaciones() {
		return nhabitaciones;
	}
	public void setNhabitaciones(Integer nhabitaciones) {
		this.nhabitaciones = nhabitaciones;
	}
	public Integer getNbanos() {
		return nbanos;
	}
	public void setNbanos(Integer nbanos) {
		this.nbanos = nbanos;
	}
	public Integer getNcocinas() {
		return ncocinas;
	}
	public void setNcocinas(Integer ncocinas) {
		this.ncocinas = ncocinas;
	}
	public Integer getNcomedores() {
		return ncomedores;
	}
	public void setNcomedores(Integer ncomedores) {
		this.ncomedores = ncomedores;
	}
	public Integer getNestacionamientos() {
		return nestacionamientos;
	}
	public void setNestacionamientos(Integer nestacionamientos) {
		this.nestacionamientos = nestacionamientos;
	}
	public boolean isEstadoactual() {
		return estadoactual;
	}
	public void setEstadoactual(boolean estadoactual) {
		this.estadoactual = estadoactual;
	}
	public Paquete getPaquete() {
		return paquete;
	}
	public void setPaquete(Paquete paquete) {
		this.paquete = paquete;
	}
	public Propietario getPropietario() {
		return propietario;
	}
	public void setPropietario(Propietario propietario) {
		this.propietario = propietario;
	}
	@Override
	public String toString() {
		return "CasaPlaya [codigo=" + codigo + ", poblacion=" + poblacion
				+ ", nhabitaciones=" + nhabitaciones + ", nbanos=" + nbanos
				+ ", ncocinas=" + ncocinas + ", ncomedores=" + ncomedores
				+ ", nestacionamientos=" + nestacionamientos
				+ ", estadoactual=" + estadoactual + ", paquete=" + paquete
				+ ", propietario=" + propietario + "]";
	}
	
	
	
}
