import 'package:flutter/material.dart';
import 'package:ti3app/calendario.dart';

class AsesorDetailPage extends StatelessWidget {
  final Map<String, dynamic> asesorData;

  AsesorDetailPage({required this.asesorData});

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

          // Otros detalles del asesor...
          ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Calendar()));
          }, child: Text('Agendar Sesión')),
        ],
      ),
    );
  }
}
