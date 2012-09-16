package test.com.mx.mneg.tlp.dao;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.mx.mneg.tlp.dao.DatosClienteDao;
import com.mx.mneg.tlp.modelo.DatosCliente;

public class DatosClienteDaoTest extends BaseDaoTest{

	@Autowired
	private DatosClienteDao datosClienteDao;
	
	@Test
	public void consultarTodos(){
		List<DatosCliente> lista = 
				datosClienteDao.consultarTodos();
		
		Assert.assertEquals(1, lista.size());
	}
	
	@Test
	public void insertar(){
		DatosCliente datos = new DatosCliente(
				"Alex", "PIRA8204261HA", "Mi calle", "74", null, 
				"Copilco", "Coyoacan", "DF", "DF", 15300);
		
		datosClienteDao.insertar(datos);
		
		Assert.assertNotNull(datos.getId());
	}
	
	@Test
	public void consultarPorRfc(){
		List<DatosCliente> lista = 
				datosClienteDao.consultarPorRfc("PIRA820426");
		
		Assert.assertEquals(1, lista.size());		
	}
}
