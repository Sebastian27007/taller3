import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';

class UploadArchive extends StatefulWidget {
  @override
  _UploadArchiveState createState() => _UploadArchiveState();
}

class _UploadArchiveState extends State<UploadArchive> {
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
    );
  }
}