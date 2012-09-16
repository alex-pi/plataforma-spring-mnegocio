define([], function(){
	function validaObligatorio(campo, ctx){
		var field = $("#"+campo, ctx).val();				
		$("#div_"+campo, ctx).fadeOut(500);				
		if( $.trim(field) == '' ){	
			$("#div_"+campo, ctx).hide().html(" El campo " + campo + " es obligatorio.").fadeIn(500);					
			return false;
		}
		
		return true;
	}
	
	return {
		obligatorio: validaObligatorio
	};
});