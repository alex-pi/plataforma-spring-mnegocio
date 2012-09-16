package com.mx.mneg.tlp.dao;

import java.util.List;

import com.mx.mneg.tlp.modelo.DatosCliente;

public interface DatosClienteDao {

	List<DatosCliente> consultarTodos();
	
	void insertar(DatosCliente datosCliente);
	
	List<DatosCliente> consultarPorRfc(String rfc);
}
