<?php

include('../classes/dbh.classes.php');



class Login extends Dbh{


protected function logUser($email,$pwd){

    $arr = [];

    $stmt = $this->connect()->prepare('CALL sp_users("Login", null, ?, ?, null, null, null, null, null, null, null, null, null);');

    if(!$stmt->execute(array($email,$pwd))){ //SI NO SE LOGRA EJECUTAR EL QUERY, ENTRA AQUI
       echo "NO se registro el correo";
        exit();

    }

    $check;

    if($stmt->rowCount() == 0){ //SI NO COINCIDE NINGUN CORREO Y CONTRASENIA
        $stmt =  null;
        $arr['check'] = false;
        
    }else{
        $arr['check'] = true;
        $userRow = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $arr["user_id"] = $userRow[0]["USERS_ID"];
        $arr["user_picture"] = $userRow[0]["PICTURE"];
        $arr["name"] = $userRow[0]["NAME"];
        $arr["last_name"] = $userRow[0]["LAST_NAME"];
        $arr["user_type"] = $userRow[0]["DESCRIPTION"];

        $stmt = null;
    }

   

   
    $stmt = null;
   // echo json_encode($arr);
    return $arr;
    

}



}


?>