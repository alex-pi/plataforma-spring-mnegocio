package com.mx.mneg.tlp.modelo;

import com.mx.mneg.infra.utils.BaseModelo;

public class DatosCliente extends BaseModelo{

	private String nombre; 
	private String rfc; 
	private String calle; 
	private String numExterior; 
	private String numInterior; 
	private String colonia; 
	private String municipio; 
	private String localidad; 
	private String estado; 
	private Integer cp;
	
	public DatosCliente(){}
	
	public DatosCliente(String nombre, String rfc, String calle,
			String numExterior, String numInterior, String colonia,
			String municipio, String localidad, String estado, Integer cp) {
		super();
		this.nombre = nombre;
		this.rfc = rfc;
		this.calle = calle;
		this.numExterior = numExterior;
		this.numInterior = numInterior;
		this.colonia = colonia;
		this.municipio = municipio;
		this.localidad = localidad;
		this.estado = estado;
		this.cp = cp;
	}
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getRfc() {
		return rfc;
	}
	public void setRfc(String rfc) {
		this.rfc = rfc;
	}
	public String getCalle() {
		return calle;
	}
	public void setCalle(String calle) {
		this.calle = calle;
	}
	public String getNumExterior() {
		return numExterior;
	}
	public void setNumExterior(String numExterior) {
		this.numExterior = numExterior;
	}
	public String getNumInterior() {
		return numInterior;
	}
	public void setNumInterior(String numInterior) {
		this.numInterior = numInterior;
	}
	public String getColonia() {
		return colonia;
	}
	public void setColonia(String colonia) {
		this.colonia = colonia;
	}
	public String getMunicipio() {
		return municipio;
	}
	public void setMunicipio(String municipio) {
		this.municipio = municipio;
	}
	public String getLocalidad() {
		return localidad;
	}
	public void setLocalidad(String localidad) {
		this.localidad = localidad;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public Integer getCp() {
		return cp;
	}
	public void setCp(Integer cp) {
		this.cp = cp;
	}
	
	@Override
	public String toString() {
		return "DatosCliente [nombre=" + nombre + ", rfc=" + rfc + ", calle="
				+ calle + ", numExterior=" + numExterior + ", numInterior="
				+ numInterior + ", colonia=" + colonia + ", municipio="
				+ municipio + ", localidad=" + localidad + ", estado=" + estado
				+ ", cp=" + cp + "]";
	}
}
