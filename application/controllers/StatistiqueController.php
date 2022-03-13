<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class StatistiqueController extends CI_Controller {

    public function index(){
        $this->load->model('Statistique');
        $data['vaccine'] =$this->Statistique->getNombreVaccineTotal();
        $data['decede'] =$this->Statistique->getNombreDecede();
        $data['guerie'] =$this->Statistique->getNombreGuerie();
        $data['vacMort'] =$this->Statistique->getNombreVaccineMaty();
        $data['view'] ='stat.php';
        $this->load->view('welcome_message',$data);
    }

}
