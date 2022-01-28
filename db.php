<?php
$conn = new mysqli("localhost", "root", "admin", "piadb");
if(!$conn){
    echo 'Failed connection to db';
}
?>
