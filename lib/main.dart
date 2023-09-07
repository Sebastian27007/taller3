import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Página de inicio',
      home: Myscreen(),
        theme: ThemeData(
          primaryColor: Color(0xFF5F5FFF),
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF030047),
    ),
            headline2: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF5F5FFF),
           ),
        ),
      ),
    );
  }
}
class Myscreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        title: const Text('Inicio'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text('Servicio de asesorias',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1,)
            )
          ],
        ),
      ),
    );
  }
}