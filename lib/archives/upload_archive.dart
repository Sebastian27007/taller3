import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';

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
      await _saveFileToProjectFolder(_image!, 'image.png');
    }
  }

  Future<void> _saveFileToProjectFolder(File file, String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final projectFolderPath = directory.path + '/project_files';

    if (!await Directory(projectFolderPath).exists()) {
      await Directory(projectFolderPath).create(recursive: true);
    }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guardar Archivo en Carpeta de Proyecto'),
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
            TextButton(onPressed:(){
              uploadPdf();
            },
                child: const Text("Subir PDF."))
          ],
        ),
      ),
    );
  }

  Future uploadPdf() async{
    var dio = Dio();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if(result!=null){
      File file = File(result.files.single.path ?? " ");

      String fileName = file.path.split('/').last;
      String filePath = file.path;
      FormData data = FormData.fromMap({
        'x-api-key':'apikey',
        'file':await MultipartFile.fromFile(filePath,filename: fileName)
      });
      var response = dio.post('https://api.pdf.co/v1/file/upload',data:data,
      onSendProgress:(int sent, int total){
        print('$sent,$total');
      } );
      print(response.toString());
    }else{
      print('resultado nulo');
    }
  }
}
