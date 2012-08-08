package test.mx.mneg.infra.seguridad.dao;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import test.mx.mneg.infra.seguridad.SeguridadBaseTest;

import com.mx.mneg.infra.seguridad.dao.SeguridadDao;
import com.mx.mneg.infra.modelo.UsuarioSeguridad;

public class SeguridadDaoTest extends SeguridadBaseTest {
	
	@Autowired
	private SeguridadDao seguridadDao;
	
	@Test
	public void dependenciaTest(){
		Assert.assertNotNull(seguridadDao);
	}
	
	@Test
	public void consultarUsariosTest(){
		List<UsuarioSeguridad> usuarios =
				seguridadDao.consultarUsarios();
		
		Assert.assertFalse(usuarios.isEmpty());
	}
	
	@Test
	public void consultarUsuarioConRolesTest(){
		UsuarioSeguridad usuario =
				seguridadDao.consultarUsuarioConRoles("usain");
		
		Assert.assertNotNull(usuario);
		Assert.assertFalse(usuario.getRoles().isEmpty());
		Assert.assertEquals(2 ,usuario.getRoles().size());
	}
}
