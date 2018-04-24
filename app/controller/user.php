<?php

include_once "./app/controller/controller.php";
include_once "./app/model/user.php";

class User extends Controller {

    private $userModel;
    private $view;


    public function __construct() {
        $this->userModel = new UserModel();
        $this->view = $this->getTemplate("./app/views/index.html");
    }

    public function cargarIndex() {
        $inicioHtml = $this->getTemplate("./app/views/inicio.html");
        $inicioHtml=$this->cargarMenu($inicioHtml);
        $this->view = $this->renderView($this->view, "{{TITULO}}","Inicio");
        $this->view = $this->renderView($this->view, "{{CONTENIDO}}", $inicioHtml);
        $this->showView($this->view);
    }


    public function inicioSesion() {
        $login = $this->getTemplate("./app/views/login.html");
        $login=$this->cargarMenu($login);
        $this->view = $this->renderView($this->view, "{{TITULO}}","Iniciar Sesión");
        $this->view = $this->renderView($this->view, "{{CONTENIDO}}", $login);
        $this->showView($this->view);
    }

    public function cargarQuienesSomos(){
        $contenido = $this->getTemplate("./app/views/quienes-somos.html");
        $contenido=$this->cargarMenu($contenido);
        $this->view = $this->renderView($this->view, "{{TITULO}}","¿Quienes somos?");
        $this->view = $this->renderView($this->view, "{{CONTENIDO}}", $contenido);
        $this->showView($this->view);
    }

    public function cargarFormularioRecoleccionInformacion(){
        $contenido = $this->getTemplate("./app/views/formulario.html");
        $contenido=$this->cargarMenu($contenido);
        $userInfo=$this->userModel->obtenerInfoUsuario($_SESSION['username_obs']);
        $fecha= date("Y-m-d");
        $contenido = $this->renderView($contenido, "{{fecha_declaracion}}",$fecha);
        $contenido = $this->renderView($contenido, "{{dane_declaracion}}",$userInfo['dane_declaracion']);
        $contenido = $this->renderView($contenido, "{{municipio_declaracion}}",utf8_encode($userInfo['municipio_declaracion']));
        //obtenemos los paises de la base de datos 
        $paises=$this->obtenerPaises();
        $contenido = $this->renderView($contenido, "{{PAISES}}",$paises);
        //obtenemos los hechos de la base de datos 
        $hechos=$this->obtenerHechos();
        $contenido = $this->renderView($contenido, "{{HECHOS}}",$hechos);
        $this->view = $this->renderView($this->view, "{{TITULO}}","Formulario");
        $this->view = $this->renderView($this->view, "{{CONTENIDO}}", $contenido);
        $this->showView($this->view);
    }

    public function login($user, $password) {
        $pass = sha1($password);
        $log = $this->userModel->login($user, $pass);
        echo $log;
    }

    public function obtenerPaises(){
        $array=$this->userModel->obtenerPaises();
        $html="";
        foreach ($array as $pais) {
            if($pais["nombre"]=="Colombia"){
                $html.="<option selected value='".utf8_encode ($pais["nombre"])."'>".utf8_encode ($pais["nombre"])."</option>";
            }else{
                $html.="<option value='".utf8_encode ($pais["nombre"])."'>".utf8_encode ($pais["nombre"])."</option>";
            }
        }
        return $html;
    } 

    private function obtenerHechos(){
        $array=$this->userModel->obtenerHechos();
        $html="";
        foreach ($array as $hecho) {
            $html.="<option value='".utf8_encode ($hecho["id"])."'>".utf8_encode ($hecho["nombre"])."</option>";
        }
        return $html;
    }

    public function cargarTipoAccion($id_hecho){
        $array=$this->userModel->cargarTipoAccion($id_hecho);
        echo json_encode($array);
    }
}

?>