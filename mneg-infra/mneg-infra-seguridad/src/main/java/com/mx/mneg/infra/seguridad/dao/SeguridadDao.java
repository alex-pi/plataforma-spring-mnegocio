package com.mx.mneg.infra.seguridad.dao;

import java.util.List;

import com.mx.mneg.infra.modelo.RolSeguridad;
import com.mx.mneg.infra.modelo.UsuarioSeguridad;

/**
 * Servicios de acceso a datos para roles y usuario de seguridad.
 * 
 * @author Alejandro Pimentel
 *
 */
public interface SeguridadDao {

	List<UsuarioSeguridad> consultarUsarios();
	
	List<RolSeguridad> consultarRoles();
	
	UsuarioSeguridad consultarUsuarioConRoles(String username);
}
