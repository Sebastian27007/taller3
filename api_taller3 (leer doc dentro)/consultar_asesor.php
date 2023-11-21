<?php
include './connection.php';

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");

$asesores = array();

$sql = "SELECT * FROM asesores";
$result = $connectNow->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $asesor = array(
            "Nombre" => $row["Nombre"],
            "Carrera" => $row["Carrera"],
            "Rol" => $row["Rol"],
            "Especialidad" => $row["Especialidad"]
        );

        $asesores[] = $asesor;
    }
    echo json_encode($asesores);
} else {
    echo json_encode(array("message" => "No se encontraron asesores."));
}

$connectNow->close();
?>
