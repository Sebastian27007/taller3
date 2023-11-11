import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ti3app/main.dart';
import 'package:ti3app/advisor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inscripción de Cursos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: CoursesPage(),
    );
  }
}

class CoursesPage extends StatelessWidget {
  final List<Course> courses = [
    Course(
      name: 'CONOCIENDO EL MODELO EDUCATIVO UC TEMUCO',
      description: 'Modalidad Autoinstruccional',
      url: 'https://dte.uct.cl/formaciondocente2023/',
      color: Colors.green,
    ),
    Course(
      name: 'INTRODUCCIÓN A EDUCA BLACKBOARD',
      description: 'Modalidad Autoinstruccional',
      url: 'https://dte.uct.cl/formaciondocente2023/',
      color: Colors.blueAccent,
    ),
    Course(
      name: 'DOCENCIA EN LÍNEA',
      description: 'Modalidad Full E-learning',
      url: 'https://dte.uct.cl/formaciondocente2023/',
      color: Colors.green,
    ),
    Course(
      name: 'INDUCCCIÓN A DOCENTES NUEVOS',
      description: 'Modalidad Autoinstruccional',
      url: 'https://dte.uct.cl/formaciondocente2023/',
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscripción de Cursos'),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {

          return Container(
            width: 200,
            height: 140,
            color: Colors.blueAccent,
            child: ListTile(
              title: Text(courses[index].name),
              subtitle: Text(courses[index].description),
              trailing: ElevatedButton(
                onPressed: () {
                  launchURL(courses[index].url);
                },
                child: Text('Ir al curso'),
              ),
            ),

          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {
            if (index == 0) {
              Navigator.push(context,MaterialPageRoute(builder: (context) => MyCombinedPage()));
              //navegar home
            } else if (index == 1) {
              Navigator.push(context,MaterialPageRoute(builder: (context) => AdvisorsPage()));
              //navegar asesores
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Asesores',
            ),
          ],
          selectedItemColor: Colors.blue
      ),
    );
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir el enlace $url';
    }
  }
}

class Course {
  final String name;
  final String description;
  final String url;
  final Color color;

  Course({
    required this.name,
    required this.description,
    required this.url,
    required this.color,
  });
}