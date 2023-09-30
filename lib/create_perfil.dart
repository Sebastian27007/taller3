import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; //Para implementar esta librería es necesario activar las opciones de desarrollador

class UserPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetImage(),
    );
  }
}

class GetImage extends StatefulWidget {
  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<GetImage> {
  XFile? _image;

  Future<void> _getImageFromCamera() async {
    final XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future<void> _getImageFromGallery() async {
    final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi perfil'),
      ),
      body: Center(
        child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.blue, Colors.lightGreenAccent],)
            ),
            //color: Colors.purpleAccent,
            width: double.infinity,
            height: size.height * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _image == null
                  ? Text('Ninguna imagen seleccionada.')
                  : Image.file(File(_image!.path)),
              ElevatedButton(
                onPressed: _getImageFromCamera,
                child: Text('Tomar una Foto'),
              ),
              ElevatedButton(
                onPressed: _getImageFromGallery,
                child: Text('Seleccionar una Imagen de la Galería'),
              ),
            ],
          ),
        ),

      ),
    );
  }
}

