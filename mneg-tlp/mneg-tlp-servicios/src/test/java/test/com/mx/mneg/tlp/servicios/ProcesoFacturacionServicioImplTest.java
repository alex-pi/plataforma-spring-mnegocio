package test.com.mx.mneg.tlp.servicios;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.mx.mneg.infra.utils.ErrorNegocio;
import com.mx.mneg.tlp.modelo.DatosCliente;
import com.mx.mneg.tlp.servicios.ProcesoFacturacionServicio;

public class ProcesoFacturacionServicioImplTest extends BaseServicioTest {

	@Autowired
	private ProcesoFacturacionServicio procesoFacturacionServicio;
	
	@Test(expected=ErrorNegocio.class)
	public void registrarDatosClienteYaExisteRfc(){
		DatosCliente datos = new DatosCliente();
		datos.setRfc("PIRA820426");
		
		procesoFacturacionServicio.registrarDatosCliente(datos);
	}
}
