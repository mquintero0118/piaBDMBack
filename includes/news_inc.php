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
    $statusId = $_POST["statusId"];
    $tags = $_POST["tag"];
    $section = $_POST["seccion"];
    

    $tags_arr = explode(",",$tags);

    $section_arr = explode(",",$section);
    
   // $image = $_POST["image"];

   NewsContr::withNewsData($title,$lead,$text,$country,$city,$state,$signature,$date,$userId,$statusId)->registerNews();


   if(!empty($_FILES["image"]["name"])) {

    $imgName = basename($_FILES["image"]["name"]);
    $imageType = strtolower(pathinfo($imgName,PATHINFO_EXTENSION));
    $allowedTypes = array('png','jpg','gif');
   // echo $imgName;
    if(in_array($imageType,$allowedTypes)){

        $imgName = $_FILES["image"]["tmp_name"];
        $image64 = base64_encode(file_get_contents($imgName));

        $realImage = 'data:image/'.$imageType.';base64,'.$image64;

        NewsContr::withImg($realImage,0)->registerImg();

            $res['imagenSrc'] = $realImage;

           // echo "extension valida";
    }else{
          //  echo "extension no valida";
    }

}else{
     $res["noFile"] = "rip";
    }


    if(!empty($_FILES["video"]["name"])) {

        $videoName = basename($_FILES["video"]["name"]);
        $videoType = strtolower(pathinfo($videoName,PATHINFO_EXTENSION));
        $allowedVideoTypes = array('mp4','wav');
       // echo $videoName;
        if(in_array($videoType,$allowedVideoTypes)){
    
            $videoName = $_FILES["video"]["tmp_name"];
            $video64 = base64_encode(file_get_contents($videoName));
    
         $realVideo = 'data:video/'.$videoType.';base64,'.$video64;

       // echo $video64;
          NewsContr::withImg($realVideo,1)->registerImg();
    
              $res['videoSrc'] = $realVideo;
    
           //   echo "extension valida";
         }else{
        //         echo "extension no valida";
         }
    
    }else{
         $res["noFile"] = "rip";
        }


    // if($check == false){
    //     $res['message1'] = "Entre a check false";
    //     $res['error'] = true;
    //     $res['message'] = "El correo ya esta registrado";
    // }

    foreach ($tags_arr as $value) {
        NewsContr::withTag($value)->registerTag();
      
    }

    foreach ($section_arr as $value) {
        NewsContr::withSection($value)->registerSection();
      
    }


    

}

if ($action == "selectRecentNews") {

    $news = new NewsContr();

 $res = $news->selectSections();


}



    

header('Content-type: application/json');
echo json_encode($res);
die();

?>