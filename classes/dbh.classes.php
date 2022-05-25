<?php

class Dbh{

protected function connect(){


    try{
    $server = "localhost";
    $username = "root";
    $password = "admin";
    $database="pia_bdm";

    $conn = new PDO("mysql:host=$server;dbname=$database;" ,$username, $password);
    return $conn;
        
    }catch(PDOException $error){

        die("Connection failed" . $error->getMessage());

    }
}

}

?>