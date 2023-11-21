<?php
include '../connection.php';

//Post

$userEmail = $_POST['user_email'];
$userPassword = md5($_POST['user_password']);

$sqlQuery = "SELECT * FROM users_table WHERE user_email = '$userEmail' AND user_password = '$userPassword'";

$resultOfQuery = $connectNow -> query($sqlQuery);

if($resultOfQuery->num_rows>0){
    $userRecord = array();
    while($rowFound = $resultOfQuery->fetch_assoc()){
        $userRecord[] = $rowFound;
    }
    echo json_encode(
        array(
            "success"=>true,
            "userData"=>$userRecord[0],
        )
    ); //ingreso exitoso
}else{
    echo json_encode(array("success"=>false)); //ingreso denegado
}