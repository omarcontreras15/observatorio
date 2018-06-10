<?php
require_once "./app/model/model.php";

class UserModel extends Model {


    public function login ($usuario, $password) {
        $this->connect();
        $consulta = "SELECT * FROM usuario WHERE username = '".$usuario."' AND password = '".$password."'";
        $query = $this->query($consulta);
        $this->terminate();
        while($row = mysqli_fetch_array($query)){
        
            if($row['tipo']=='admin' || $row['tipo']=='user'){
                //agrega el id a la session
                $_SESSION["username_obs"] = $row["username"];
                //agrega la hora en la que inicio sesion
                $_SESSION["ultimoAcceso"] = time();
            }else if($row['tipo']=='estadisticas'){
                //agrega el id a la session
                $_SESSION["username_obs_estadisticas"] = $row["username"];
                //agrega la hora en la que inicio sesion
                $_SESSION["ultimoAcceso"] = time();
            }
            return true;
        }
        return false;
       

    }

    public function obtenerInfoUsuario($usuario){
        $consulta = "SELECT * FROM usuario WHERE username='$usuario'";
        return $this->obtenerFilaBD($consulta);
    }

    public function obtenerPaises(){
        $consulta = "SELECT * from paises";
        $array=$this->obtenerArrayConsulta($consulta);
        return $array;
    }
    public function obtenerMunicipios(){
        $consulta = "SELECT * from municipios";
        $array=$this->obtenerArrayConsulta($consulta);
        return $array;
    }

    public function obtenerHechos(){
        $consulta = "SELECT * from hechos";
        $array=$this->obtenerArrayConsulta($consulta);
        return $array;
    }

    public function obtenerNomHecho($id_hecho){
        $consulta = "select nombre from hechos where id=$id_hecho";
        $array=$this->obtenerArrayConsultaUTF8($consulta);
        return $array[0]['nombre'];
    }

    public function cargarTipoAccion($id_hecho){
        $consulta = "SELECT * from tipo_accion where id_hecho=$id_hecho";
        $array=$this->obtenerArrayConsultaUTF8($consulta);
        return $array;
    }

    public function registrarFormulario($form){
        $usuario=$this->obtenerInfoUsuario($_SESSION['username_obs']);
        $hecho=$this->obtenerNomHecho($form['hecho']);
        $municipio_declaracion=utf8_encode($usuario['municipio_declaracion']);
        
        $sql="INSERT INTO `formulario_recepcion_informacion` (`id`, `usuario`, `fecha_declaracion`, `zona_declaracion`, `codigo_dane`, `municipio_declaracion`, `entidad_denuncia`, `hecho`, `tipo_accion`, `fecha_ocurrencia`, `municipio_ocurrencia`, `zona_ocurrencia`, `lugar_ocurrencia`, `ubicacion_ocurrencia`, `arma_medio`, `nombre_ubicacion_ocurrencia`,`causa`, `tipo_documento_victima`, `fecha_nacimiento_victima`, `edad_victima`, `ciclo_vida_victima`, `pais_nacimiento_victima`, `ciudad_nacimiento_victima`, `pais_residencia_victima`, `ciudad_residencia_victima`,`direccion_residencia_victima`, `genero_victima`, `pertenencia_etnica_victima`, `resguardo_victima`, `etnia_victima`, `discapacidad_victima`, `descripcion_discapacidad_victima`, `presunto_autor`, `genero_autor`, `relacion_victima`, `pertenencia_etnica_autor`, `resguardo_autor`, `etnia_autor`) VALUES (NULL, '".$usuario['username']."', CURRENT_TIMESTAMP, '".$form['zona_declaracion']."','".$usuario['codigo_dane']."' , '".$municipio_declaracion."', '".$form['entidad_denuncia']."','".$hecho."', '".$form['tipo_accion']."', '".$form['fecha_ocurrencia']."', '".$form['municipio_ocurrencia']."', '".$form['zona_ocurrencia']."', '".$form['lugar_ocurrencia']."', '".$form['ubicacion_ocurrencia']."', '".$form['arma_medio']."', '".$form['nombre_ubicacion_ocurrencia']."','".$form['causa']."', '".$form['tipo_documento_victima']."', '".$form['fecha_nacimiento_victima']."', '".$form['edad_victima']."', '".$form['ciclo_vida_victima']."', '".$form['pais_nacimiento_victima']."', '".$form['ciudad_nacimiento_victima']."', '".$form['pais_residencia_victima']."', '".$form['ciudad_residencia_victima']."', '".$form['direccion_residencia_victima']."', '".$form['genero_victima']."', '".$form['pertenencia_etnica_victima']."', '".$form['resguardo_victima']."', '".$form['etnia_victima']."', '".$form['discapacidad_victima']."', '".$form['descripcion_discapacidad_victima']."', '".$form['presunto_autor']."', '".$form['genero_autor']."', '".$form['relacion_victima']."', '".$form['pertenencia_etnica_autor']."', '".$form['resguardo_autor']."', '".$form['etnia_autor']."');";
        $insert=$this->insert($sql);
        if($insert==1){
        $consulta="SELECT id FROM formulario_recepcion_informacion order by id desc limit 1";
        $consulta=$this->obtenerFilaBD($consulta);
        return $consulta['id'];
        }
        return $insert;
    }

