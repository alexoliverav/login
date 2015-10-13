<?php

unset($_SESSION['id'],$_SESSION['usuario'],$_SESSION['email']);
session_destroy();
header('location: ?view=index');

?>