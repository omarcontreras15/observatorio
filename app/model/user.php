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
        $consulta = "SELECT * from paises";
        $array=$this->obtenerArrayConsulta($consulta);
        return $array;
    }

    public function obtenerHechos(){
        $consulta = "SELECT * from hechos";
        $array=$this->obtenerArrayConsulta($consulta);
        return $array;
    }

    public function cargarTipoAccion($id_hecho){
        $consulta = "SELECT * from tipo_accion where id_hecho=$id_hecho";
        $array=$this->obtenerArrayConsultaUTF8($consulta);
        return $array;
    }

}

?>