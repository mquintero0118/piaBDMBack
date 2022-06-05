<?php

include('../classes/dbh.classes.php');



class Section extends Dbh{


protected function insertSection($description,$color,$order){

    $stmt = $this->connect()->prepare('CALL sp_categories("Insert",null,?,?, ?, null, null,null,null,null,null);');

    if(!$stmt->execute(array($description,$color,$order))){ //SI NO SE LOGRA EJECUTAR EL QUERY, ENTRA AQUI
       echo "NO se registro la seccion";
        exit();

    }
    $stmt = null;
    echo "waaaaaaaaaa" ;

}


protected function getSections(){

    $arr = [];

    $stmt = $this->connect()->prepare('CALL sp_categories("SelectCategories",null,null,null, null, null, null,null,null,null,null);');

    if(!$stmt->execute()){ //SI NO SE LOGRA EJECUTAR EL QUERY, ENTRA AQUI
     echo "NO se trajeron las secciones";
        exit();

    }

    for($arr; $row= $stmt->fetchAll(PDO::FETCH_ASSOC); $arr[] = $row);

    $stmt = null;

    return $arr;


}




}


?>