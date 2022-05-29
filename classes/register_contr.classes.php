<?php

include('../classes/register.classes.php');




class RegisterContr extends Register{

private $name;
private $lastName;
private $email; 
private $pwd;
private $userTypeId;

    public function __construct($name, $lastName, $email, $pwd, $userTypeId){

        $this->name = $name;
        $this->lastName = $lastName;
        $this->email = $email;
        $this->pwd = $pwd;
        $this->userTypeId = $userTypeId;

        

    }

    public function registerUser(){

        $check;

         if($this->userCheck() == false){
             $check = false;
         }else{

        $this->insertUser($this->name,$this->lastName, $this->email, $this->pwd,$this->userTypeId);

        $check = true;
        }

        return $check;


    }



    private function userCheck(){
        $check;

        if(!$this->checkUser($this->email)){
            $check = false;
        }else {
            $check = true;
        }

        return $check;
    }


}
?>