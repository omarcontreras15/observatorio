<?php

include_once "./app/controller/controller.php";
include_once "./app/model/user.php";
require_once './public/lib/PHPExcel/PHPExcel.php';

class User extends Controller {

    private $userModel;
    private $view;


    public function __construct() {
        $this->userModel = new UserModel();
        $this->view = $this->getTemplate("./app/views/index.html");
        $this->num_formularios_pagina=8;
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
        $contenido = $this->getTemplate("./app/views/formulario/agregar-formulario.html");
        $userInfo=$this->userModel->obtenerInfoUsuario($_SESSION['username_obs']);
        if($userInfo['tipo']!='admin') {
            $contenido = $this->cargarMenu($contenido);
            $fecha = date("Y-m-d");
            $contenido = $this->renderView($contenido, "{{fecha_declaracion}}", $fecha);
            $contenido = $this->renderView($contenido, "{{codigo_dane}}", $userInfo['codigo_dane']);
            $contenido = $this->renderView($contenido, "{{municipio_declaracion}}", utf8_encode($userInfo['municipio_declaracion']));
            //obtenemos los paises de la base de datos
            $paises = $this->obtenerPaises();
            $municipios=$this->obtenerMunicipios();
            $contenido = $this->renderView($contenido, "{{PAISES}}", $paises);
            $contenido = $this->renderView($contenido, "{{MUNICIPIOS}}", $municipios);
            //obtenemos los hechos de la base de datos
            $hechos = $this->obtenerHechos();
            $contenido = $this->renderView($contenido, "{{HECHOS}}", $hechos);
            $this->view = $this->renderView($this->view, "{{TITULO}}", "Formulario");
            $this->view = $this->renderView($this->view, "{{CONTENIDO}}", $contenido);
            $this->showView($this->view);
        }else{
            //pagina de error
        }
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
    
    private function obtenerMunicipios(){
        $array=$this->userModel->obtenerMunicipios();
        $html="";
        foreach ($array as $municipio) {
            
                $html.="<option value='".utf8_encode ($municipio["nombre"])."'>".utf8_encode ($municipio["nombre"])."</option>";
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

    public function registrarFormulario($form){
        $veri=$this->userModel->registrarFormulario($form);  
       echo $veri;
    }

    public function cargarFormularios(){
        $contenido = $this->getTemplate("./app/views/formulario/formularios.html");
        $tipo_user=$this->userModel->obtenerInfoUsuario($_SESSION['username_obs'])['tipo'];
        $contenido=$this->cargarMenu($contenido);
        $this->view = $this->renderView($this->view, "{{TITULO}}","Consultar Formularios");
        $this->view = $this->renderView($this->view, "{{CONTENIDO}}", $contenido);
        $this->view = $this->renderView($this->view, "{{TIPO_USER}}", $tipo_user);
        $this->showView($this->view);
    }

    public function obtenerCantPag($busqueda){
        $cantReg=$this->userModel->obtenerCantPag($busqueda);
        $totalPaginas=ceil($cantReg/$this->num_formularios_pagina);
        echo $totalPaginas;
    }

    public function cargarFormulariosPagina($busqueda, $pagina){
        $inicio=($pagina-1)*$this->num_formularios_pagina;
        $array=$this->userModel->cargarFormulariosPagina($busqueda,$inicio,$this->num_formularios_pagina);
        echo json_encode($array);
    }

    public function borrarFormulario($id, $causa_borrado){
        echo $this->userModel->borrarFormulario($id, $causa_borrado);
    }

    public function cargarVerFormulario($id){
        $contenido = $this->getTemplate("./app/views/formulario/ver-formulario.html");
        $array=$this->userModel->obtenerInfoFormulario($id);
        if(!empty($array)){
        $contenido=$this->cargarMenu($contenido);
        $this->view = $this->renderView($this->view, "{{TITULO}}","Ver Formulario");
        
        foreach ($array[0] as $key => $value) {
            $contenido = $this->renderView($contenido, "{{".$key."}}", $value);
        }
        $this->view = $this->renderView($this->view, "{{CONTENIDO}}", $contenido);
        $this->showView($this->view);
        }else{
          //redireccionar a error 404
        }
        
    }

    public function descargarFormulariosExcel(){
        $array=$this->userModel->cargarFormularios();
        $this->crearExcel($array);
    }

    public function descargarFormulariosExcelID($id){
        $array=$this->userModel->obtenerInfoFormulario($id);
        $this->crearExcel($array);
    }

    private function crearExcel($array){
        // Create new PHPExcel object
        $objPHPExcel = new PHPExcel();

        // Set document properties
        $objPHPExcel->getProperties()->setCreator("Observatorio de Norte de Santander")
                                    ->setLastModifiedBy("Observatorio de Norte de Santander")
                                    ->setTitle("Formularios");


        // agregar columas al excel 
        $objPHPExcel->setActiveSheetIndex(0)
                    ->setCellValue('A1', 'id')
                    ->setCellValue('B1', 'usuario')
                    ->setCellValue('C1', 'fecha_declaracion')
                    ->setCellValue('D1', 'zona_declaracion')
                    ->setCellValue('E1', 'codigo_dane')
                    ->setCellValue('F1', 'municipio_declaracion')
                    ->setCellValue('G1', 'entidad_denuncia')
                    ->setCellValue('H1', 'hecho')
                    ->setCellValue('I1', 'tipo_accion')
                    ->setCellValue('J1', 'fecha_ocurrencia')
                    ->setCellValue('K1', 'municipio_ocurrencia')
                    ->setCellValue('L1', 'zona_ocurrencia')
                    ->setCellValue('M1', 'lugar_ocurrencia')
                    ->setCellValue('N1', 'ubicacion_ocurrencia')
                    ->setCellValue('O1', 'arma_medio')
                    ->setCellValue('P1', 'causa')
                    ->setCellValue('Q1', 'nombre_ubicacion_ocurrencia')
                    ->setCellValue('R1', 'tipo_documento_victima')
                    ->setCellValue('S1', 'fecha_nacimiento_victima')
                    ->setCellValue('T1', 'edad_victima')
                    ->setCellValue('U1', 'ciclo_vida_victima')
                    ->setCellValue('V1', 'pais_nacimiento_victima')
                    ->setCellValue('W1', 'ciudad_nacimiento_victima')
                    ->setCellValue('X1', 'pais_residencia_victima')
                    ->setCellValue('Y1', 'ciudad_residencia_victima')
                    ->setCellValue('Z1', 'direccion_residencia_victima')
                    ->setCellValue('AA1', 'genero_victima')
                    ->setCellValue('AB1', 'pertenencia_etnica_victima')
                    ->setCellValue('AC1', 'resguardo_victima')
                    ->setCellValue('AD1', 'etnia_victima')
                    ->setCellValue('AE1', 'discapacidad_victima')
                    ->setCellValue('AF1', 'descripcion_discapacidad_victima')
                    ->setCellValue('AG1', 'presunto_autor')
                    ->setCellValue('AH1', 'genero_autor')
                    ->setCellValue('AI1', 'relacion_victima')
                    ->setCellValue('AJ1', 'pertenencia_etnica_autor')
                    ->setCellValue('AK1', 'resguardo_autor')
                    ->setCellValue('AL1', 'etnia_autor');

                $cont=2;
                foreach ($array as $element) {
                    $objPHPExcel->setActiveSheetIndex(0)
                    ->setCellValue('A'.$cont, $element['id'])
                    ->setCellValue('B'.$cont, $element['usuario'])
                    ->setCellValue('C'.$cont, $element['fecha_declaracion'])
                    ->setCellValue('D'.$cont, $element['zona_declaracion'])
                    ->setCellValue('E'.$cont, $element['codigo_dane'])
                    ->setCellValue('F'.$cont, $element['municipio_declaracion'])
                    ->setCellValue('G'.$cont, $element['entidad_denuncia'])
                    ->setCellValue('H'.$cont, $element['hecho'])
                    ->setCellValue('I'.$cont, $element['tipo_accion'])
                    ->setCellValue('J'.$cont, $element['fecha_ocurrencia'])
                    ->setCellValue('K'.$cont, $element['municipio_ocurrencia'])
                    ->setCellValue('L'.$cont, $element['zona_ocurrencia'])
                    ->setCellValue('M'.$cont, $element['lugar_ocurrencia'])
                    ->setCellValue('N'.$cont, $element['ubicacion_ocurrencia'])
                    ->setCellValue('O'.$cont, $element['arma_medio'])
                    ->setCellValue('P'.$cont, $element['causa'])
                    ->setCellValue('Q'.$cont, $element['nombre_ubicacion_ocurrencia'])
                    ->setCellValue('R'.$cont, $element['tipo_documento_victima'])
                    ->setCellValue('S'.$cont, $element['fecha_nacimiento_victima'])
                    ->setCellValue('T'.$cont, $element['edad_victima'])
                    ->setCellValue('U'.$cont, $element['ciclo_vida_victima'])
                    ->setCellValue('V'.$cont, $element['pais_nacimiento_victima'])
                    ->setCellValue('W'.$cont, $element['ciudad_nacimiento_victima'])
                    ->setCellValue('X'.$cont, $element['pais_residencia_victima'])
                    ->setCellValue('Y'.$cont, $element['ciudad_residencia_victima'])
                    ->setCellValue('Z'.$cont, $element['direccion_residencia_victima'])
                    ->setCellValue('AA'.$cont, $element['genero_victima'])
                    ->setCellValue('AB'.$cont, $element['pertenencia_etnica_victima'])
                    ->setCellValue('AC'.$cont, $element['resguardo_victima'])
                    ->setCellValue('AD'.$cont, $element['etnia_victima'])
                    ->setCellValue('AE'.$cont, $element['discapacidad_victima'])
                    ->setCellValue('AF'.$cont, $element['descripcion_discapacidad_victima'])
                    ->setCellValue('AG'.$cont, $element['presunto_autor'])
                    ->setCellValue('AH'.$cont, $element['genero_autor'])
                    ->setCellValue('AI'.$cont, $element['relacion_victima'])
                    ->setCellValue('AJ'.$cont, $element['pertenencia_etnica_autor'])
                    ->setCellValue('AK'.$cont, $element['resguardo_autor'])
                    ->setCellValue('AL'.$cont, $element['etnia_autor']);
                    $cont++;
                }
                // Rename worksheet
                $objPHPExcel->getActiveSheet()->setTitle('Formulario Observatorio');


                // Set active sheet index to the first sheet, so Excel opens this as the first sheet
                $objPHPExcel->setActiveSheetIndex(0);


                // Redirect output to a client’s web browser (Excel2007)
                header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
                header('Content-Disposition: attachment;filename="formulario.xlsx"');
                header('Cache-Control: max-age=0');
                // If you're serving to IE 9, then the following may be needed
                header('Cache-Control: max-age=1');

                // If you're serving to IE over SSL, then the following may be needed
                header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
                header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
                header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
                header ('Pragma: public'); // HTTP/1.0

                $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
                $objWriter->save('php://output');
                exit;
    }
}

?>