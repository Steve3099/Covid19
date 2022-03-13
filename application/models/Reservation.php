<?php if (!defined('BASEPATH')) exit('No direct script acces allowed');

class Reservation extends CI_Model
{
    public  function insert($nom, $prenom, $email, $numero, $dateNaissance, $sexe, $cin, $adresse, $idCentre, $idVaccin, $maladies)
    {
        $query = "insert into reservation values (null," . $nom . "," . $prenom . "," . $dateNaissance . "," . $cin . "," . $sexe . "," . $numero . "," . $adresse . "," . $email . "," . $idCentre . ",". $idVaccin . " )";
        $this->db->query($query);
    }
}
