{include 'overall/header.tpl'}

    <body>

  	{include 'overall/nav.tpl'}
      
<div class="container" style="margin-top: 100px;">

	<center>
		<div id="_AJAX_"></div>

	    <div class="form-signin" style="width: 500px;">
	    	<h2 class="form-signin-heading">Inicie Sesión</h2>
	        <label for="inputEmail" class="sr-only">Usuario</label>
	        <input class="form-control" id="usuario" placeholder="Introduce tu usuario" required="" autofocus="" type="text">
	        <label for="inputPassword" class="sr-only">Contraseña</label>
	        <input class="form-control" id="pass" placeholder="Introduce tu contraseña" required="" type="password">
	        <div class="checkbox">
	          <label>
	            <input type="checkbox" id="session" value="1"> Recordar contraseña.
	          </label>
	        </div>
	        <button class="btn btn-primary btn-block" id="send_request" type="button">Iniciar Sesión</button>
	    </div>
    </center>

</div>

{include 'overall/footer.tpl'}
        <script>
            window.onload = function() {
                document.getElementById('send_request').onclick = function() {
                    var connect, usuario, pass, session, form, result;
                    usuario = document.getElementById('usuario').value;
                    pass = document.getElementById('pass').value;
                    session = document.getElementById('session').checked ? true : false;
                    
                    if(usuario != '' && pass != '') {
                        form = 'usuario=' + usuario + '&pass=' + pass + '&session=' + session;
                    
                        connect = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
                        connect.onreadystatechange = function() {
                            if(connect.readyState == 4 && connect.status == 200) {
                                if(parseInt(connect.responseText) == 1) {
                                    result = '<div class="alert alert-dismissible alert-success" style="width: 500px;">';
							        result += '<button type="button" class="close" data-dismiss="alert">×</button>';
  							        result += '<strong>Conectado.</strong> Bienvenido, solo un poco más.';
  							        result += '</div>';
  							        location.href = '?view=index';
  							        document.getElementById('_AJAX_').innerHTML = result;
                                } else {
                                    result = '<div class="alert alert-dismissible alert-danger" style="width: 500px;">';
							        result += '<button type="button" class="close" data-dismiss="alert">×</button>';
  							        result += 'Credenciales incorrectas.';
  							        result += '</div>';
  							        document.getElementById('_AJAX_').innerHTML = result;
                                }
                            } else if (connect.readyState !=4) {
                                result = '<div class="alert alert-dismissible alert-warning" style="width: 500px;">';
						        result += '<button type="button" class="close" data-dismiss="alert">×</button>';
  						        result += 'Procesando...';
  						        result += '</div>';
  						        document.getElementById('_AJAX_').innerHTML = result;
                            }
                        }
                        connect.open('POST','?view=login',true);
                        connect.setRequestHeader('Content-Type','application/x-www-form-urlencoded' )
                        connect.send(form);
                    } else {
                        result = '<div class="alert alert-dismissible alert-danger" style="width: 500px;">';
					    result += '<button type="button" class="close" data-dismiss="alert">×</button>';
  					    result += 'El usuario y la contraseña no deben estar vacios.';
  					    result += '</div>';
  					    document.getElementById('_AJAX_').innerHTML = result;
                    }       
                }
            }
        </script>
    </body>
</html>