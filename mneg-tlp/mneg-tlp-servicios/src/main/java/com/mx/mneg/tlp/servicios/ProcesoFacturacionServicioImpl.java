package com.mx.mneg.tlp.servicios;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mx.mneg.infra.utils.ErrorNegocio;
import com.mx.mneg.tlp.dao.DatosClienteDao;
import com.mx.mneg.tlp.modelo.DatosCliente;

@Service
public class ProcesoFacturacionServicioImpl implements ProcesoFacturacionServicio{

	@Autowired
	private DatosClienteDao datosClienteDao;
	
	public long registrarDatosCliente(DatosCliente datosCliente) {
		List<DatosCliente> existente = datosClienteDao
			.consultarPorRfc(datosCliente.getRfc());
		
		if(!existente.isEmpty()){
			throw new ErrorNegocio("El rfc especificado ya existe.");
		}
		datosClienteDao.insertar(datosCliente);
		
		return datosCliente.getId();
	}

}
