<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class StatistiqueController extends CI_Controller {

    public function index(){
        $this->load->model('Statistique');
        var_dump($this->Statistique->getnombreVaccineMaty());
    }

}
