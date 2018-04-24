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
            $menu = $this->renderView($menu, "{{SUBMENU}}",$submenu );
        }else{
            $submenu=$this->getTemplate("./app/views/menu/submenu-logout.html");
            $menu = $this->renderView($menu, "{{SUBMENU}}",$submenu );
        }
        $contenido = $this->renderView($contenido, "{{MENU}}", $menu);
        return $contenido;
    }


}
?>