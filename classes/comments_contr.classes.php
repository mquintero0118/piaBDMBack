<?php

include('../classes/comments.classes.php');




class CommentsContr extends Comments{

private $newsId;
private $comment;
private $userId; 


public function __construct(){ }


public static function withCommentData($newsId,$comment,$userId){

    $instance =  new self();
    $instance->fillWithCommentData($newsId,$comment,$userId);

    return $instance;

}

protected function fillWithCommentData($newsId,$comment,$userId){

    $this->mewsId = $mewsId;
    $this->comment = $comment;
    $this->userId = $userId;
    

}

public function registerComment(){

    $this->insertCommentData($this->newsId, $this->comment, $this->userId);
}
  
///////////////////



}

?>