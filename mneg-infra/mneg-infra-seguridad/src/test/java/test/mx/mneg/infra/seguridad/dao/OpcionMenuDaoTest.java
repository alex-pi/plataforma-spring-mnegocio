package test.mx.mneg.infra.seguridad.dao;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import test.mx.mneg.infra.seguridad.SeguridadBaseTest;

import com.mx.mneg.infra.seguridad.dao.OpcionMenuDao;
import com.mx.mneg.infra.modelo.OpcionMenu;

public class OpcionMenuDaoTest extends SeguridadBaseTest {
	
	@Autowired
	private OpcionMenuDao opcionMenuDao;
	
	@Test
	public void dependenciaTest(){
		Assert.assertNotNull(opcionMenuDao);
	}
	
	@Test
	public void consultarTodosTest(){
		List<OpcionMenu> opciones =
				opcionMenuDao.consultarTodos();
		
		Assert.assertFalse(opciones.isEmpty());
	}

	@Test
	public void consultarOpcionTest(){
		OpcionMenu opcion =
				opcionMenuDao.consultarOpcion(1l);
		
		Assert.assertNotNull(opcion);
	}
	
	@Test
	public void consultarOpcionesHijasTest(){
		List<OpcionMenu> opciones =
				opcionMenuDao.consultarOpcionesHijas(1l);
		
		Assert.assertFalse(opciones.isEmpty());
	}	
	
	@Test
	public void consultarOpcionSubOpciones(){
		OpcionMenu opcion =
				opcionMenuDao.consultarOpcionSubOpciones(1l);
		
		Assert.assertNotNull(opcion);
		Assert.assertFalse(opcion.getOpciones().isEmpty());
	}	
	
}
