<?php

include('../classes/news.classes.php');




class NewsContr extends News{

private $newsId;
private $title;
private $lead;
private $text; 
private $country;
private $city;
private $state;
private $signature;
private $dateOfEvents;
private $publishedDate;
private $likes;
private $createdBy;
private $statusId;
private $image;
private $tag;
private $section;
private $isVideo;

public function __construct(){ }


public static function withNewsData($title,$lead,$text,$country,$city,$state,$signature,$dateOfEvents,$createdBy,$statusId){

    $instance =  new self();
    $instance->fillWithNewsData($title,$lead,$text,$country,$city,$state,$signature,$dateOfEvents,$createdBy,$statusId);

    return $instance;

}

protected function fillWithNewsData($title,$lead,$text,$country,$city,$state,$signature,$dateOfEvents,$createdBy,$statusId){

    $this->title = $title;
    $this->lead = $lead;
    $this->text = $text;
    $this->country = $country;
    $this->city = $city;
    $this->state = $state;
    $this->signature = $signature;
    $this->dateOfEvents = $dateOfEvents;
    $this->createdBy = $createdBy;
    $this->statusId = $statusId;

}

public function registerNews(){

    $this->insertNewsData($this->title, $this->lead, $this->text, $this->country, $this->city, $this->state, $this->signature, $this->dateOfEvents,  $this->createdBy, $this->statusId, );
}
  
////////////


public static function withNewsDataUpdate($newsId,$title,$lead,$text,$country,$city,$state,$signature,$dateOfEvents,$createdBy,$statusId){

    $instance =  new self();
    $instance->fillWithNewsDataUpdate($newsId,$title,$lead,$text,$country,$city,$state,$signature,$dateOfEvents,$createdBy,$statusId);

    return $instance;

}

protected function fillWithNewsDataUpdate($newsId,$title,$lead,$text,$country,$city,$state,$signature,$dateOfEvents,$createdBy,$statusId){

    $this->newsId = $newsId;
    $this->title = $title;
    $this->lead = $lead;
    $this->text = $text;
    $this->country = $country;
    $this->city = $city;
    $this->state = $state;
    $this->signature = $signature;
    $this->dateOfEvents = $dateOfEvents;
    $this->createdBy = $createdBy;
    $this->statusId = $statusId;

}

public function updateNews(){

    $this->updateNewsData($this->newsId,$this->title, $this->lead, $this->text, $this->country, $this->city, $this->state, $this->signature, $this->dateOfEvents,  $this->createdBy, $this->statusId, );
}



/////////////

public static function withImg($image,$isVideo){

    $instance =  new self();
    $instance->fillWithImg($image,$isVideo);

    return $instance;

}

protected function fillWithImg($image,$isVideo){

    $this->image = $image;
    $this->isVideo = $isVideo;
   

}

public function registerImg(){

    $this->insertImg($this->image,$this->isVideo);
}

/////////


public static function withImgNewsId($image,$isVideo,$newsId){

    $instance =  new self();
    $instance->fillWithImgNewsId($image,$isVideo,$newsId);

    return $instance;

}

protected function fillWithImgNewsId($image,$isVideo,$newsId){

    $this->image = $image;
    $this->isVideo = $isVideo;
    $this->newsId = $newsId;
   

}

public function updateImgData(){

    $this->updateImg($this->image,$this->isVideo,$this->newsId);
}



///////////

public static function withTag($tag){

    $instance =  new self();
    $instance->fillWithTag($tag);

    return $instance;

}

protected function fillWithTag($tag){

    $this->tag = $tag;
   

}

public function registerTag(){

    $this->insertTag($this->tag);
}
  

////////////////

public static function withTagNewsId($tag, $newsId){

    $instance =  new self();
    $instance->fillWithTagNewsId($tag, $newsId);

    return $instance;

}

protected function fillWithTagNewsId($tag){

    $this->tag = $tag;
    $this->newsId = $newsId;
   

}

public function updateTagData(){

    $this->updateTag($this->tag,$this->newsId);
}


///////////////
  
public static function withSection($section){

    $instance =  new self();
    $instance->fillWithSection($section);

    return $instance;

}

protected function fillWithSection($section){

    $this->section = $section;
   

}

public function registerSection(){

    $this->insertSection($this->section);
}

//////////

public function selectRecentNews(){

    $news;

    $news = $this->getRecentNews();


    return $news;
}

////////////////


public function selectNewsTerminadas(){

    $news;

    $news = $this->getNewsTerminadas();


    return $news;
}

//////////////////
public static function withNewsIdSection($newsId, $section){

    $instance =  new self();
    $instance->fillWithNewsIdSection($newsId,$section);

    return $instance;

}

protected function fillWithNewsIdSection($newsId, $section){

    $this->newsId = $newsId;
    $this->section = $section;
   

}




public function updateNewsCategories(){

    

    $this->updateNewsSection($this->newsId,$this->section);

   
}

/////////////

public static function withNewsId($newsId){

    $instance =  new self();
    $instance->fillWithNewsId($newsId);

    return $instance;

}

protected function fillWithNewsId($newsId){

    $this->newsId = $newsId;
   

}



public function searchByNewsId($newsId){

    $news;

    $news = $this->selectByNewsId($this->newsId);

    return $news;
}


}

?>