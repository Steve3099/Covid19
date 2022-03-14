<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class CentreController extends CI_Controller {
    public function index(){
        $this->load->model('centre');
        $this->load->model('vaccin');
        $data["listeCentres"] = $this->vaccin->getCentreWithVaccin();

        $data["view"] = "listeCentre";
        
        $this->load->view('template', $data);
    }
}
