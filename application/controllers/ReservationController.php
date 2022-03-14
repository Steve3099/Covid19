<?php
defined('BASEPATH') or exit('No direct script access allowed');

class ReservationController extends CI_Controller
{
    public function index()
    {
        $data["centres"] = $this->Centre->getCentres();
        $data["vaccins"] = $this->Vaccin->getAllVaccin();
        $data["maladies"] = $this->MaladieChronique->getAllMaladie();
        $data["view"] = "reservation";
        $this->load->view('template', $data);
    }
    public function insertReservation()
    {
        
        $this->load->model('reservation');
        $this->load->model('maladiechronique');

        $nom = $this->input->post('nom');
        $prenom = $this->input->post('prenom');
        $email = $this->input->post('email');
        $numero = $this->input->post('numero');
        $dateNaissance = $this->input->post('dateNaissance');
        $sexe = $this->input->post('sexe');
        $cin = $this->input->post('cin');
        $adresse = $this->input->post('adresse');
        $idCentre = $this->input->post('idCentre');
        $idVaccin = $this->input->post('idVaccin');
        $date = $this->input->post('dateVaccin');
        $idMaladies = $this->input->post('idMaladies');



        $result = $this->reservation->ajoutReservation($nom, $prenom, $email, $numero, $dateNaissance, $sexe, $cin, $adresse, $idCentre, $idVaccin, $date, "");
       
        $data["centres"] = $this->Centre->getCentres();
        $data["vaccins"] = $this->Vaccin->getAllVaccin();
        $data["maladies"] = $this->MaladieChronique->getAllMaladie();
        $data["message"] = $result;
        $data["view"] = "reservation";
        $this->load->view('template', $data);
    }

    public function test()
    {
        $max = $this->reservation->getHeureDisponible("2021-08-24", 1);
    }
}
