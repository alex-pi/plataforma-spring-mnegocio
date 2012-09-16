package com.mx.mneg.tlp.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.mneg.tlp.modelo.DatosCliente;
import com.mx.mneg.tlp.servicios.ProcesoFacturacionServicio;

@Controller
@RequestMapping("/facturacion")
public class FacturacionController {
		
	private static final Logger log = LoggerFactory.getLogger(FacturacionController.class);
	
	@Autowired
	private ProcesoFacturacionServicio procesoFacturacionServicio;
	
	@RequestMapping(value="/registro/generales", method=RequestMethod.POST)
	@ResponseBody
	public DatosCliente registrarDatos(@RequestBody DatosCliente datos) throws InterruptedException{
		log.debug(datos.toString());
		Thread.sleep(6000);
		procesoFacturacionServicio.registrarDatosCliente(datos);
	
		return datos;
	}
}
