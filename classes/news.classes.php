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


protected function insertImg($image,$isVideo){

    $stmt = $this->connect()->prepare('CALL sp_multimedia("Insert", null, ?,?);');

    if(!$stmt->execute(array($image,$isVideo))){ //SI NO SE LOGRA EJECUTAR EL QUERY, ENTRA AQUI
      
        // echo "NO se registro la noticia";
      $stmt = null;
        exit();

    }
    $stmt = null;


}


protected function insertTag($tag){

    $stmt = $this->connect()->prepare('CALL sp_tags("Insert", ?, null);');

    if(!$stmt->execute(array($tag))){ //SI NO SE LOGRA EJECUTAR EL QUERY, ENTRA AQUI
      
         echo "NO se registro el tag";
      $stmt = null;
        exit();

    }
    $stmt = null;


}

protected function insertSection($section){

    $stmt = $this->connect()->prepare('CALL sp_categories("InsertIntoNewsCategories", null, ?, null, null, null, null, null, null, null);');

    if(!$stmt->execute(array($section))){ //SI NO SE LOGRA EJECUTAR EL QUERY, ENTRA AQUI
      
         echo "NO se registro la seccion";
      $stmt = null;
        exit();

    }
    $stmt = null;


}

protected function getRecentNews(){

    $arr = [];

    $stmt = $this->connect()->prepare('CALL sp_news("SelectNewsRecent", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);');

    if(!$stmt->execute()){ //SI NO SE LOGRA EJECUTAR EL QUERY, ENTRA AQUI
     echo "NO se trajeron las noticias";
        exit();

    }

    for($arr; $row= $stmt->fetchAll(PDO::FETCH_ASSOC); $arr[] = $row);

    $stmt = null;

    return $arr;


}


}


?>