import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asesores'),
      ),
      body: ListView(
        children: <Widget>[
          _buildCard('Asesor 1', Colors.red, context),
          _buildCard('Asesor 2', Colors.blue, context),
          _buildCard('Asesor 3', Colors.green, context),
          _buildCard('Asesor 4', Colors.yellow, context),
          _buildCard('Asesor 5', Colors.red, context),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'FAQ',
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, Color color, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(title)));
      },
      child: Card(
        color: color,
        child: ListTile(
          leading: Icon(Icons.person),
          title: Text(title),
          subtitle: Text('Descripción del asesor'),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;

  DetailPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Detalles del $title'),
      ),
    );
  }
}
