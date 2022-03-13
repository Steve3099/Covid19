<?php if( ! defined('BASEPATH')) exit ('No direct script acces allowed');

class Centre extends CI_Model
{
    public function getAllCentre()
    {
        $retour = array();
        $sql = "select * from Centre";
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