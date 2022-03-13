<?php if( ! defined('BASEPATH')) exit ('No direct script acces allowed');

class MaladieChronique extends CI_Model{
    
    public function getAllMaladie()
    {
        $retour = array();
        $sql = "select * from MaladieChronique";
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