import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
<<<<<<< Updated upstream
<<<<<<< Updated upstream
=======
import 'package:file_picker/file_picker.dart';
>>>>>>> Stashed changes
=======
import 'package:file_picker/file_picker.dart';
>>>>>>> Stashed changes

class UploadArchive extends StatefulWidget {
  @override
  _UploadArchiveState createState() => _UploadArchiveState();
}

class _UploadArchiveState extends State<UploadArchive> {
  File? _image;
<<<<<<< Updated upstream
<<<<<<< Updated upstream
=======
  File? _pdfFile;
>>>>>>> Stashed changes
=======
  File? _pdfFile;
>>>>>>> Stashed changes

  Future<void> _getImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
<<<<<<< Updated upstream
<<<<<<< Updated upstream
      });

      // Llamada a la función para guardar la imagen en la carpeta local del proyecto.
      await _saveImageToProjectFolder();
    }
  }

  Future<void> _saveImageToProjectFolder() async {
    final directory = await getApplicationDocumentsDirectory();
    final projectFolderPath = directory.path + '/project_images';

    // Verifica si la carpeta del proyecto existe, y si no, créala.
=======
=======
>>>>>>> Stashed changes
        _pdfFile = null;
      });

      await _saveFileToProjectFolder(_image!, 'image.png');
    }
  }

  Future<void> _getPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _pdfFile = File(result.files.single.path!);
        _image = null;
      });

      await _saveFileToProjectFolder(_pdfFile!, 'document.pdf');
    }
  }

  Future<void> _saveFileToProjectFolder(File file, String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final projectFolderPath = directory.path + '/project_files';

<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
    if (!await Directory(projectFolderPath).exists()) {
      await Directory(projectFolderPath).create(recursive: true);
    }

<<<<<<< Updated upstream
<<<<<<< Updated upstream
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

=======
=======
>>>>>>> Stashed changes
    final filePath = path.join(projectFolderPath, fileName);

    try {
      await file.copy(filePath);
      print('Archivo guardado en: $filePath');
      _showSnackbar('Archivo guardado correctamente: $fileName');
    } catch (e) {
      print('Error al guardar el archivo: $e');
      _showSnackbar('Error al guardar el archivo: $e');
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< Updated upstream
<<<<<<< Updated upstream
        title: Text('Guardar Imagen en Carpeta de Proyecto'),
=======
        title: Text('Guardar Archivo en Carpeta de Proyecto'),
>>>>>>> Stashed changes
=======
        title: Text('Guardar Archivo en Carpeta de Proyecto'),
>>>>>>> Stashed changes
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_image != null)
              Image.file(_image!)
<<<<<<< Updated upstream
<<<<<<< Updated upstream
            else
              Text('Selecciona una imagen'),
=======
=======
>>>>>>> Stashed changes
            else if (_pdfFile != null)
              Text('Archivo PDF seleccionado: ${_pdfFile!.path}')
            else
              Text('Selecciona una imagen o un archivo PDF'),
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getImage,
              child: Text('Seleccionar Imagen'),
            ),
<<<<<<< Updated upstream
<<<<<<< Updated upstream
=======
=======
>>>>>>> Stashed changes
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getPdf,
              child: Text('Seleccionar Archivo PDF'),
            ),
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
          ],
        ),
      ),
    );
  }
<<<<<<< Updated upstream
<<<<<<< Updated upstream
}
=======
}
>>>>>>> Stashed changes
=======
}
>>>>>>> Stashed changes
