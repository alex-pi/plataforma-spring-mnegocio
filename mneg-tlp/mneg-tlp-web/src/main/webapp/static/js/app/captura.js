define([], function(){
	
	var contexto;
	
	function volver(){											
		location.href="javascript:history.back(1)";
	}
	
	function validaCampo(campo){
		var field = $("#"+campo).val();				
		$("#div_"+campo).fadeOut(500);				
		if( field == '' ){	
			$("#div_"+campo).hide().html(" El campo " + campo + " es obligatorio.").fadeIn(500);					
			return false;
		}
		
		return true;
	}
				
	function validar(){			
		var valida = true;
		$.each($(':text', contexto), function(){
			valida = valida && validaCampo(this.id);
		});
		if(valida){
			enviaFormulario();
		}
	}
	
	function enviaFormulario(){
		var datosCliente = $('#registroForm', contexto).serializeFormJSON();
		console.log(datosCliente);
		contexto.block({ message: "Un momento..." });
		$.ajax({
			  url: $.urlBase+"/facturacion/cliente",
			  type: 'post',
			  data: $.toJSON(datosCliente),
			  success: function (data){
					console.log(data);
					if(data){
						$("#msgEnvio").addClass("validado");
						$("#msgEnvio").hide().html("Envio exitoso.").fadeIn(2000);			
					}else{
						$("#msgEnvio").addClass("validacion");
						$("#msgEnvio").hide().html("Error, vuelva a intentarlo por favor.").fadeIn(2000);		
					}
			  },
			  complete: function(){
				  contexto.unblock();
			  },
			  dataType: 'json',
			  contentType: "application/json; charset=utf-8"
		});
	}
	
	function init(ctx){
		contexto = ctx;
		$(':text', ctx).blur(function(){
			validaCampo(this.id);
		});
		$('#btnSiguiente', ctx).click(validar);
	}
	
	return init;
});