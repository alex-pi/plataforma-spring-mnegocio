package test.mx.mneg.infra.seguridad.servicios;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import test.mx.mneg.infra.seguridad.SeguridadBaseTest;

import com.mx.mneg.infra.modelo.ModuloMenu;
import com.mx.mneg.infra.seguridad.servicios.MenuSeguridadServicio;

public class MenuSeguridadServicioImplTest extends SeguridadBaseTest {
	
	@Autowired
	private MenuSeguridadServicio menuSeguridadServicio;

	@Test
	public void dependenciaTest(){
		Assert.assertNotNull(menuSeguridadServicio);
	}
	
	@Test
	public void consultarModulosTest(){
		List<ModuloMenu> modulos = menuSeguridadServicio.consultarModulos();
		
		Assert.assertFalse(modulos.isEmpty());
		Assert.assertEquals(2, modulos.size());
	}
}
