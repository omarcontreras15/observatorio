<?php

include_once "./app/controller/user.php";
include_once "./app/controller/estadisticas.php";


class Router
{

    private $user;
    private $estadisticas;

    public function __construct()
    {
        $this->user = new User();
        $this->estadisticas = new Estadisticas();

    }

    public function router()
    {

        if (isset($_GET["mode"])) {
            switch ($_GET["mode"]) {

                case "cerrar-sesion":
                    session_destroy();
                    header("Location:index.php");
                    break;

                case "iniciar-sesion":
                    if (isset($_SESSION["username_obs"])) {
                        $this->user->cargarFormularios();
                    } else {
                        $this->user->inicioSesion();
                    }
                    break;

                case "agregar-formulario-recoleccion-datos":
                    if (isset($_SESSION["username_obs"])) {
                        $this->user->cargarFormularioRecoleccionInformacion();
                    } else {
                        $this->user->inicioSesion();
                    }
                    break;

                case "formularios":
                    if (isset($_SESSION["username_obs"])) {
                        $this->user->cargarFormularios();
                    } else {
                        $this->user->inicioSesion();
                    }
                    break;

                case "ver-estadisticas":
                    if (isset($_SESSION["username_obs_estadisticas"])) {
                        $this->estadisticas->cargarVerEstadisticas();
                    } else {
                        $this->user->inicioSesion();
                    }
                    break;

                case "ver-formulario":
                    if (isset($_SESSION["username_obs"])) {
                        if (isset($_GET['id']) && $_GET['id'] != "") {
                            $this->user->cargarVerFormulario($_GET['id']);
                        } else {

                        }
                    } else {
                        $this->user->inicioSesion();
                    }
                    break;
                case "restablecer-clave":
                    if (isset($_SESSION["username_obs"])) {
                        $this->user->cargarVistaCambiarClave();
                    } else {
                        $this->user->inicioSesion();
                    }
                    break;
                case "quienes-somos":
                    if (isset($_SESSION["username_obs"])) {
                        $this->user->cargarFormularios();
                    } else {
                        $this->user->cargarQuienesSomos();
                    }

                    break;

                case "estadisticas":
                    if (isset($_SESSION["username_obs"])) {
                        $this->user->cargarFormularios();
                    } else {
                        $this->estadisticas->cargarEstadisticas();
                    }

                    break;

                case "descargar-formulario-excel":
                    if (isset($_SESSION["username_obs"])) {
                        if (isset($_GET['id']) && $_GET['id'] != "") {
                            $this->user->descargarFormulariosExcelID($_GET['id']);
                        } else {
                            $this->user->descargarFormulariosExcel();
                        }
                    } else {
                        //pagina de error
                    }
                    break;

                default:

                    if (isset($_SESSION["username_obs"])) {
                        $this->user->cargarFormularios();
                    } else {
                        header("Location:index.php");
                    }
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

                case "registrar-formulario":
                    $this->user->registrarFormulario($_POST);
                    break;

                case "obtener-cantidad-pag-tabla-formularios":
                    $this->user->obtenerCantPag($_POST['busqueda']);
                    break;

                case "cargar-formularios-pagina":
                    $this->user->cargarFormulariosPagina($_POST['busqueda'], $_POST['pagina']);
                    break;
                case "borrar-formulario":
                    $this->user->borrarFormulario($_POST['id'], $_POST['causa_borrado']);
                    break;
                case "cambiar-clave":
                    $this->user->cambiarClave($_POST['password-vieja'], $_POST['password-nueva']);
                    break;
                case "subir-estadistica":
                    $this->estadisticas->subirEstadistica($_POST['hecho'], $_POST['anio']);
                break;
                case "obtener-cantidad-pag-tabla-estadisticas":
                    $this->estadisticas->obtenerCantPag($_POST['busqueda']);
                    break;

                case "cargar-estadisticas-pagina":
                    $this->estadisticas->cargarEstadisticasPagina($_POST['busqueda'], $_POST['pagina']);
                    break;
                case "borrar-estadisticas":
                    $this->estadisticas->borrarEstadisticas($_POST['id_hecho'], $_POST['anio']);
                    break;

                case "buscar-estadistica":
                    $this->estadisticas->buscarEstadistica($_POST['id_hecho'],$_POST['anio']);
                    break;



                default:
                    header("Location:index.php");
                    break;
            }
        } else {
            if (isset($_SESSION["username_obs"])) {
                header("Location:index.php?mode=formularios");
            }else if (isset($_SESSION["username_obs_estadisticas"])) {
                header("Location:index.php?mode=ver-estadisticas");
            }  else {
                $this->user->cargarIndex();
            }
        }

    }


}

?>