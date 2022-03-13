<?php
defined('BASEPATH') or exit('No direct script access allowed');

class ReservationController extends CI_Controller
{
    public function index()
    {
        $this->load->model('centre');
        $this->load->model('vaccin');
        $this->load->model('maladiechronique');
        $data["centres"] = $this->centre->getCentres();
        $data["vaccins"] = $this->vaccin->getVaccins();
        $data["maladies"] = $this->maladiechronique->getAllMaladie();

        $data["view"] = "reservation.php";

        $this->load->view('welcome_message', $data);
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
        $idVaccin = $this->input->post('idVaccinn');
        $date = $this->input->post('dateVaccin');

        $heure = $this->reservation->getHeureDisponible($date, $idCentre);


        $idMaladies = $this->input->post('idMaladies');
        if ($idMaladies[0] == 'aucun') {
            // $this->reservation->insertReservation($nom,$prenom,$email,$numero,$dateNaissance,$sexe,$cin,$adresse,$idCentre,$idVaccin,$date,$heure);
        } else {
            $this->reservation->insertReservation($nom, $prenom, $email, $numero, $dateNaissance, $sexe, $cin, $adresse, $idCentre, $idVaccin, $date, $heure);
            $idReservation = $this->reservation->getLastReservation();
            $this->maladiechronique->insert($idReservation, $idMaladies);
        }

        var_dump($idMaladies[0]);
        // $this->reservation->insertReservation($nom,$prenom,$email,$numero,$dateNaissance,$sexe,$cin,$adresse,$idCentre,$idVaccin,$date,$heure);

    }
}
