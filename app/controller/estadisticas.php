<?php

include_once "./app/controller/controller.php";
include_once "./app/model/estadisticas.php";
include_once "./app/model/user.php";

class Estadisticas extends Controller {

    private $estadisticaModel;
    private $userModel;
    private $view;
    private $anio;
    private $num_estadisticas_pagina;


    public function __construct() {
        $this->estadisticaModel = new EstadisticaModel();
        $this->userModel=new UserModel();
        $this->view = $this->getTemplate("./app/views/index.html");
        $this->anio=2015;
        $this->num_estadisticas_pagina=8;
    }

    public function cargarEstadisticas(){
        $contenido = $this->getTemplate("./app/views/boletines/estadisticas.html");
        $contenido=$this->cargarMenu($contenido);
        $hechos = $this->obtenerHechos();
        $htmlAnios=$this->obtenerAnios();
        $contenido = $this->renderView($contenido, "{{HECHOS}}", $hechos);
        $contenido = $this->renderView($contenido, "{{ANIOS}}", $htmlAnios);
        $this->view = $this->renderView($this->view, "{{TITULO}}","Estadisticas");
        $this->view = $this->renderView($this->view, "{{CONTENIDO}}", $contenido);
        $this->showView($this->view);
    }

    public function cargarVerEstadisticas(){
        $contenido = $this->getTemplate("./app/views/boletines/ver-estadisticas.html");
        $contenido=$this->cargarMenu($contenido);
        $hechos = $this->obtenerHechos();
        $htmlAnios=$this->obtenerAnios();
        $contenido = $this->renderView($contenido, "{{HECHOS}}", $hechos);
        $contenido = $this->renderView($contenido, "{{ANIOS}}", $htmlAnios);
        $this->view = $this->renderView($this->view, "{{TITULO}}","Estadisticas");
        $this->view = $this->renderView($this->view, "{{CONTENIDO}}", $contenido);
        $this->showView($this->view);
    }

    public function subirEstadistica($hecho, $anio){
        //agregamos el archivo al servidor 
        $url_archivo=$this->agregarArchivo("estadistica");
        $result=$this->estadisticaModel->subirEstadistica($hecho, $anio,$url_archivo);
        echo $result;
    }

    public function obtenerCantPag($busqueda){
        $cantReg=$this->estadisticaModel->obtenerCantPag($busqueda);
        $totalPaginas=ceil($cantReg/$this->num_estadisticas_pagina);
        echo $totalPaginas;
    }

    public function cargarEstadisticasPagina($busqueda, $pagina){
        $inicio=($pagina-1)*$this->num_estadisticas_pagina;
        $array=$this->estadisticaModel->cargarEstadisticasPagina($busqueda,$inicio,$this->num_estadisticas_pagina);
        //echo sizeof($array);
        echo json_encode($array);
    }

    public function borrarEstadisticas($id_hecho,$anio){
         $url_archivo=$this->estadisticaModel->borrarEstadisticas($id_hecho,$anio);
         if($url_archivo!=null){
             $this-> eliminarArchivo($url_archivo);
             echo true;
         }
         echo false;
    }

    public function buscarEstadistica($id_hecho,$anio){
        $url_archivo=$this->estadisticaModel->buscarEstadistica($id_hecho,$anio);
        echo $url_archivo;
    }

    private function obtenerHechos(){
        $array=$this->userModel->obtenerHechos();
        $html="";
        foreach ($array as $hecho) {
            $html.="<option value='".utf8_encode ($hecho["id"])."'>".utf8_encode ($hecho["nombre"])."</option>";
        }
        return $html;
    }

    private function obtenerAnios(){
        $anioActual=date("Y");
        $html="";
        for ($i=$this->anio; $i <=$anioActual; $i++) { 
            $html.="<option value='$i'>$i</option>";
        }

        return $html;
    }

   
}

?>