<?php

include('../classes/section.classes.php');




class SectionContr extends Section{

private $description;
private $color;
private $order; 


    public function __construct($description = null, $color = null, $order = null){

        $this->description = $description;
        $this->color = $color;
        $this->order = $order;
       

        

    }

    public function registerSection(){

        $check;

        //  if($this->userCheck() == false){
        //      $check = false;
        //  }else{

        $this->insertSection($this->description,$this->color, $this->order);

        $check = true;
        //}

        return $check;


    }


    public function selectSections(){


       
        $sections;

       $sections =  $this->getSections();
     //  echo "funcion de login";
        
        

        return $sections;


    }




    // private function userCheck(){
    //     $check;

    //     if(!$this->checkUser($this->email)){
    //         $check = false;
    //     }else {
    //         $check = true;
    //     }

    //     return $check;
    // }


}
?>