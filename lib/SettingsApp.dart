import 'package:flutter/material.dart';

class AppSettings extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue, Colors.lightGreenAccent],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        //color: Colors.purpleAccent,
        height: size.height * 1.0,
        child:const Text('Ajustes de la aplicación en proceso'),
      ),
    );
  }
}