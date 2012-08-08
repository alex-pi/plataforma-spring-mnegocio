<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/" var="ctx"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Demo Más Negocio - Zona pública</title>
	<style>
	    
	</style>	
	<link rel="stylesheet" href="${ctx}static/css/themes/smoothness/jquery-ui-1.8.22.css" media="screen">
	<link rel="stylesheet" href="${ctx}static/css/ejemplo.css" media="screen">  
    <script src="${ctx}static/js/libs/jquery/jquery-1.7.2.js"></script>
    <script src="${ctx}static/js/libs/jquery/jquery.json-2.3.js"/></script>
    <script src="${ctx}static/js/libs/jquery/ui/jquery-ui-1.8.22.min.js"></script>
    <script src="${ctx}static/js/libs/require/require.js"></script>
	<script>
		// Configuración inicial de requireJS.
		require.config({
			// En producción hay que asegurarse de remover el cache bust. Una buena forma de usar
			// esta opción en ambiente productivo es colocando el MD5 del artefacto que arma maven.
			// O bien el número de versión que se libera.
			urlArgs: "bust=" +  (new Date()).getTime(),
			packages: [{
				name: 'dhtml',
				location: '${ctx}mvc'
			},{
				name: 'app',
				location: '${ctx}static/js/app'
			},{
				name: 'req',
				location: '${ctx}static/js/libs/require'
			}]
		});
		// Aqui le pedimos a requireJS algunas dependencias que debemos tener para la ejecución de nuestro script:
			// app/init: Es un módulo JS que hará  algunas tareas de inicialización.
			// 'req/domReady! : Es otro plugin que evita la ejecución de nuestro script hasta que el DOM haya sido cargado totalmente.
		requirejs(['app/init', 'req/domReady!'], function(initApp){
			// Se ejecuta el módulo de incialización de la app.
			initApp({
				urlBase: '<c:url value="/mvc"/>'
			});
			$('#btnWService').button().click(function(){});
		});
	</script>
</head>
<body>
<div id="divDemoWService" class="box" style="float: left;">
	<h5>Web Service.</h5>
	<pre>
Este ejemplo muestra el uso de web services con spring. 

	</pre>
	<button id="btnWService">Web Service</button>
	
</div>

</body>
</html>

