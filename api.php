<?php
include "db.php";
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
    $name = $_POST['name'];
    $lastName = $_POST['lastName'];
    $email = $_POST['email'];
    $pass = $_POST['pass'];


    

    

 //echo $name .'Welcome '.'  your email adress is: '. $email . $pass;





//$sqlSelect = "SELECT * FROM test_table WHERE email = ?;";
    $sqlSelect = $conn->prepare('SELECT * FROM users WHERE email = ?;');

    $sqlSelect->bind_param("s", $email);
    $sqlSelect->execute();
    $result = $sqlSelect->get_result();

    $num = $result->num_rows;

    
    // $result=$conn->query($sqlSelect);
    // $num=mysqli_num_rows($result);

    if($num > 0) {
        $res['error'] = true;
        $res['message'] = "Account already exists";
    }else{
        // $sql = "INSERT INTO test_table (email, username, pass) VALUES ('".$email."', '".$name."', '".$pass."')";
        // $conn->query($sql);

        $sql = $conn->prepare('CALL sp_users("Insert", null, ?, ?, ?, ?, null, null, null, null, null, null, null);');
        $sql->bind_param("ssss", $email, $pass, $name, $lastName );
        $sql->execute();

        echo "se registro el correo";
   } 
    
}

$conn -> close();
header('Content-type: application/json');
echo json_encode($res);
die();
?>