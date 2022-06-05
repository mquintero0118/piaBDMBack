<?php

include('../classes/dbh.classes.php');



class News extends Dbh{


    ////// INSERT NEWS

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

    $stmt = $this->connect()->prepare('CALL sp_multimedia("Insert", null, ?,?,null);');

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

    $stmt = $this->connect()->prepare('CALL sp_categories("InsertIntoNewsCategories", null, ?, null, null, null, null, null, null, null,null);');

    if(!$stmt->execute(array($section))){ //SI NO SE LOGRA EJECUTAR EL QUERY, ENTRA AQUI
      
         echo "NO se registro la seccion";
      $stmt = null;
        exit();

    }
    $stmt = null;


}


 ////// UPDATE NEWS
protected function updateNewsData($newsId,$title,$lead,$text,$country,$city,$state,$signature,$dateOfEvents,$createdBy,$statusId){

    $stmt = $this->connect()->prepare('CALL sp_news("UpdateNews", ?, ?, ?, ?, ?, ?, ?, ?, null, ?, null, ?, null, ?, null, null);');

    if(!$stmt->execute(array($newsId,$city,$state,$country,$signature,$title,$lead,$text,$dateOfEvents,$statusId,$createdBy))){ //SI NO SE LOGRA EJECUTAR EL QUERY, ENTRA AQUI
      
        // echo "NO se registro la noticia";
      $stmt = null;
        exit();

    }
    $stmt = null;


}

protected function updateNewsSection($newsId,$section){

    $stmt = $this->connect()->prepare('CALL sp_categories("UpdateNewsCategories", null, ?, null, null, null, null, null, null, null,?);');

    if(!$stmt->execute(array($section,$newsId))){ //SI NO SE LOGRA EJECUTAR EL QUERY, ENTRA AQUI
      
         echo "NO se registro la seccion";
      $stmt = null;
        exit();

    }
    $stmt = null;


}

protected function updateImg($image,$isVideo,$newsId){

    $stmt = $this->connect()->prepare('CALL sp_multimedia("UpdateNewsMultimedia", null, ?,?,?);');

    if(!$stmt->execute(array($image,$isVideo,$newsId))){ //SI NO SE LOGRA EJECUTAR EL QUERY, ENTRA AQUI
      
        // echo "NO se registro la noticia";
      $stmt = null;
        exit();

    }
    $stmt = null;


}


protected function updateTag($tag,$newsId){

    $stmt = $this->connect()->prepare('CALL sp_tags("UpdateNewsTags", ?, ?);');

    if(!$stmt->execute(array($tag,$newsId))){ //SI NO SE LOGRA EJECUTAR EL QUERY, ENTRA AQUI
      
         echo "NO se registro el tag";
      $stmt = null;
        exit();

    }
    $stmt = null;


}

////////////


protected function selectByNewsId($newsId){

    $arr = [];
   

    $stmt = $this->connect()->prepare('CALL sp_news("SelectNewsById", ?, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);');

    if(!$stmt->execute(array($newsId))){ //SI NO SE LOGRA EJECUTAR EL QUERY, ENTRA AQUI
      
         echo "NO se encontro la noticia";
      $stmt = null;
        exit();

    }


    for($arr; $row= $stmt->fetchAll(PDO::FETCH_ASSOC); $arr[] = $row);


        
    $stmt = null;

    return $arr;

}

protected function getRecentNews(){

    $arr = [];

    $arrVids = [];

    $stmt = $this->connect()->prepare('CALL sp_news("SelectNewsRecent", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);');

    if(!$stmt->execute()){ //SI NO SE LOGRA EJECUTAR EL QUERY, ENTRA AQUI
     echo "NO se trajeron las noticias";
        exit();

    }

    for($arr; $row= $stmt->fetchAll(PDO::FETCH_ASSOC); $arr[] = $row);

    $stmt = $this->connect()->prepare('CALL sp_news("SelectNewsRecentVideos", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);');

    if(!$stmt->execute()){ //SI NO SE LOGRA EJECUTAR EL QUERY, ENTRA AQUI
        echo "NO se trajeron las noticias";
           exit();
   
       }

       for($arrVids; $row= $stmt->fetchAll(PDO::FETCH_ASSOC); $arrVids[] = $row);

       

       $index = 0;
       foreach ($arr[0] as $value) {
       
        $arr[0][$index]["VIDEO"] = $arrVids[0][$index]["MEDIA"];

        $index++;
      
    }

    $stmt = null;

    return $arr;


}


protected function getNewsTerminadas(){

    $arr = [];

    $arrVids = [];

    $stmt = $this->connect()->prepare('CALL sp_news("SelectNewsTerminadas", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);');

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