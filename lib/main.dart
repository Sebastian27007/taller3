import 'package:flutter/material.dart';
import 'package:ti3app/Login_app.dart';
import 'package:ti3app/create_perfil.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // El título de la aplicación
  static const appTitle = 'DTE APP';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: const MyCombinedPage(),
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
          headline6: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1DE9B6),
          ),
        ),
      ),
    );
  }
}

class MyCombinedPage extends StatefulWidget {
  const MyCombinedPage({super.key});

  @override
  _MyCombinedPageState createState() => _MyCombinedPageState();
}

class _MyCombinedPageState extends State<MyCombinedPage> {
  int _selectedIndex = 0;

  // Las opciones que se muestran en el cuerpo de la página
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
    Text('Index 1: Business', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
    Text('Index 2: School', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    // Cambiar el índice seleccionado cuando se toca un ítem
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(MyApp.appTitle)), // Usar el título de MyApp
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Contenido de la App'),
            ),
            ListTile(
              title: const Text('Mi perfil'),
              onTap: () {
                // Agrega aquí lo que deseas hacer cuando se toque la opción 3 en el Drawer
                Navigator.push(context, MaterialPageRoute(builder: (context) => UserPerfil()),
                );
                //Navigator.pop(context); // Cierra el Drawer, para agregar la acción elimina esta línea o comentala porque no permite agregar otro navigator
              },
            ),
            ListTile(
              title: const Text('Asesorias'),
              onTap: () {
                // Agrega aquí lo que deseas hacer cuando se toque la opción 1 en el Drawer
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
            ListTile(
              title: const Text('Chat social'),
              onTap: () {
                // Agrega aquí lo que deseas hacer cuando se toque la opción 2 en el Drawer
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
            ListTile(
              title: const Text('Servicio de correos'),
              onTap: () {
                // Agrega aquí lo que deseas hacer cuando se toque la opción 3 en el Drawer
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
            ListTile(
              title: const Text('Cerrar sesión'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()),
                );
                // Agrega aquí lo que deseas hacer cuando se toque la opción 3 en el Drawer
                //Navigator.pop(context); // Cierra el Drawer
              },
            ),
            const SizedBox(height: 30,),
            const SizedBox(
              child: Text('Versión 1.0',
              textAlign: TextAlign.center,),
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          MaterialButton(
            onPressed: () {},
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 25),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            color: Colors.blueAccent,
            child: const Text(
              'Servicio de asesorías',
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
                    style: Theme.of(context).textTheme.headline2),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                color: Colors.blue,
                icon: Image.asset(
                  'assets/icons/carpeta1.jpeg',
                  width: 60,
                  height: 60,
                ),
              ),
              IconButton(
                onPressed: () {},
                color: Colors.blue,
                icon: Image.asset(
                  'assets/icons/carpeta1.jpeg',
                  width: 60,
                  height: 60,
                ),
              ),
              IconButton(
                onPressed: () {},
                color: Colors.blue,
                icon: Image.asset(
                  'assets/icons/carpeta1.jpeg',
                  width: 60,
                  height: 60,
                ),
              ),
              IconButton(
                onPressed: () {},
                color: Colors.blue,
                icon: Image.asset(
                  'assets/icons/carpeta1.jpeg',
                  width: 60,
                  height: 60,
                ),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              'Redes sociales',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              MaterialButton(
                onPressed: () {},
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 25),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                color: Colors.lightBlue,
                child: const Text(
                  'Asesores',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginApp()),
                  //);
                },
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 25),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                color: Colors.green,
                child: const Text(
                  'Profesores',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
   bottomNavigationBar: BottomNavigationBar(
  items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Inicio',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.chat),
      label: 'Chatbot',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Ajustes',
    ),
  ],
  currentIndex: _selectedIndex,
  selectedItemColor: Colors.blue,
  onTap: _onItemTapped,
      ),
    );
  }
}
