<?php

$server = "192.168.100.22";
$user = "admin";
$psw = "UP8_8hw-3]5x-Tk.";
$db = "jooesemarias";


$conectadb = new mysqli($server, $user, $psw, $db);

if($conectadb -> connect_errno){
    echo "Erro de conexão: " . $conectadb -> connect_error;
    exit();
}
?>