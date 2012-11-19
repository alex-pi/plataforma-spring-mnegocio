package com.mx.mneg.tlp.servicios;

import com.masnegocio.mcdonalds.McDonalds;
import com.mx.mneg.tlp.modelo.Ejemplo;

public interface EjemploServicio {

	void ejemploMensajeErrorNegocio();
	
	void ejemploCodigoMensajeErrorNegocio();
	
	Long guardarEjemplo(Ejemplo ejemplo);
	
	String generarFactura(String peticionFactura);
	
	McDonalds ejemploWebService();
}
