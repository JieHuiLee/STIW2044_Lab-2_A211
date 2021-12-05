<?php
if(!isset($_POST)){
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
    die();
}

include_once("connectordb.php");

$name = $_POST['name'];
$password = $_POST['password'];

$sqlinsert = "INSERT INTO tbl_loginuser(user_name, user_password) VALUES ('$name', '$password')";

if ($conn-> query ($sqlinsert) === TRUE) {
    $response = array('status' => 'success', 'data' => null);
    sendEmail($email);
    sendJsonResponse($response);
}else{
    $response = array('status'=> 'failed', 'data' => null);
    sendJsonResponse($response);
}

function sendJsonResponse($sentArray){
    header('Content-Type: application/json');echo json_encode($sentArray);

}

function sendEmail($email){
    //send email function here
}
?>