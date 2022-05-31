<?php

include('../classes/dbh.classes.php');



class Comments extends Dbh{


protected function insertCommentData($newsId,$comment,$userId){

    $stmt = $this->connect()->prepare('CALL sp_comments("Insert", null, ?, ?, null, ?, null);');

    if(!$stmt->execute(array($comment,$userId, $newsId))){ //SI NO SE LOGRA EJECUTAR EL QUERY, ENTRA AQUI
       // echo "NO se registro el correo";
        exit();

    }
    $stmt = null;
    //echo "waaaaaaaaaa" ;

}




}


?>