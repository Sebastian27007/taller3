<?php
include './connection.php';

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");

$sql = "SELECT * FROM asesores";
$result = $connectNow->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $nombreAsesor = $row["Nombre"];
        $CarreraAsesor = $row["Carrera"];
        $RolAsesor = $row["Rol"];
        $EspecialidadAsesor = $row["Especialidad"];

        echo "Nombre del asesor: " . $nombreAsesor ," ";
        echo "Carrera del asesor: " . $CarreraAsesor," ";
        echo "Rol del Asesor: " . $RolAsesor," ";
        echo "EspecialidadAsesor: " . $EspecialidadAsesor;
        echo "<br>";  // Agregamos un salto de línea para separar cada asesor
    }
} else {
    echo "No se encontraron asesores.";
}

$connectNow->close();
?>
