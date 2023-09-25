<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
$serverHost = "localhost";
$user = "root";
$password = "";
$database = "aplicaciondocentecentro";

$connectnow = new mysqli($serverHost,$user,$password,$database);