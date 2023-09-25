import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class ScreenAsesores extends StatefulWidget {
  @override
  _ScreenAsesoresState createState() => _ScreenAsesoresState();
}

class _ScreenAsesoresState extends State<ScreenAsesores> {
  TextEditingController idAsesorController = TextEditingController();
  String resultadoConsulta = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultas Asesores'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: idAsesorController,
                decoration: InputDecoration(
                  labelText: 'Ingrese el ID del asesor',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Llamar a la función para realizar la consulta
                  consultarAsesor();
                },
                child: Text('Consultar'),
              ),
              SizedBox(height: 20),
              Text(resultadoConsulta),
            ],
          ),
        ),
      ),
    );
  }

  void consultarAsesor() async {
    String idAsesor = idAsesorController.text;

    Uri apiUrl = Uri.parse('https://192.168.43.75/api_taller3/consultar_asesor.php?id_asesor=$idAsesor');
    http.Client client = http.Client();
    http.Response response = await client.get(
      apiUrl,
      headers: {
        "Accept": "application/json",
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        resultadoConsulta = response.body;
      });
    } else {
      setState(() {
        resultadoConsulta = 'Error: ${response.statusCode}';
      });
    }
  }
}
