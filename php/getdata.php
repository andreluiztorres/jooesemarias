<?php 
include 'connection.php';

$queryResult = $conectadb  -> query("SELECT * FROM usuarios");

$result=array();

while($fetchData=$queryResult->fetch_assoc()){
$result[]=$fetchData;
}

echo json_encode($result);

?>
