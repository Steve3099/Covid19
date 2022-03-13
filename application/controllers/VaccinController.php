<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class VaccinController extends CI_Controller {
    public function index()
	{
		$data=array();
        $this->load->model('MaladieChronique');
		$data['maladie']=$this->MaladieChronique->getAllMaladie();
		echo json_encode($data['maladie']);
	}
}
