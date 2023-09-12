import 'package:flutter/material.dart';
import 'package:ti3app/Login_app.dart';

void main() {
  runApp(const MyApp());
}

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
      appBar: AppBar(title: Text(MyApp.appTitle)), // Usar el título de MyApp
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text('Opción 1'),
              onTap: () {
                // Agrega aquí lo que deseas hacer cuando se toque la opción 1 en el Drawer
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
            ListTile(
              title: Text('Opción 2'),
              onTap: () {
                // Agrega aquí lo que deseas hacer cuando se toque la opción 2 en el Drawer
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
            ListTile(
              title: Text('Opción 3'),
              onTap: () {
                // Agrega aquí lo que deseas hacer cuando se toque la opción 3 en el Drawer
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
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
            color: Colors.deepPurpleAccent,
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
                icon: Image.asset(
                  'assets/icons/carpeta1.jpeg',
                  width: 60,
                  height: 60,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/icons/carpeta1.jpeg',
                  width: 60,
                  height: 60,
                ),
              ),
              IconButton(
                onPressed: () {},
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
                color: Colors.deepPurpleAccent,
                child: const Text(
                  'Asesores',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginApp()),
                  );
                },
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 25),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                color: Colors.purpleAccent,
                child: const Text(
                  'Login test',
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
