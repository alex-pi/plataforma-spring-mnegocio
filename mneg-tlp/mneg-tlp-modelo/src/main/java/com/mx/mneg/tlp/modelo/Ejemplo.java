package com.mx.mneg.tlp.modelo;

import com.mx.mneg.infra.utils.BaseModelo;

public class Ejemplo extends BaseModelo {

	private String nombre;
	private String apellido;
	
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
	
}
