<?php

class Acceso {
    
    private $email;
    private $usuario;
    private $pass;
    
    private function Encrypt($string) {
		$sizeof = strlen($string) - 1;
		$result = '';
		for($x = $sizeof; $x >= 0; $x--) {
			$result .= $string[$x]; 
		}
		$result md5($result);
		return $result;	
	}
    
    public function Login() {
		try {
			if(!empty($_POST['usuario']) and !empty($_POST['pass']) and !empty($_POST['session'])) {
				$db = new Conexion();
				$this->usuario = $db->real_escape_string($_POST['usuario']);
				$this->pass = $this->Encrypt($_POST['pass']);

				 $sql = $db->query("SELECT * FROM usuarios WHERE usuario='$this->usuario' AND pass='$this->pass';");

				 if($db->rows($sql) > 0) {
				 	$datos = $db->recorrer($sql);
				 	$_SESSION['id'] = $datos['id'];
				 	$_SESSION['usuario'] = $datos['usuario'];
				 	$_SESSION['email'] = $datos['email'];
				 	if($_POST['session'] == true) {
						ini_set('session.cookie_lifetime', time() + (60*60*24*2));
					}
					echo 1;
				 } else {
				 	throw new Exception(2);
				 }
				 $db->liberar($sql);
				 $db->close();

			} else {
				throw new Exception('Error: Datos vacios.');
				
			}

		} catch(Exception $login) {
			echo $login->getMessage();
		}
	}
    
    public function Recuperar() {
        
    } 
    
    public function Registrar() {
        
    }
}

?>