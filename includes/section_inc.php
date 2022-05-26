<?php

include('../classes/section_contr.classes.php');


if (isset($_SERVER['HTTP_ORIGIN'])) {
    // Decide if the origin in $_SERVER['HTTP_ORIGIN'] is one
    // you want to allow, and if so: test
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Credentials: true');
    header('Access-Control-Max-Age: 1000');
}
if($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    if(isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD'])) {
        // may also be using PUT, PATCH, HEAD etc
        header("Access-Control-Allow-Headers: POST, GET, OPTIONS, PUT, DELETE");
    }

    if(isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS'])) {
        header("Access-Control-Allow-Headers: Accept, Content-Type, Content-Lenght, Accept-Encoding, X-CSRF-Token, Authorization");
    }
    exit(0);
}

$res = array('error' => false);
$action = '';

if (isset($_GET['action'])) {

    $action=$_GET['action'];
}

if ($action == "create") {



    $description = $_POST["sectionName"];
    $color = $_POST["sectionColor"];
    $order = $_POST["sectionOrder"];
   

    $section =  new SectionContr($description, $color, $order);

    $section->registerSection();

    // if($check == false){
    //     $res['message1'] = "Entre a check false";
    //     $res['error'] = true;
    //     $res['message'] = "El correo ya esta registrado";
    // }

}

if ($action == "selectSections") {

    $section = new SectionContr();

 $res = $section->selectSections();


}

    

header('Content-type: application/json');
echo json_encode($res);
die();

?>