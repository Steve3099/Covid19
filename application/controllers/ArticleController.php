<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ArticleController extends CI_Controller {

    public function index(){
        $this->load->model('Article');
      //  var_dump($this->Article->getAllArticle());
        $data['article']=$this->Article->getAllArticle();
        $data['view'] = "article";
        $this->load->view("template",$data);
    }

    public function insert(){
        $this->load->model('Article');
        $titre = $this->input->get('titre');
        $text = $this->input->get('text');
        $image = $this->input->get('image');
        $date = $this->input->get('date');
    }
}
