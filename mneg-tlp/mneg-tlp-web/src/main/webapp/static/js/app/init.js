define(function(){
	
	function init(config){
		
		$('body').ajaxError(function(e, jqxhr, settings, exception) {
			if ( settings.error ) {
				return;
			}
			$.showErrorDialog(jqxhr, jqxhr.statusText, exception);
		});
	    
	    jQuery.showErrorDialog = function(xhr, textStatus, thrownError){
	        var obj = null;
	        try{
	            obj = jQuery.parseJSON(xhr.responseText);
	        }catch(error){
	            return;
	        }
	
	        $('<div>' +
	            '<span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>' +
	            'Mensaje: ' + obj.mensaje +
	            ' <br/> Hora: ' + obj.momentoErrorFrmt +
	            ' <br/> Clave del error: ' + obj.claveError +
	            ' <br/> Tipo de error: ' + obj.nivelError +
	            '</div>').dialog({
	            width: 420,
	            modal:true,
	            buttons: {
	                "Cerrar": function(){
	                    $(this).dialog("close");
	                    $(this).dialog("destroy");
	                }
	            },
	            close: function(event, ui) {
	            },
	            title: 'Error'
	        });//dialog
	    };
	    
	    jQuery.urlBase = config.urlBase;
	};
    
    return init;
});