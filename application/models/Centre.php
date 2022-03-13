<?php if( ! defined('BASEPATH')) exit ('No direct script acces allowed');

class Centre extends CI_Model
{
    public function getCentres(){
        $sql = "SELECT * FROM centre";
        $query = $this->db->query($sql);
        $val = array();
        $i = 0;
        foreach($query -> result_array() as $row)
        {
            foreach($row as $key => $value)
            {
                $val[$i][$key] = $value;  
            }
            $i++;
        }
        return $val;
    }
}
