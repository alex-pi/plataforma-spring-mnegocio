package com.mx.mneg.tlp.servicios;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.masnegocio.mcdonalds.McDonalds;
import com.mx.mneg.infra.utils.ErrorNegocio;
import com.mx.mneg.tlp.dao.EjemploDao;
import com.mx.mneg.tlp.modelo.Ejemplo;

/**
 * Las clases de servicio deben llevar el estereotipo {@link Service} para
 * spring los tome como beans dentro del contenedor.
 * 
 * @author Alejandro Pimentel
 *
 */
@Service
public class EjemploServicioImpl implements EjemploServicio {

	private static final Logger log = LoggerFactory.getLogger(EjemploServicioImpl.class);
	
	@Autowired
	private EjemploDao ejemploDao;
	
	@Resource(name="mcDonaldsService")
	private McDonalds mcDonaldsService;
	
	/**
	 * Cuando se en encuentra un error o inconsistencia en el negocio se puede lanzar
	 * una excepción detallando en un mensaje lo sucedido.
	 * 
	 * El lanzar esta excepción también implica que a la transacción iniciada al llamar a
	 * este método de servicio se le hará rollback. De este modo no se afectará nada dentro de
	 * la BD.
	 * 
	 */
	public void ejemploMensajeErrorNegocio(){
		throw new ErrorNegocio("Aqui se explica lo que salió mal con la lógica de negocio.");
	}
	
	/**
	 * Estos mensajes pueden ser un código de un mensaje que se encuentre declarado dentro
	 * de un archivo properties dentro del directorio WEB-INF/mensajes.
	 * 
	 * Pueden también llevar un objeto con información adicional. En nuestro caso, este mensaje
	 * será devuelto en formato json al cliente.
	 * 
	 */
	public void ejemploCodigoMensajeErrorNegocio(){
		Ejemplo e = new Ejemplo();
		e.setId(1l);
		e.setNombre("Martin");
		e.setApellido("Fowler");
		throw new ErrorNegocio(new Object[]{}, "codigo.mensaje.ejemplo", e);
	}	
	
	/**
	 * Ejemplo de uso de un Dao desde clase de Servicios.
	 *  
	 */
	public Long guardarEjemplo(Ejemplo ejemplo){
		ejemploDao.insertarEjemplo(ejemplo);
		
		return ejemplo.getId();
	}
	
	public McDonalds ejemploWebService(){
		return mcDonaldsService;
	}
	
	public String generarFactura(String peticionFactura){
		return this.mcDonaldsService.generarFactura(peticionFactura);
	}

}