    public function obtenerCantPag($busqueda){
        $user=$_SESSION['username_obs'];
        $tipo_user=$this->obtenerInfoUsuario($user)['cargo'];
        $consulta="SELECT count(*) total from formulario_recepcion_informacion where ((''+id) like '%$busqueda%' or fecha_declaracion  like '%$busqueda%' or hecho  like '%$busqueda%' or usuario  like '%$busqueda%') and (usuario='$user' or 'admin'='$tipo_user')";
        $total=$this->obtenerFilaBD($consulta);
        return $total['total'];
    }

    public function cargarFormulariosPagina($busqueda,$inicio, $num_formularios_pagina){
        $user=$_SESSION['username_obs'];
        $tipo_user=$this->obtenerInfoUsuario($user)['cargo'];
        $consulta="SELECT id, fecha_declaracion, zona_declaracion, hecho, usuario  from formulario_recepcion_informacion where ((''+id) like '%$busqueda%' or fecha_declaracion  like '%$busqueda%' or hecho  like '%$busqueda%'or usuario  like '%$busqueda%') and (usuario='$user' or 'admin'='$tipo_user') limit $inicio,$num_formularios_pagina"; 
        $array=$this->obtenerArrayConsulta($consulta); 
        return $array;
    }

    public function  borrarFormulario($id, $causa_borrado){
        $user=$_SESSION['username_obs'];
        $tipo_user=$this->obtenerInfoUsuario($user)['cargo'];
        $this->registrarFormularioAuditoria($this->obtenerInfoFormulario($id)[0],$causa_borrado);
        $delete=$this->delete("delete from formulario_recepcion_informacion where id=$id and (usuario='$user' or 'admin'='$tipo_user')");
        return $delete;
    }

    public function registrarFormularioAuditoria($form, $motivo){
        $sql="INSERT INTO `auditoria_formulario_recepcion_informacion` (`id`, `usuario`,`causa_borrado`,`fecha_declaracion`, `zona_declaracion`, `codigo_dane`, `municipio_declaracion`, `entidad_denuncia`, `hecho`, `tipo_accion`, `fecha_ocurrencia`, `municipio_ocurrencia`, `zona_ocurrencia`, `lugar_ocurrencia`, `ubicacion_ocurrencia`, `arma_medio`, `nombre_ubicacion_ocurrencia`,`causa`, `tipo_documento_victima`, `fecha_nacimiento_victima`, `edad_victima`, `ciclo_vida_victima`, `pais_nacimiento_victima`, `ciudad_nacimiento_victima`, `pais_residencia_victima`, `ciudad_residencia_victima`,`direccion_residencia_victima`, `genero_victima`, `pertenencia_etnica_victima`, `resguardo_victima`, `etnia_victima`, `discapacidad_victima`, `descripcion_discapacidad_victima`, `presunto_autor`, `genero_autor`, `relacion_victima`, `pertenencia_etnica_autor`, `resguardo_autor`, `etnia_autor`) VALUES (NULL, '".$form['usuario']."','".$motivo."','".$form['fecha_declaracion']."', '".$form['zona_declaracion']."','".$form['codigo_dane']."' , '".$form['municipio_declaracion']."', '".$form['entidad_denuncia']."','".$form['hecho']."', '".$form['tipo_accion']."', '".$form['fecha_ocurrencia']."', '".$form['municipio_ocurrencia']."', '".$form['zona_ocurrencia']."', '".$form['lugar_ocurrencia']."', '".$form['ubicacion_ocurrencia']."', '".$form['arma_medio']."', '".$form['nombre_ubicacion_ocurrencia']."','".$form['causa']."', '".$form['tipo_documento_victima']."', '".$form['fecha_nacimiento_victima']."', '".$form['edad_victima']."', '".$form['ciclo_vida_victima']."', '".$form['pais_nacimiento_victima']."', '".$form['ciudad_nacimiento_victima']."', '".$form['pais_residencia_victima']."', '".$form['ciudad_residencia_victima']."', '".$form['direccion_residencia_victima']."', '".$form['genero_victima']."', '".$form['pertenencia_etnica_victima']."', '".$form['resguardo_victima']."', '".$form['etnia_victima']."', '".$form['discapacidad_victima']."', '".$form['descripcion_discapacidad_victima']."', '".$form['presunto_autor']."', '".$form['genero_autor']."', '".$form['relacion_victima']."', '".$form['pertenencia_etnica_autor']."', '".$form['resguardo_autor']."', '".$form['etnia_autor']."');";
        $insert=$this->insert($sql);
    }

    public function obtenerInfoFormulario($id){
        $user=$_SESSION['username_obs'];
        $tipo_user=$this->obtenerInfoUsuario($user)['cargo'];
        $consulta="SELECT * FROM formulario_recepcion_informacion where id=$id and (usuario='$user'or 'admin'='$tipo_user')";
        $array=$this->obtenerArrayConsulta($consulta); 
        return $array;

    }

    public function cargarFormularios(){
        $user=$_SESSION['username_obs'];
        $tipo_user=$this->obtenerInfoUsuario($user)['cargo'];
        $consulta="SELECT * from formulario_recepcion_informacion where (usuario='$user' or 'admin'='$tipo_user')"; 
        $array=$this->obtenerArrayConsulta($consulta); 
        return $array;
    }

    public function cambiarClave($usuario, $passwordNueva){
        $update="UPDATE usuario  set password='$passwordNueva' where username='$usuario'";
        $update = $this->update($update);
        return $update;
    }

}

?>