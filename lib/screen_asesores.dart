import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ti3app/calendario.dart';
import 'package:ti3app/asesor_data_page.dart';

void main() {
  runApp(AsesoresApp());
}

class AsesoresApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> asesoresData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse("http://172.16.144.162/api_taller3/consultar_asesor.php"));

    if (response.statusCode == 200) {
      setState(() {
        asesoresData = List<Map<String, dynamic>>.from(json.decode(response.body));
      });
    } else {
      throw Exception('Error al cargar datos desde el servidor');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Asesores'),
      ),
      body: ListView.builder(
      itemCount: asesoresData.length,
      itemBuilder: (context, index) {
        return ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AsesorDetailPage(asesorData: asesoresData[index],),
            ));
          },
          child: ListTile(
            title: Text('Nombre: ${asesoresData[index]["Nombre"]}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Carrera: ${asesoresData[index]["Carrera"]}'),
                Text('Rol: ${asesoresData[index]["Rol"]}'),
                Text('Especialidad: ${asesoresData[index]["Especialidad"]}'),
                Text('Correo: ${asesoresData[index]["Correo"]}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
