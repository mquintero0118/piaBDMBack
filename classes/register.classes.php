<?php

include('../classes/dbh.classes.php');



class Register extends Dbh{


protected function insertUser($name,$lastName,$email,$pwd){

    $stmt = $this->connect()->prepare('CALL sp_users("Insert", null, ?, ?, ?, ?, null, null, null, null, null, null, null);');

    if(!$stmt->execute(array($email,$pwd,$name,$lastName))){ //SI NO SE LOGRA EJECUTAR EL QUERY, ENTRA AQUI
       // echo "NO se registro el correo";
        exit();

    }
    $stmt = null;
    //echo "waaaaaaaaaa" ;

}


protected function checkUser($email){

$stmt = $this->connect()->prepare('CALL sp_users("CheckUsers", null, ?, null, null, null, null, null, null, null, null, null, null);');

    if(!$stmt->execute(array($email))){
        $stmt = null;
        exit();
    }
    
    $check;

    if($stmt->rowCount() > 0){
        $check = false;
    }else{
        $check = true;
    }

   // echo "ENTRE A CHECK USER";
    return $check;

}


}


?>