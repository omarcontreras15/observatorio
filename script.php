<?php
 $server="localhost";
 $user="root";
 $pass="";
 $bd="observatorio";
 $array= array();
 $connection = mysqli_connect($server,$user,$pass,$bd) or  die(("Error" . mysqli_error($this->connection)));
$consulta = "SELECT * FROM hechos";
$query =mysqli_query($connection,$consulta);
mysqli_close($connection);

while($row = mysqli_fetch_array($query)){
    array_push($array, $row);
}

foreach ($array as $element) {
    $id=$element['id'];
    $nombre=utf8_encode($element['nombre']);
    $connection = mysqli_connect($server,$user,$pass,$bd) or  die(("Error" . mysqli_error($this->connection)));
    $consulta = "UPDATE hechos SET nombre='$nombre' where id=$id";
    echo $consulta."<br>";
    $query =mysqli_query($connection,$consulta);
    mysqli_close($connection);
}
?>