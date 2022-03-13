<?php if (!defined('BASEPATH')) exit('No direct script acces allowed');

class Reservation extends CI_Model
{
    public function getHeureDisponible($date,$centre){
        // $query = "select max(time) from reservation where date=";
        // $this->db->query($query);

    }
    public  function insert($nom, $prenom, $email, $numero, $dateNaissance, $sexe, $cin, $adresse, $idCentre, $idVaccin, $date, $heure)
    {
        $query = "insert into reservation values (null,'" . $nom . "','" . $prenom . "','" . $dateNaissance . "','" . $cin . "','" . $sexe . "','" . $numero . "','" . $adresse . "','" . $email . "'," . $idCentre . "," . $idVaccin . ",'" . $date . "','" . $heure . "' )";
        $this->db->query($query);
    }
    public function getLastReservation(){
        $query = "select max(id) from reservation"
    }
}
