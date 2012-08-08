<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Demo Más Negocio</title>
	<style>
	    
	</style>	
	<link rel="stylesheet" href="static/css/themes/smoothness/jquery-ui-1.8.22.css" media="screen"> 
    <script src="static/js/libs/jquery/jquery-1.7.2.js"></script>
    <script src="static/js/libs/jquery/ui/jquery-ui-1.8.22.min.js"></script>
	<script>
		$(document).ready(function() {
            $('#dlgLogin').dialog({
                modal       :   true,
                width       :   360,
                height      :   170,
                draggable   :   true,
                autoOpen    :   true,
                resizable   :   false,
                title       :   'Login...',
                closeOnEscape: false,
                open: function(event, ui) {$(".ui-dialog-titlebar-close", ui.dialog).hide();},
                close: function(event,ui){
                }                
            });
            $('#btnLogin').button();
		});
	</script>
</head>
<body>
<div id="dlgLogin" style="display: none;">
<form id="loginForm" action="j_spring_security_check" method="POST">
	<table>
		<tr>
			<td><label for="username">Usuario:</label></td>
			<td><input id="username" name="j_username"></td>
		</tr>
		<tr>
			<td><label for="password">Contraseña:</label></td> 
			<td><input id="password" name="j_password" type="password"><br></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: right;"><input id="btnLogin" type="submit" value="Login"></td>
		</tr>
	</table>
</form>
</div>
</body>
</html>