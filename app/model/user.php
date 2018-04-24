<?php
require_once "./app/model/model.php";

class UserModel extends Model {


    public function login ($usuario, $password) {
        $this->connect();
        $consulta = "SELECT * FROM usuario WHERE username = '".$usuario."' AND password = '".$password."'";
        $query = $this->query($consulta);
        $this->terminate();
        while($row = mysqli_fetch_array($query)){
            //agrega el id a la session
            $_SESSION["username_obs"] = $row["username"];
            //agrega la hora en la que inicio sesion
            $_SESSION["ultimoAcceso"] = time();
            return true;
        }
        return false;
       

    }

    public function obtenerInfoUsuario($usuario){
        $this->connect();
        $consulta = "SELECT * FROM usuario WHERE username='$usuario'";
        $query = $this->query($consulta);
        $this->terminate();
        while($row = mysqli_fetch_array($query)){
            return $row;
        }
        return null;
    }

    public function obtenerPaises(){
        $this->connect();
        $array= array();
        $consulta = "SELECT * from paises";
        $query = $this->query($consulta);
        $this->terminate();
        while($row = mysqli_fetch_array($query)){
            array_push($array, $row);
        }
        return $array;
    }

    public function obtenerHechos(){
        $this->connect();
        $array= array();
        $consulta = "SELECT * from hechos";
        $query = $this->query($consulta);
        $this->terminate();
        while($row = mysqli_fetch_array($query)){
            array_push($array, $row);
        }
        return $array;
    }

    public function cargarTipoAccion($id_hecho){
        $this->connect();
        $array= array();
        $consulta = "SELECT * from tipo_accion where id_hecho=$id_hecho";
        $query = $this->query($consulta);
        $this->terminate();
        while($row = mysqli_fetch_array($query)){
            $tipo_accion= array('id' =>$row['id'] ,'tipo_accion' =>utf8_encode($row['tipo_accion']));
            array_push($array, $tipo_accion);
        }
        return $array;
    }

}

?>