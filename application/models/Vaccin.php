<?php if( ! defined('BASEPATH')) exit ('No direct script acces allowed');

class Vaccin extends CI_Model
{
    public function getAllVaccin()
    {
        $retour = array();
        $sql = "select * from Vaccin";
        $query = $this->db->query($sql);
        $i = 0;
        foreach($query -> result_array() as $row)
        {
            $retour[$i] = $row;
            $i++;
        }
        return $retour;
    }
    
    public function checkMaladie($maladie, $vaccin)
    {
        $listeContreIndication = $this->ContreIndication->getContreIndicationByVaccin($vaccin);
        foreach($listeContreIndication as $ci)
        {
            if($ci['idVaccin']==$vaccin['id'])
            {
                if($ci['idMaladieChronique'] == $maladie)
                {
                    return true;
                }
            }
        }
        return false;
    }

    public function getListeMaladieContre($listeMaladie,$vaccin)
    {
        $same = 0;
        foreach($listeMaladie as $lm)
        {
            if($this->checkMaladie($lm, $vaccin))
            {
                $same++;
            }
        }
        return $same;
    }

    public function checkVaccin($listeMaladie)
    {
        $retour=array();
        $i = 0;
        $listeVaccin = $this->Vaccin->getAllVaccin();
        foreach($listeVaccin as $vaccin)
        {
            $nombre = $this->getListeMaladieContre($listeMaladie,$vaccin);
            $retour[$i]['vaccin'] = $vaccin['label'];
            $retour[$i]['nombre'] = $nombre;
            $i++;
        }
        return $retour;
    }

    public function searchVaccin($age,$listeMaladie)
    {
        $listeVaccin=array();
        $count = 0;
        $i=0;
        
        if(empty($age))
        {
            return "veuillez renseigner le champ age ";
        }
        else if($age < 0)
        {
            return "veuillez entrer une valeur positive";
        }
        else if($age > 110)
        {
            return "veuillez entrer une valeur inférieure à 110";
        }
        if($age < 18)
        {
            return "Se faire vacciner est déconseillé pour les personnes ayant moins de 18ans";
        }
        else
        {
            $listeVaccinParMaladie = $this->checkVaccin($listeMaladie);
            foreach($listeVaccinParMaladie as $vaccinParMaladie)
            {
                if($vaccinParMaladie['nombre']==0)
                {
                    $count++;
                    $listeVaccin[$i]['message']="";
                }
                else
                {
                    $listeVaccin[$i]['message'] = "Déconseillé";
                }
                $listeVaccin[$i]['vaccin'] = $vaccinParMaladie['vaccin'];
                $i++;
            }
        }
        return $listeVaccin;
    }

    public function getVaccinByCentre($idCentre)
    {
        $retour = array();
        $sql = "select * from centreVaccin where idCentre=".$idCentre;
        $query = $this->db->query($sql);
        $i = 0;
        foreach($query -> result_array() as $row)
        {
            $retour[$i] = $row;
            $i++;
        }
        return $retour;
    }
    public function getCentreWithVaccin(){
        $this->load->model('centre');
        $centres = $this->centre->getCentres();
        $centresVaccin = array();
        for($i=0;$i<count($centres);$i++){
            $vaccinsByCentre = $this->getVaccinByCentre($centres[$i]['id']);
            $centresVaccin[$i]['nomCentre']=$centres[$i]['label'];
            $centresVaccin[$i]['nomVaccin']=$vaccinsByCentre;
        }
        return $centresVaccin;
    }
}
?>