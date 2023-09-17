import 'package:flutter/material.dart';
import 'package:ti3app/main.dart';


class Myscreen extends StatelessWidget{
  const Myscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          MaterialButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()),
            );
          },
            child: const Text('Hola esto es una pantalla de carga, wait a moment'),
          ),
        ],
      ),
    );
  }
}