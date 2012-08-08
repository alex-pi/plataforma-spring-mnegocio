package test.com.mx.mneg.tlp.servicios;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.mx.mneg.infra.utils.ErrorNegocio;
import com.mx.mneg.tlp.modelo.Ejemplo;
import com.mx.mneg.tlp.servicios.EjemploServicio;

public class EjemploServicioImplTest extends BaseServicioTest {
	
	@Autowired
	private EjemploServicio ejemploServicio;

	@Test
	public void ejemploServicioDependenciaTest(){
		Assert.assertNotNull(ejemploServicio);
	}
	
	@Test(expected=ErrorNegocio.class)
	public void ejemploMensajeErrorNegocioTest(){
		ejemploServicio.ejemploCodigoMensajeErrorNegocio();
	}
	
	@Test
	public void guardarEjemplo(){
		Ejemplo e = new Ejemplo();
		e.setNombre("Alex");
		e.setApellido("Pi");
		
		ejemploServicio.guardarEjemplo(e);
		
		Assert.assertNotNull(e.getId());
	}
}
