import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ti3app/calendario.dart';
import 'package:ti3app/jitsi_meet.dart';
import 'package:table_calendar/table_calendar.dart';

class AsesorDetailPage extends StatelessWidget {
  final Map<String, dynamic> asesorData;
  TextEditingController CorreoController = TextEditingController();
  //String Data = "";

  AsesorDetailPage({required this.asesorData});

Future sendEmail() async{
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    const serviceId = 'service_47hwpe2';
    const templateId = 'template_y603o4g';
    const userId = 'TnQjQH5Fe0tMO3puI';
    final response = await http.post(url,
        headers: {'Content-Type':'application/json'},
        body: json.encode({
          "service_id": serviceId,
          "template_id": templateId,
          "user_id": userId,
          "template_params":{
            "name": 'Profesor',
            "subject": 'Usuario de prueba',
            "message": "Hola estoy funcionando...más o menos",
            "user_email": CorreoController.text,
          }
        })
    );
    return response.statusCode;
  }

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
          Text('Correo: ${asesorData["Correo"]}'),
          // Otros detalles del asesor...
          ElevatedButton(onPressed: (){
              //print(asesorData["Nombre"]);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Calendar()));
          }, child: Text('Agendar Hora')),
          const SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () {
              // Navegar a la página Jitsi al presionar el botón
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Jitsi()),
              );
            },
            child: const Text('Iniciar Reunión'),
            ),
            ElevatedButton(onPressed: (){
              //print(asesorData["Nombre"]);
              sendEmail();
          }, child: Text('Agendar sesión')),
            TextField(
              controller: CorreoController,
              decoration: InputDecoration(labelText: 'Ingrese su correo'),
            ),
        ],
      ),
    );
  }
}

