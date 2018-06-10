<?php
require_once "./app/model/model.php";

class EstadisticaModel extends Model {

    public function subirEstadistica($hecho, $anio, $url_archivo){
        $user=$_SESSION['username_obs_estadisticas'];
        $sql="INSERT INTO `estadistica` (`id_hecho`, `anio`, `username`, `url_archivo`) VALUES ('$hecho', '$anio', '$user', '$url_archivo');";
        $insert=$this->insert($sql);
        if($insert==1){
            return true;
        }
        return false;
    }

    public function obtenerCantPag($busqueda){
        $consulta="SELECT count(*) total from estadistica where anio  like '%$busqueda%'";
        $total=$this->obtenerFilaBD($consulta);
        return $total['total'];
    }

    public function cargarEstadisticasPagina($busqueda,$inicio, $num_estadisticas_pagina){
        $consulta="SELECT id_hecho, anio, url_archivo, (select nombre from hechos  where id=id_hecho) nombre_hecho  from estadistica  where  anio  like '%$busqueda%' limit $inicio,$num_estadisticas_pagina"; 
        $array=$this->obtenerArrayConsultaUTF8($consulta); 
        return $array;
    }

    public function  borrarEstadisticas($id_hecho,$anio){
        $consulta="SELECT url_archivo from estadistica where id_hecho=$id_hecho and anio=$anio";
        $url_archivo=$this->obtenerFilaBD($consulta)['url_archivo'];
        $delete=$this->delete("delete from estadistica where id_hecho=$id_hecho and anio=$anio");
        if($delete==1){
            return $url_archivo;
        }
        return null;
    }

    public function buscarEstadistica($id_hecho,$anio){
        $url_archivo="";
        $consulta="SELECT url_archivo from estadistica where id_hecho=$id_hecho and anio=$anio";
        $array=$this->obtenerArrayConsulta($consulta);
        if($array!=null){
            $url_archivo=$array[0]['url_archivo'];
        }
        return $url_archivo;
    }

}

?>