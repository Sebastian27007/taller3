<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");

if (isset($_GET['id_asesor'])) {
    $idAsesor = $_GET['id_asesor'];

    $serverHost = "localhost";
    $user = "root";
    $password = "";
    $database = "aplicaciondocentecentro";

    $connectnow = new mysqli($serverHost, $user, $password, $database);

    if ($connectnow->connect_error) {
        die("Connection failed: " . $connectnow->connect_error);
    }

    $sql = "SELECT Nombre FROM asesores WHERE ID_asesor = '$idAsesor'";
    $result = $connectnow->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $nombreAsesor = $row["Nombre"];
        echo "Nombre del asesor: " . $nombreAsesor;
    } else {
        echo "No se encontró un asesor con el ID proporcionado.";
    }

    $connectnow->close();
} else {
    echo "Falta el parámetro 'id_asesor' en la solicitud.";
}
?>
