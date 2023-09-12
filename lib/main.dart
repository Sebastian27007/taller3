import 'package:flutter/material.dart';
import 'package:ti3app/Login_app.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home',
      home: const Myscreen(),
        theme: ThemeData(
          primaryColor: const Color(0xFF5F5FFF),
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF030047),
    ),
            headline2: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF5F5FFF),
           ),
            headline3: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF18FFFF),
            ),
        ),
      ),
    );
  }
}
class Myscreen extends StatelessWidget{
  const Myscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        title: const Text('Inicio'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          MaterialButton(
            //width: MediaQuery.of(context).size.width,
            onPressed: () {  },
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 25),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            color: Colors.deepPurpleAccent,
            child: const Text('Servicio de asesorias',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 36, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text('Recursos de la plataforma',
                textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headline2
                ),
              ),
            ],
          ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(onPressed: (){ },
                color: Colors.blue,
                icon: Image.asset('assets/icons/carpeta1.jpeg',
                width: 60,
                height: 60,)
                ,),
              IconButton(onPressed: (){}, icon: Image.asset('assets/icons/carpeta1.jpeg',
              width: 60,
              height: 60,)
                ,),
              IconButton(onPressed: (){}, icon: Image.asset('assets/icons/carpeta1.jpeg',
                width: 60,
                height: 60,),
              ),
              IconButton(onPressed: (){}, icon: Image.asset('assets/icons/carpeta1.jpeg',
                width: 60,
                height: 60,),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text('Redes sociales',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headline2,),
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              MaterialButton(onPressed: (){},
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 25),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),
                color: Colors.deepPurpleAccent,
                child: const Text('Asesores',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginApp()),
                );
              },
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 25),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),
                color: Colors.purpleAccent,
                child: const Text('Login Test',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}