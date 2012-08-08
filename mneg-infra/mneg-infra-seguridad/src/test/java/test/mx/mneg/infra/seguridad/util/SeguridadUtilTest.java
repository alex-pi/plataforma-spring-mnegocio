package test.mx.mneg.infra.seguridad.util;

import org.junit.Assert;
import org.junit.Test;

import test.mx.mneg.infra.seguridad.SeguridadBaseTest;

import com.mx.mneg.infra.modelo.UsuarioSeguridad;
import com.mx.mneg.infra.utils.seguridad.SeguridadUtil;

public class SeguridadUtilTest extends SeguridadBaseTest {

	@Test
	public void getUsuarioActualTest(){
		UsuarioSeguridad usuario = SeguridadUtil.getUsuarioActual();
		
		Assert.assertNotNull(usuario);
	}
}
