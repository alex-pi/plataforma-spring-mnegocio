package com.mx.mneg.tlp.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Controller encargado de devolver la vista principal o index de la zona 
 * pública de la aplicación.
 * 
 * 
 * @author Alejandro Pimentel
 *
 */
@Controller
@RequestMapping("/publico")
public class IndexPublicoController {	

    private static final Logger log = LoggerFactory.getLogger(IndexPublicoController.class);
    
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView mostrarIndexPublico(){
    	
    	return new ModelAndView("publico/index");
    }
	
}
