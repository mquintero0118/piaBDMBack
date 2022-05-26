<?php

include('../classes/dbh.classes.php');



class News extends Dbh{

protected function insertNewsData($title,$lead,$text,$country,$city,$state,$signature,$dateOfEvents,$createdBy,$statusId){

    $stmt = $this->connect()->prepare('CALL sp_news("Insert", null, ?, ?, ?, ?, ?, ?, ?, null, ?, null, ?, null, ?, null, null);');

    if(!$stmt->execute(array($city,$state,$country,$signature,$title,$lead,$text,$dateOfEvents,$statusId,$createdBy))){ //SI NO SE LOGRA EJECUTAR EL QUERY, ENTRA AQUI
      
        // echo "NO se registro la noticia";
      $stmt = null;
        exit();

    }
    $stmt = null;


}


protected function insertImg($image){

    $stmt = $this->connect()->prepare('CALL sp_multimedia("Insert", null, ?);');

    if(!$stmt->execute(array($image))){ //SI NO SE LOGRA EJECUTAR EL QUERY, ENTRA AQUI
      
        // echo "NO se registro la noticia";
      $stmt = null;
        exit();

    }
    $stmt = null;


}



}


?>