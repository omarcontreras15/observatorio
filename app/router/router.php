<?php

include_once "./app/controller/user.php";


class Router{

    private $user;

    public function __construct(){
        $this->user = new User();

    }

    public function router(){

        if (isset($_GET["mode"])) {
                switch ($_GET["mode"]) {

                    case "cerrar-sesion":
                        session_destroy();
                        header("Location:index.php");
                        break;

                    case "iniciar-sesion":
                        $this->user->inicioSesion();
                        break;

                    case "formulario-recoleccion-datos":
                        if (isset($_SESSION["username_obs"])){
                        $this->user->cargarFormularioRecoleccionInformacion();
                        }else{
                            $this->user->inicioSesion();
                        }
                        
                        break;
                    case "quienes-somos":
                        $this->user->cargarQuienesSomos();
                            break;

                    default:
                        header("Location:index.php");
                        break;
                }
            } else if (isset($_POST["mode"])) {
            switch ($_POST["mode"]) {
                case "login":
                    $this->user->login($_POST["username"], $_POST["password"]);
                    break;
                
                case "cargar-tipo-accion":
                    $this->user->cargarTipoAccion($_POST["id_hecho"]);
                    break;

            default:
                    header("Location:index.php");
                    break;
            }
        } else {
        	$this->user->cargarIndex();    
        }

    }


}

?>