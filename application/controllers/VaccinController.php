<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class VaccinController extends CI_Controller {
    public function index()
	{
		$data['maladie']=$this->MaladieChronique->getAllMaladie();
		$data['view']="propVaccin";
		$this->load->view("template",$data);
	}

	public function getResultProp()
	{
		$listeIdMaladie = $this->input->post('maladie');
		$age = $this->input->post('age');
		$data['retour']="redirect";
		$data['result']=$this->Vaccin->searchVaccin($age,$listeIdMaladie);
		$data['maladie']=$this->MaladieChronique->getAllMaladie();
		$data['view']="propVaccin";
		$this->load->view("template",$data);
	}
}
