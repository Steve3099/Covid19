<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class StatistiqueController extends CI_Controller {

    public function index(){
        $this->load->model('Statistique');
        $data['vaccine'] =$this->Statistique->getNombreVaccineTotal();
        $data['decede'] =$this->Statistique->getNombreDecede();
        $data['guerie'] =$this->Statistique->getNombreGuerie();
        $data['vacMort'] =$this->Statistique->getNombreVaccineMaty();
        $data['vacMarary'] =$this->Statistique->getNombreMararyVaccine();
        $data['vacParMois'] =$this->Statistique->getNombreVaccinParMois();
        $data['vacParResultat'] =$this->Statistique->getNombreResultatVaccination();
        $data['view'] ='stat';
        //var_dump($data['vacMarary']);
        $this->load->view('template',$data);
    }

}
