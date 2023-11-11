import 'package:flutter/material.dart';
import 'package:ti3app/main.dart';
import 'package:url_launcher/url_launcher.dart';

/*void main(){
  runApp(enlaces());
}
*/
final Uri _url = Uri.parse('https://directoriosalas.uct.cl/');
final Uri _url2 = Uri.parse('https://inkatun.uct.cl/');
final Uri _url3 = Uri.parse('https://academicos.uct.cl/');
final Uri _url4 = Uri.parse('https://biblioteca.uct.cl/');
final Uri _url5= Uri.parse('https://dte.uct.cl/formaciondocente2023/');
final Uri _url6 = Uri.parse('https://dte.uct.cl/wp-content/uploads/2023/08/FORMACION-SEGUNDO-SEMESTRE.pdf');


class enlaces extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Recursos(),
      );
  }
}

class Recursos extends StatelessWidget{
  const Recursos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi perfil'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ), onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()),
            );
          },
        ),
      ),

      body: Material(
        child: Center(
          child:  SingleChildScrollView(
            child: Column(
              children: [
                Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                height: 400,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow:const [
                  BoxShadow(
                    color: Colors.black12,
                            blurRadius: 15,
                            offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: const  Column(
                  children: [
                    Text('Recursos De la Universidad',
                    style: TextStyle(fontSize: 30),),
                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: _launchUrl, child: Text('Directorio de Salas')),
                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: _launchUrl2, child: Text('Asistencia Técnica')),
                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: _launchUrl3, child: Text('Portal Académico')),
                    SizedBox(height: 20),
                    ElevatedButton(onPressed: _launchUrl4, child: Text('Biblioteca UCT')),
                    SizedBox(height: 20),
                    ElevatedButton(onPressed: _launchUrl5, child: Text('Formación Docente')),
                    SizedBox(height: 20),
                    ElevatedButton(onPressed: _launchUrl6, child: Text('Formación Segundo-Semestre(PDF)')),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

Future<void> _launchUrl2() async {
  if (!await launchUrl(_url2)) {
    throw Exception('Could not launch $_url2');
  }
}

Future<void> _launchUrl3() async {
  if (!await launchUrl(_url3)) {
    throw Exception('Could not launch $_url3');
  }
}

Future<void> _launchUrl4() async {
  if (!await launchUrl(_url4)) {
    throw Exception('Could not launch $_url4');
  }
}

Future<void> _launchUrl5() async {
  if (!await launchUrl(_url5)) {
    throw Exception('Could not launch $_url5');
  }
}

Future<void> _launchUrl6() async {
  if (!await launchUrl(_url6)) {
    throw Exception('Could not launch $_url6');
  }
}


/*
Material(
        child: Center(
          child:  SingleChildScrollView(
            child: Column(
              children: [
                Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                height: 400,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow:const [
                  BoxShadow(
                    color: Colors.black12,
                            blurRadius: 15,
                            offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: const  Column(
                  children: [
                    ElevatedButton(onPressed: _launchUrl, child: Text('Directorio de Salas')),


                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        */