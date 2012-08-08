package com.mx.mneg.infra.utils.web;

/**
 * Interfaz que algún mecanismo de notificación de errores debe implementar.
 * 
 * @author Alejandro Pimentel
 *
 */
public interface ServicioNotificacion {

	/**
	 * Publica la información del error en algún medio.
	 * 
	 * @param infoError
	 */
   public void notificarError(InformacionError infoError);

}
