package com.mx.mneg.tlp.modelo;

import com.mx.mneg.infra.utils.BaseModelo;

public class Cliente extends BaseModelo{

	private String nombre;
	private String rfc;
	private String calle;
	private String numExterior;
	private Integer numInterior;
	private String colonia;
	private String municipio;
	private String localidad;
	private String estado;
	private String cp;
	
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
	public Integer getNumInterior() {
		return numInterior;
	}
	public void setNumInterior(Integer numInterior) {
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
	public String getCp() {
		return cp;
	}
	public void setCp(String cp) {
		this.cp = cp;
	}
	
	@Override
	public String toString() {
		return "Cliente [nombre=" + nombre + ", rfc=" + rfc + ", calle="
				+ calle + ", numExterior=" + numExterior + ", numInterior="
				+ numInterior + ", colonia=" + colonia + ", municipio="
				+ municipio + ", localidad=" + localidad + ", estado=" + estado
				+ ", cp=" + cp + "]";
	}	
}
