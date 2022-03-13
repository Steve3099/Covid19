<?php if( ! defined('BASEPATH')) exit ('No direct script acces allowed');

class News_model extends CI_Model
{
    public function get_info() 
    {
        // return array('auteur' => 'Chuck Norris',
        //         'date' => '24/07/05',
        //         'email' => 'email@ndd.fr');
           


            try {
                $query = $this->db->query('SELECT first_name,last_name,last_update FROM actor');

                foreach($query->result_array() as $row)
                {
                    echo $row['first_name'];
                    echo $row['last_name'];
                    echo $row['last_update'];
                }
            } catch (Exception $e) {
                echo 'Caught exception: ',  $e->getMessage(), "\n";
            }
        
        
   
    }
}
?>