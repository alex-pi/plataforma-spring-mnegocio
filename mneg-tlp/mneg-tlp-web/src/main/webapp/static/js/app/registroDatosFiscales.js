define(['app/validacion'], function(validador){
	var contexto;
	
	function volver(){											
		location.href="javascript:history.back(1)";
	}
				
	function validar(){			
		var valida = true;
		$.each($(':text', contexto), function(){
			valida = valida 
			&& validador.obligatorio(this.id, contexto);
		});
		if(valida){
			enviaFormulario();
		}
	}
	
	function enviaFormulario(){	
		var dataForm = $('#registroForm', contexto).serializeFormJSON();
		console.log(dataForm);
		contexto.block({ message: null }); 
		$.ajax({
			  url: $.urlBase + '/facturacion/registro/generales',
			  type: 'post',
			  data: $.toJSON(dataForm),
			  success: function (registroCorrecto){
					console.log(registroCorrecto);
					if(registroCorrecto){
						$("#msgEnvio").addClass("validado");
						$("#msgEnvio").hide().html("Envio exitoso.").fadeIn(2000, function(){
							
						});						
					}
			  },
			  error: function(xhr){
				var obj = jQuery.parseJSON(xhr.responseText);
				$("#msgEnvio").addClass("validacion");
				$("#msgEnvio").hide().html(obj.mensaje).fadeIn(2000);					
				  
			  },
			  complete: function(){
				  contexto.unblock();
			  },
			  dataType: 'json',
			  contentType: "application/json; charset=utf-8"
		});
	}
	
	function inicializar(ctx){
		contexto = ctx;
		$(':text', ctx).blur(function(event){
			//event.target.id
			validador.obligatorio(this.id, ctx);
		});
		$('#btnSiguiente', ctx).click(validar);
	}
	
	return {
		init: inicializar
	};

});