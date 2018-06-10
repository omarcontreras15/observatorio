<?php

class Controller {
    
    public function getTemplate($route){
        return file_get_contents($route);
    }

    public function showView($view){
        echo $view;
    }

    public function renderView($ubicacion, $cadenaReemplazar, $reemplazo){
        return str_replace($cadenaReemplazar, $reemplazo, $ubicacion);
    }

    public function cargarMenu($contenido){
        $menu=$this->getTemplate("./app/views/menu/menu.html");
        if (isset($_SESSION["username_obs"])){
            $submenu=$this->getTemplate("./app/views/menu/submenu-login.html");
            $submenu = $this->renderView($submenu, "{{USERNAME}}",$_SESSION["username_obs"]);
        }else if(isset($_SESSION["username_obs_estadisticas"])){
            $submenu=$this->getTemplate("./app/views/menu/submenu-login.html");
            $submenu = $this->renderView($submenu, "{{USERNAME}}",$_SESSION["username_obs_estadisticas"]);
        }else{
            $submenu=$this->getTemplate("./app/views/menu/submenu-logout.html");
            
        }
        $menu = $this->renderView($menu, "{{SUBMENU}}",$submenu );
        $contenido = $this->renderView($contenido, "{{MENU}}", $menu);
        return $contenido;
    }

    //metodo para mover un archivo traido del formulario a la carpeta upload
    public function agregarArchivo($nom_input_file){
        $urlArchivo = "";
        if (is_uploaded_file($_FILES[$nom_input_file]['tmp_name'])) {
            $nombreDirectorio = "public/upload/estadisticas/";
            $nombreFichero = $_FILES[$nom_input_file]['name'];
            //opcional
            $tipoArchivo = $_FILES[$nom_input_file]['type'];
            $extencionFichero = "." . substr(strrchr($tipoArchivo, "/"), 1);
            //
            //id unico de tiempo
            $idUnico = time();
            
            $urlArchivo = $nombreDirectorio .$idUnico. "-".$nombreFichero;
            move_uploaded_file($_FILES[$nom_input_file]['tmp_name'], $urlArchivo);
            
            return $urlArchivo;
        } else {
            return false;
        }
    }
    
    public function eliminarArchivo($url){
        //Eliminamos la imagen del evento ubicada en la carpeta upload
        try {
            if ($url != "" || !isset($url) || $url != null) {
                unlink($url);
            }
        } catch (Exception $e) {
            
        }
    }


}
?>