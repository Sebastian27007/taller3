import 'dart:io';
import 'package:flutter/material.dart';
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
=======
import 'package:ti3app/Login_app.dart';
import 'package:ti3app/upload_archive.dart';
import 'package:ti3app/screen_asesores.dart';
>>>>>>> Stashed changes
=======
import 'package:ti3app/users/authentication/Login_app.dart';
import 'package:ti3app/upload_archive.dart';
import 'package:ti3app/screen_asesores.dart';
>>>>>>> Stashed changes
=======
import 'package:ti3app/users/authentication/Login_app.dart';
import 'package:ti3app/upload_archive.dart';
import 'package:ti3app/screen_asesores.dart';
>>>>>>> Stashed changes

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _image;

  Future<void> _getImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });

      // Llamada a la función para guardar la imagen en la carpeta local del proyecto.
      await _saveImageToProjectFolder();
    }
  }

  Future<void> _saveImageToProjectFolder() async {
    final directory = await getApplicationDocumentsDirectory();
    final projectFolderPath = directory.path + '/project_images';

    // Verifica si la carpeta del proyecto existe, y si no, créala.
    if (!await Directory(projectFolderPath).exists()) {
      await Directory(projectFolderPath).create(recursive: true);
    }

    final imageName = 'image.png';
    final imagePath = path.join(projectFolderPath, imageName);

    try {
      await _image!.copy(imagePath);
      // La imagen se ha guardado en la carpeta local del proyecto.
      print('Imagen guardada en: $imagePath');
    } catch (e) {
      print('Error al guardar la imagen: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guardar Imagen en Carpeta de Proyecto'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_image != null)
              Image.file(_image!)
            else
              Text('Selecciona una imagen'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getImage,
              child: Text('Seleccionar Imagen'),
            ),
          ],
        ),
      ),
<<<<<<< Updated upstream
=======
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
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenAsesores()),
                  );
                },
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 25),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                color: Colors.deepPurpleAccent,
                child: const Text(
                  'Consultas asesores',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UploadArchive()),
                  );
                },
                padding:
                const EdgeInsets.symmetric(horizontal: 80, vertical: 25),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                color: Colors.deepPurpleAccent,
                child: const Text(
                  'subir archivo',
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
>>>>>>> Stashed changes
    );
  }
}