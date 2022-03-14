<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class UssdController extends CI_Controller {

    public function index(){
        $sessionId   = $this->input->post('sessionId');
        $serviceCode = $this->input->post('serviceCode');
        $phoneNumber = $this->input->post('phoneNumber');
        $text        = $this->input->post('text');

        if ($text == "") {
            // This is the first request. Note how we start the response with CON
            $response  = "Bienvenu, en quoi peut-on vous aider ? \n";
            $response .= "1. vaccin \n";
            $response .= "2. statistique";

        } else if ($text == "1") {
            // Business logic for first level response
            $response = "CON Choose account information you want to view \n";
            $response .= "1. faire une reservation \n";

        } else if ($text == "2") {
            // Business logic for first level response
            // This is a terminal request. Note how we start the response with END
            $response = "END Your phone number is ".$phoneNumber;

        } else if($text == "1*1") { 
            // This is a second level response where the user selected 1 in the first instance
            $accountNumber  = "ACC1001";

            // This is a terminal request. Note how we start the response with END
            $response = "END Your account number is ".$accountNumber;

        }

        // Echo the response back to the API
        header('Content-type: text/plain');
        echo $response;
    }

}