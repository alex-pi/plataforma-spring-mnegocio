
package com.masnegocio.mcdonalds;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Logger;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceFeature;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.1.6 in JDK 6
 * Generated source version: 2.1
 * 
 */
@WebServiceClient(name = "McDonalds", targetNamespace = "http://www.masnegocio.com/McDonalds/", wsdlLocation = "file:/media/Store-A/Dropbox/Qtx/ws/actualizacion4/McDonalds.wsdl")
public class McDonalds_Service
    extends Service
{

    private final static URL MCDONALDS_WSDL_LOCATION;
    private final static Logger logger = Logger.getLogger(com.masnegocio.mcdonalds.McDonalds_Service.class.getName());

    static {
        URL url = null;
        try {
            URL baseUrl;
            baseUrl = com.masnegocio.mcdonalds.McDonalds_Service.class.getResource(".");
            url = new URL(baseUrl, "file:/media/Store-A/Dropbox/Qtx/ws/actualizacion4/McDonalds.wsdl");
        } catch (MalformedURLException e) {
            logger.warning("Failed to create URL for the wsdl Location: 'file:/media/Store-A/Dropbox/Qtx/ws/actualizacion4/McDonalds.wsdl', retrying as a local file");
            logger.warning(e.getMessage());
        }
        MCDONALDS_WSDL_LOCATION = url;
    }

    public McDonalds_Service(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public McDonalds_Service() {
        super(MCDONALDS_WSDL_LOCATION, new QName("http://www.masnegocio.com/McDonalds/", "McDonalds"));
    }

    /**
     * 
     * @return
     *     returns McDonalds
     */
    @WebEndpoint(name = "McDonalds")
    public McDonalds getMcDonalds() {
        return super.getPort(new QName("http://www.masnegocio.com/McDonalds/", "McDonalds"), McDonalds.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns McDonalds
     */
    @WebEndpoint(name = "McDonalds")
    public McDonalds getMcDonalds(WebServiceFeature... features) {
        return super.getPort(new QName("http://www.masnegocio.com/McDonalds/", "McDonalds"), McDonalds.class, features);
    }

}
