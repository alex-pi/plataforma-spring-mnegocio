<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Demo Más Negocio</title>
	<style>
	    
	</style>	
	<link rel="stylesheet" href="static/css/themes/smoothness/jquery-ui-1.8.22.css" media="screen">
	<link rel="stylesheet" href="static/css/ejemplo.css" media="screen">  
    <script src="<c:url value="static/js/libs/jquery/jquery-1.7.2.js"/>" ></script>
    <script src="<c:url value="static/js/libs/jquery/ui/jquery-ui-1.8.22.min.js"/>" ></script>
    <script src="<c:url value="static/js/libs/require/require.js"/>" ></script>
	<script>
		require.config({
// 			baseUrl: '<c:url value="/"/>',
			// En producción hay que asegurarse de remover el cache bust. Una buena forma de usar
			// esta opción en ambiente productivo es colocando el MD5 del artefacto que arma maven.
			// O bien el número de versión que se libera.
			urlArgs: "bust=" +  (new Date()).getTime(),
			packages: [{
				name: 'dhtml',
				location: '<c:url value="/mvc"/>'
			},{
				name: 'app',
				location: '<c:url value="/static/"/>js/app'
			},{
				name: 'req',
				location: '<c:url value="/static/"/>js/libs/require'
			}]
		});
		requirejs(['app/init', 'req/text!/mvc/ejemplos/template', 'req/domReady!'], function(initApp, template){
			initApp({
				urlBase: '<c:url value="/mvc"/>'
			});
			$('#btnError1').button().click(function(){
				$.get($.urlBase + "/ejemplos/error/simple/1", function() {});
			});
			var $template = $(template).css('display', 'none');
			$('#btnError2').after($template);
			$('#btnError2').button().click(function(){
				$.ajax({
					  url: $.urlBase + "/ejemplos/error/simple/2",
					  type: 'get',
					  error: function (jqXHR, textStatus, errorThrown){
							var infoError = $.parseJSON(jqXHR.responseText);							
							$('p#mensaje').html('Mensaje: ' + infoError.mensaje );
							$('p#extraInfo').html('Info extra: ' + infoError.extraInfo.nombre + ' ' +  infoError.extraInfo.apellido);
							$template.show();
							setTimeout(function(){
								$template.fadeOut(1000);
							}, 5000);
						},
					  dataType: 'json'
					});
			});
			$('#btnLogout').button().click(function(){
				window.location.href='j_spring_security_logout';
			});
			
			$.ajax({
				  url: $.urlBase + "/seguridad/menu/modulos",
				  type: 'get',
				  success: function (data){
					  var $ul = $('<ul></ul>');
					  $.each(data, function(idx, m){
						  var $il = $('<li></li>').html(m.modulo);
						  $ul.append($il);
					  });
					  $('#divDemoSeguridad').append($ul);
					},
				  dataType: 'json'
				});			
		});
	</script>
</head>
<body>
<div id="divDemoErrores" class="box" style="float: left;">
	<h5>Manejo de errores.</h5>
	<pre>
Este ejemplo muestra las posibilidades que se tienen en cuanto a manejo de errores en la aplicación:

1) El primer botón hace una petición ajax a 'ejemplos/error/simple/1'. 
	La app simplemente lanzará una excepción:

	throw new ErrorNegocio("Aqui se explica lo que salió mal con la lógica de negocio.");
	
  	Ya que nuestra petición no declara un 'handler' para cuando hay error, la app 
  	muestra un diálogo con la información del error.

2) El segundo botón por el contrario provocará que el servidor lance la excepción del siguiente modo:

		Ejemplo e = new Ejemplo();
		e.setId(1l);
		e.setNombre("Martin");
		e.setApellido("Fowler");
		throw new ErrorNegocio(new Object[]{}, "codigo.mensaje.ejemplo", e);
	
	El objeto llamado 'e' contiene información adicional y específica para el error que ha sucedido. 
	De este modo desearíamos procesar el error nosotros mismos, de ahi que para esta petición sí 
	declaremos un 'handler' para error.
</pre>
	<button id="btnError1">Error simple</button>
	<button id="btnError2">Error con info extra</button>
	
</div>
<div id="divDemoSeguridad" class="box" style="float: left;">
	<h5>Demo seguridad.</h5>
	<pre>
Aqui se muestra una lista de los módulos a los que tiene acceso el usuario: ${usuario.username}

El módulo de seguridad obtiene esta información por medio de las tablas de ACL's de spring:

acl_sid
acl_entry
acl_object_identity
acl-class

Con la configuración adecuada se podría armar un menú de módulos->opciones-> sub opciones ...
	</pre>
<button id="btnLogout">Logout</button>
</div>
</body>
</html>
