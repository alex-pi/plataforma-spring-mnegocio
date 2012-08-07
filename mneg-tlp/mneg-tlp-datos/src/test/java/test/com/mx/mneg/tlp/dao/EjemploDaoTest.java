package test.com.mx.mneg.tlp.dao;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.mx.mneg.tlp.dao.EjemploDao;
import com.mx.mneg.tlp.modelo.Ejemplo;

/**
 * Todas las clases test que se creen deben heredar de BaseDaoTest
 * para que tengan visibilidad de los beans de Spring.
 * 
 * @author Alejandro Pimentel
 *
 */
public class EjemploDaoTest extends BaseDaoTest {
	
	@Autowired
	private EjemploDao ejemploDao;
	
	@Test
	public void ejemploTest(){
		// Aqui simplemente probamos que el bean haya sido inyectado correctamente.
		Assert.assertNotNull(ejemploDao);
	}
	
	@Test
	public void consultarTodos(){
		List<Ejemplo> ejs = ejemploDao.consultarTodos();
		
		Assert.assertFalse(ejs.isEmpty());
	}
}
