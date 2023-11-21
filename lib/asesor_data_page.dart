import 'package:flutter/material.dart';
import 'package:ti3app/calendario.dart';

class AsesorDetailPage extends StatelessWidget {
  final Map<String, dynamic> asesorData;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;

  AsesorDetailPage({required this.asesorData, required DateTime this.selectedDate, required TimeOfDay this.selectedTime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Asesor'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nombre: ${asesorData["Nombre"]}'),
          Text('Carrera: ${asesorData["Carrera"]}'),
          Text('Rol: ${asesorData["Rol"]}'),
          Text('Especialidad: ${asesorData["Especialidad"]}'),

          Text('Fecha seleccionada: ${selectedDate.toString().split(" ")[0]}'),
          Text('Hora seleccionada: ${selectedTime.format(context)}'),
          // Otros detalles del asesor...
          ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Calendar()));
          }, child: Text('Agendar Sesión')),
        ],
      ),
    );
  }
}
