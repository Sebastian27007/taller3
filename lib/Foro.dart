import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(ComunidadUCTApp());
}

class Comentario {
  final String id;
  final String contenido;
  final String autor;
  final DateTime fecha;

  Comentario({
    required this.id,
    required this.contenido,
    required this.autor,
    required this.fecha,
  });
}

class ComunidadUCTApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Comunidad UCT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.blue, // Color de fondo de la AppBar
        ),
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.white, // Color del texto en la AppBar
            fontSize: 20.0, // Tamaño del texto en la AppBar
            fontWeight: FontWeight.bold, // Peso de la fuente del texto en la AppBar
          ),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white, // Color del texto de la pestaña seleccionada
          unselectedLabelColor: Colors.white, // Color del texto de las pestañas no seleccionadas
        ),
      ),
      home: DefaultTabController(
        length: 2, // Número de pestañas
        child: ComunidadUCTHomePage(),
      ),
    );
  }
}


// Categorías
class Categoria {
  final String id;
  final String nombre;

  Categoria({required this.id, required this.nombre});
}

class Publicacion {
  final String id;
  final String contenido;
  final List<Categoria> categorias;

  Publicacion({required this.id, required this.contenido, required this.categorias});
}

List<Categoria> categorias = [
  Categoria(id: '1', nombre: 'Política'),
  Categoria(id: '2', nombre: 'Deportes'),
  Categoria(id: '3', nombre: 'Tecnología'),
];

List<Publicacion> publicaciones = [
  Publicacion(
    id: '1',
    contenido: 'Contenido de la publicación 1',
    categorias: [categorias[0]], // Asocia la publicación a la categoría "Política"
  ),
  Publicacion(
    id: '2',
    contenido: 'Contenido de la publicación 2',
    categorias: [categorias[1]], // Asocia la publicación a la categoría "Deportes"
  ),
  Publicacion(
    id: '3',
    contenido: 'Contenido de la publicación 1',
    categorias: [categorias[2]], // Asocia la publicación a la categoría "Tecnologia"
  ),
];

class ComunidadUCTHomePage extends StatefulWidget {
  @override
  _ComunidadUCTHomePageState createState() => _ComunidadUCTHomePageState();
}

class _ComunidadUCTHomePageState extends State<ComunidadUCTHomePage> {
  int _currentIndex = 0; // Índice seleccionado en la barra inferior

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Comunidad UCT',
          style: TextStyle(
            color: Colors.white, // Cambia el color del título
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implementa la navegación a la pantalla de búsqueda.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BusquedaScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.mail_outline),
            onPressed: () {
              // navegación a los mensaje directo.
            },
          ),
        ],
        bottom: TabBar(
          tabs: [
            Tab(text: 'Importantes'),
            Tab(text: 'Otras Noticias'),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          _buildTabContent('Importantes'),
          _buildTabContent('Otras Noticias'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // crear y publicar.
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 1) {
            // Implementa la navegación a la pantalla de búsqueda.
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BusquedaScreen(),
              ),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
        ],
      ),
    );
  }


  Widget _buildTabContent(String tabTitle) {
    return ListView.builder(
      itemCount: 10, // Número de publicaciones a mostrar.
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 4,
          margin: EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  // foto de perfil.
                  backgroundImage: AssetImage('assets/icons/icono_perfil.png'),
                ),
                title: Text('UCT Administración'),
                subtitle: Text(tabTitle), // Muestra el título de la pestaña.
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Universidad comprometida con el aprendizaje'),
              ),
              // Carrusel de imágenes (opcional)
              if (index % 2 == 0) // Condición para incluir imágenes
                CarouselSlider(
                  options: CarouselOptions(
                    height: 400.0,
                    aspectRatio: 16/9,
                    enlargeCenterPage: true,
                  ),
                  items: [
                    'assets/imageforo/image0.png',
                    'assets/imageforo/image1.png',
                    'assets/imageforo/image2.png',
                    'assets/imageforo/image3.png',
                    'assets/imageforo/image4.png',
                    // Agrega más imágenes si es necesario
                  ]
                      .where((imageAsset) => imageAsset != null) // Filtra imágenes nulas
                      .map((String imageAsset) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Image.asset(imageAsset),
                        );
                      },
                    );
                  }).toList(),
                ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {
                      // funcion de "me gusta" para las publicaciones.
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget _buildTabContent(String tabTitle) {
  return ListView.builder(
    itemCount: publicaciones.length,
    itemBuilder: (BuildContext context, int index) {
      Publicacion publicacion = publicaciones[index];

      // Filtra las publicaciones por categoría si es necesario
      if (tabTitle != 'Todas' &&
          !publicacion.categorias.any((categoria) => categoria.nombre == tabTitle)) {
        return Container(); // No muestra la publicación si no coincide con la categoría seleccionada
      }

      return Card(
        elevation: 4,
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              title: Text(publicacion.contenido),
              subtitle: Text('Categorías: ${publicacion.categorias.map((c) => c.nombre).join(', ')}'),
            ),
            // contenido de la publicación, como imágenes, botones, etc.
          ],
        ),
      );
    },
  );
}

class BusquedaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Búsqueda'),
      ),
      body: Center(
        child: Text('Pantalla de búsqueda aquí'),
      ),
    );
  }
}

