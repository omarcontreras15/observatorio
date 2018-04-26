<?php

class Model {
    
    private $connection;

    public function connect(){
        $server="localhost";
        $user="root";
        $pass="";
        $bd="observatorio";
        $this->connection = mysqli_connect($server,$user,$pass,$bd) or  die(("Error " . mysqli_error($this->connection)));
    }

    public function query($sql){
        return mysqli_query($this->connection,$sql);
    }

    public function multiQuery($sql){
        return mysqli_multi_query ($this->connection,$sql);
    }


    public function terminate(){
        mysqli_close($this->connection);
    }

    public function obtenerArrayConsulta($consulta){
        $array=array();
        $this->connect();
        $query = $this->query($consulta);
        $this->terminate();
        while($row = mysqli_fetch_array($query)){
            array_push($array, $row);
        }
        return $array;
    }

    public function obtenerArrayConsultaUTF8($consulta){
        $array=array();
        $this->connect();
        $query = $this->query($consulta);
        $this->terminate();
        while($row = mysqli_fetch_array($query)){
            $row=array_map('utf8_encode', $row);
            array_push($array, $row);
        }
        return $array;
    }

}

?>