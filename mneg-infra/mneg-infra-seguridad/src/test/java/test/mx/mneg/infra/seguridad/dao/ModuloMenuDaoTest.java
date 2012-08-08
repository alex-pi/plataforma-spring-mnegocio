package test.mx.mneg.infra.seguridad.dao;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import test.mx.mneg.infra.seguridad.SeguridadBaseTest;

import com.mx.mneg.infra.seguridad.dao.ModuloMenuDao;
import com.mx.mneg.infra.modelo.ModuloMenu;

public class ModuloMenuDaoTest extends SeguridadBaseTest {
	
	@Autowired
	private ModuloMenuDao moduloMenuDao;
	
	@Test
	public void dependenciaTest(){
		Assert.assertNotNull(moduloMenuDao);
	}
	
	@Test
	public void consultarTodosTest(){
		List<ModuloMenu> opciones =
				moduloMenuDao.consultarTodos();
		
		Assert.assertFalse(opciones.isEmpty());
	}
	
	@Test
	public void consultarModulo(){
		ModuloMenu opcion =
				moduloMenuDao.consultarModulo(6l);
		
		Assert.assertNotNull(opcion);
	}

}
