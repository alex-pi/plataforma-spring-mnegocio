package com.mx.mneg.tlp.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mx.mneg.tlp.servicios.EjemploServicio;

/**
 * Todos los controllers deben llevar el estereotipo {@link Controller} y opcionalmente
 * por medio de {@link RequestMapping} indicar un path base para todas
 * las peticiones que atenderá este controller.
 * 
 * @author Alejandro Pimentel
 *
 */
@Controller
@RequestMapping("/ejemplos")
public class EjemplosController {

	@Autowired
	private EjemploServicio ejemploServicio;
	
	/**
	 * Llama métodos de servicio que provocan excepciones creadas de distintos modos para ilustrar
	 * el manejo de errores de la aplicación.
	 * 
	 * @param ejemplo Dependiendo del valor de este parámetro se llamará un método distintito de
	 *    		nuestro bean de Servicio.
	 */
	@RequestMapping(value= "/error/simple/{ejemplo}", method = RequestMethod.GET)
	public void ejemploManejoErrorNegocio(@PathVariable Integer ejemplo) {
		
		if(ejemplo.equals(1)){
			ejemploServicio.ejemploMensajeErrorNegocio();
		} else if(ejemplo.equals(2)){
			ejemploServicio.ejemploCodigoMensajeErrorNegocio();
		}
	}	
}
