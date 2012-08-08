package com.mx.mneg.tlp.dao;

import java.util.List;

import com.mx.mneg.tlp.modelo.Ejemplo;

/**
 * A cada Interfaz que se encuentre en este paquete base
 * se le creará una implementación como bean de Spring al levantar el contenedor.
 * 
 * Los métodos de esta interfaz sirven como llave para la ejecución
 * de SQL's declarados dentro de un archivo XML. En este caso
 * llamado, por convención, Ejemplo.xml
 * 
 * @author Alejandro Pimentel
 *
 */
public interface EjemploDao {

	List<Ejemplo> consultarTodos();
	
	void insertarEjemplo(Ejemplo ejemplo);
}
