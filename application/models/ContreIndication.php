<?php if( ! defined('BASEPATH')) exit ('No direct script acces allowed');

class ContreIndication extends CI_Model
{
    public function getAllContreIndication()
    {
        $retour = array();
        $sql = "select * from ContreIndication";
        $query = $this->db->query($sql);
        $i = 0;
        foreach($query -> result_array() as $row)
        {
            $retour[$i] = $row;
            $i++;
        }
        return $retour;
    }
    public function getContreIndicationByVaccin($vaccin)
    {
        $retour = array();
        $sql = "select * from ContreIndication where idVaccin=".$vaccin['id'];
        $query = $this->db->query($sql);
        $i = 0;
        foreach($query -> result_array() as $row)
        {
            $retour[$i] = $row;
            $i++;
        }
        return $retour;
    }
}
?>