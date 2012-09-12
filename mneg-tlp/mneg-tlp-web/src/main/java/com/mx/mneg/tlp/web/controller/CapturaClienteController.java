package com.mx.mneg.tlp.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mx.mneg.tlp.modelo.Cliente;

@Controller
@RequestMapping("/facturacion")
public class CapturaClienteController {
	
	private static final Logger log = LoggerFactory.getLogger(CapturaClienteController.class);

	@RequestMapping(value="/cliente", method=RequestMethod.POST)
	@ResponseBody
	public Boolean registrarCliente(@RequestBody Cliente cliente) {
		log.debug(cliente.toString());
		
		return true;
	}
}
