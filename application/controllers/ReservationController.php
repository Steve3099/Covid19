<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ReservationController extends CI_Controller {
    public function index(){
        $this->load->model('centre');
        $this->load->model('vaccin');
        $data["centres"]=$this->centre->getCentres();
        $data["vaccins"]=$this->vaccin->getVaccins();

		$this->load->view('welcome_message',$data);
    }
    public function insertReservation(){
        $this->load->model('reservation');

        $nom = $this->input->post('nom');
        $prenom = $this->input->post('prenom');
        $email = $this->input->post('email');
        $numero = $this->input->post('numero');
        $dateNaissance = $this->input->post('dateNaissance');
        $sexe = $this->input->post('sexe');
        $cin = $this->input->post('cin');
        $adresse = $this->input->post('adresse');
        $idCentre = $this->input->post('idCentre');
        $idVaccin = $this->input->post('idVaccinn');

        $idMaladies = $this->input->post('idMaladies');
        $this->reservation->insertReservation($nom,$prenom,$email,$numero,$dateNaissance,$sexe,$cin,$adresse,$idCentre,$idVaccin,$idMaladies);
        
    }
}
