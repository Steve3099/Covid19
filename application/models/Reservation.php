<?php if (!defined('BASEPATH')) exit('No direct script acces allowed');

class Reservation extends CI_Model
{
    public function getHeureMax($date, $centre)
    {
        $sql = "select max(heure) as maxheure from reservation where idCentre=" . $centre . " and date='" . $date . "'";
        $query = $this->db->query($sql);
        $row = $query->result_array();
        $heureMax = $row[0]['maxheure'];
        return $heureMax;
    }

    function add_heures($heure1, $heure2)
    {
        $secondes1 = $this->heure_to_secondes($heure1);
        $secondes2 = $this->heure_to_secondes($heure2);
        $somme = $secondes1 + $secondes2;
        $s = $somme % 60; //reste de la division en minutes => secondes
        $m1 = ($somme - $s) / 60; //minutes totales
        $m = $m1 % 60; //reste de la division en heures => minutes
        $h = ($m1 - $m) / 60; //heures
        $resultat = $h . ":" . $m . ":" . $s;
        return $resultat;
    }
    function heure_to_secondes($heure)
    {
        $array_heure = explode(":", $heure);
        $secondes = 3600 * $array_heure[0] + 60 * $array_heure[1] + $array_heure[2];
        return $secondes;
    }

    public function getHeureDisponible($date, $centre)
    {
        date_default_timezone_set('Africa/Johannesburg');
        $result = array();
        $max = $this->getHeureMax($date, $centre);
        if ($date >= date("Y-m-d")) {
            if (is_null($max)) {
                $result['heure'] = "08:00:00";
                $result['date'] = $date;
            } else if (strtotime($max) <= strtotime("19:45:00")) {
                $tempsVaccin = "00:15:00";
                $result['heure'] = $this->add_heures($max, $tempsVaccin);
                $result['date'] = $date;
            } else {
                $date = new DateTime($date);
                $date->add(new DateInterval('P1D'));
                $result['heure'] = "08:00:00";
                $result['date'] = $date->format('Y-m-d');
            }
            return $result;
        } else {
            return "Date non valide";
        }
    }

    public  function ajoutReservation($nom, $prenom, $email, $numero, $dateNaissance, $sexe, $cin, $adresse, $idCentre, $idVaccin, $date, $heure)
    {
        $result = "";
        $tabeau = $this->reservation->getHeureDisponible($date, $idCentre);
        if (!is_string($tabeau)) {
            $heure = $tabeau['heure'];
            $date = $tabeau['date'];
            $query = "insert into reservation values (null,'" . $nom . "','" . $prenom . "','" . $dateNaissance . "','" . $cin . "','" . $sexe . "','" . $numero . "','" . $adresse . "','" . $email . "','" . $idCentre . "','" . $idVaccin . "','" . $date . "','" . $heure . "' )";
            $this->db->query($query);
            $result = "Votre réservation a bien été enregistré pour le " . $date . " à " . $heure;
        } else {
            $result = $tabeau;
        }
        return $result;
    }

    public function getLastReservation($idCentre)
    {
        $sql = "select max(id) from reservation where idCentre=" . $idCentre . " ";
        $query = $this->db->query($sql);
        $retour = $query->result_array();
    }
}
