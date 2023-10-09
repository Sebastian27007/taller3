import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'busqueda_screen.dart';


void main() {
  runApp(ComunidadUCTApp());
}

class ComunidadUCTApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comunidad UCT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 2, // Número de pestañas
        child: ComunidadUCTHomePage(),
      ),
    );
  }
}

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
        title: Text('Comunidad UCT'),
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
              // Implementa la navegación a los mensajes directos de la comunidad.
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
          // Implementa la funcionalidad para crear y publicar una nueva publicación.
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
        // Aquí puedes construir y personalizar cada tarjeta de publicación.
        return Card(
          margin: EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  // Muestra la foto de perfil del usuario que hizo la publicación.
                  backgroundImage: AssetImage('assets/profile_image.png'),
                ),
                title: Text('Nombre de Usuario'),
                subtitle: Text(tabTitle), // Muestra el título de la pestaña.
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Contenido de la publicación'),
              ),
              // Agregar carrusel de imágenes (opcional)
              if (index % 2 == 0) // Condición para incluir imágenes
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    aspectRatio: 16 / 9,
                    enlargeCenterPage: true,
                  ),
                  items: [
                    'assets/image0.png',
                    'assets/image1.png',
                    'assets/image2.png',
                    // Agrega más imágenes si es necesario
                  ]
                      .where((imageAsset) =>
                  imageAsset != null) // Filtra imágenes nulas
                      .map((String imageAsset) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
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
                      // Implementa la funcionalidad de "me gusta" para las publicaciones.
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