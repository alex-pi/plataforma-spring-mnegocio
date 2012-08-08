package com.mx.mneg.infra.seguridad.servicios;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mx.mneg.infra.seguridad.dao.ModuloMenuDao;
import com.mx.mneg.infra.seguridad.dao.OpcionMenuDao;
import com.mx.mneg.infra.modelo.ModuloMenu;
import com.mx.mneg.infra.modelo.OpcionMenu;

/**
 * Clase de servicio que permite acceder a la información del Menú de opciones.
 * 
 * @author Alejandro Pimentel
 *
 */
@Service
public class MenuSeguridadServicioImpl implements MenuSeguridadServicio {

	@Autowired
	private ModuloMenuDao moduloMenuDao;
	@Autowired
	private OpcionMenuDao opcionMenuDao;

	/**
	 * 
	 * {@inheritDoc}
	 */
	public List<ModuloMenu> consultarModulos() {
		List<ModuloMenu> modulos = moduloMenuDao.consultarTodos();
		
		return modulos;
	}

	public OpcionMenu consultarOpcionSubOpciones(Long idPadre) {
		return opcionMenuDao.consultarOpcionSubOpciones(idPadre);
	}
	
	public ModuloMenu consultarModuloMenu(Long idModulo){
		return moduloMenuDao.consultarModulo(idModulo);
	}
}
