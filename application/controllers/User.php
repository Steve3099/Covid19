<?php


class User extends CI_Controller
{
    public function acceuil()
    {
        $this->load->model('news_model');

        $date = array();
        
        //on lance une requete
        $data['user_info'] = $this -> news_model->get_info();

        //$this->load->view('ma_vue',$data);
    }
}
?>