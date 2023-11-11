import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(AsesoresApp());
}

class AsesoresApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> asesoresData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse("http://localhost/api_taller3/consultar_asesor.php"),
    headers: {"Cache-Control": "no-cache"},
    );

    if (response.statusCode == 200) {
      setState(() {
        asesoresData = List<String>.from(json.decode(response.body));
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
          return ListTile(
            title: Text(asesoresData[index]),
          );
        },
      ),
    );
  }
}
