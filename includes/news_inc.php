<?php

include('../classes/news_contr.classes.php');

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



    $title = $_POST["title"];
    $lead = $_POST["lead"];
    $text = $_POST["text"];
    $country = $_POST["country"];
    $state = $_POST["state"];
    $city = $_POST["city"];
    $signature = $_POST["signature"];
    $userId = $_POST["userId"];
    $date = $_POST["dateTime"];
    $statusId = 1;
   

   NewsContr::withNewsData($title,$lead,$text,$country,$city,$state,$signature,$date,$userId,$statusId)->registerNews();

    // if($check == false){
    //     $res['message1'] = "Entre a check false";
    //     $res['error'] = true;
    //     $res['message'] = "El correo ya esta registrado";
    // }

}


    

header('Content-type: application/json');
echo json_encode($res);
die();

?>