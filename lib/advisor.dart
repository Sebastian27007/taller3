import 'package:flutter/material.dart';
import 'package:ti3app/main.dart';
import 'package:ti3app/main.dart';

class Advisor {
  final String name;
  final String role;
  final String des;

  Advisor({required this.name, required this.role, required this.des});
}

class AdvisorsPage extends StatelessWidget {
  final List<Advisor> advisors = [
    Advisor(name: 'Rodrigo Moya Sobarzo', role: 'Asesor Pedagogico / Unidad de Estudio ', des: 'Seguimiento y estudio  y PID (Proyecto de Innovacion docente) ' ),
    Advisor(name: 'Mariel Soto Riveros', role: 'Asesora Pedagogica ', des: 'Virtualización, asesoria docente  y Impulsa tu RED '),
    Advisor(name: 'Georgina Durán Jiménez', role: 'Asesor Pedagogica ', des: 'Virtualización, comunidad de aprendizaje , asesoria docente, Formación docente '),
    Advisor(name: 'Jaime Orellana García ', role: 'Asesor Pedagogico ', des: 'Laboratorio Experimental - Realidades Extendidas '),
    Advisor(name: 'Sergio Sanhueza ', role: 'Asesor Pedagogico ', des: 'Bienestar Docente, asesoria docente, comunidades de aprendizaje, Formación docente'),
    Advisor(name: 'Fabiola Castro Sepulveda ', role: 'Secretaria CINAP', des: 'Gestión agenda Dirección , espacios y procesos CINAP' ),
    Advisor(name: 'Monica Kaechele Obreque', role: 'Academica- Directora ', des: 'Directora CINAP '),
    Advisor(name: 'Claudio Palma Ávila ', role: 'Asesor Pedagogico ', des: 'Educación Digital, asesoria docente, virtualización, Tutores Elearning, Formación docente '),
    Advisor(name: 'Juan Maripillan', role: 'Administrados de plataformas ', des: 'EDUCA Blackboard, moodle,  zoom , nearpod. '),
    Advisor(name: 'Eileen Makarena Pardo', role: 'Asesora Pedagogica ', des: 'Asesoria docente, innovación , realidades extendidas  , Formación docente'),
    // Añade más asesores aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asesores'),
      ),
      body: ListView.builder(
        itemCount: advisors.length,
        itemBuilder: (context, index) {
          final advisor = advisors[index];
          final color = index % 2 == 0 ? Colors.green : Colors.blue;

          return ListTile(
            leading: Icon(Icons.person),
            title: Text(advisor.name),
            subtitle: Text(advisor.role),
            tileColor: color,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(advisor.name),
                    content: Text('Descripción: ${advisor.des}'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cerrar'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'ChatBot',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(context,MaterialPageRoute(builder: (context) => MyCombinedPage()));
            // Navegar al inicio
          } else if (index == 1) {
            Navigator.push(context,MaterialPageRoute(builder: (context) => MyCombinedPage()));
            // Navegar al chat/ te envia al foro xd
          }
        },
      ),
    );
  }
}