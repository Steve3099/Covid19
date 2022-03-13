<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class VaccinController extends CI_Controller {
    public function index()
	{
		$data=array();
		$data['maladie']=$this->MaladieChronique->getAllMaladie();
		$data['nombre']=$this->Vaccin->searchVaccin(18,$data['maladie']);
		var_dump($data['nombre']);
	}
}
