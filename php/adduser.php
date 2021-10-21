<?php 

include 'connection.php';

$usr_id = 2;
$usr_nome = "Heloisa Cristina Graboski";
$usr_mail = "helo.20081@gmail.com";
$usr_fone = "(41)995291834";
$usr_endereco = "Rua Antonio T Ribas"; 
$usr_number = 191;
$usr_complemento = "Casa A";
$usr_cidade = "Pinhais";
$usr_uf = "PR";
$usr_psw = "4321";
$usr_tipo = "cc"; // "cp" = cliente prestador || "cc" = cliente contratante

$conectadb -> query("INSERT INTO usuarios VALUES ('$usr_id', '$usr_nome', '$usr_mail', '$usr_fone', '$usr_endereco', '$usr_number', '$usr_complemento', '$usr_cidade', '$usr_uf', '$usr_psw', '$usr_tipo')");



?>