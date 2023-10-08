//import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; //Para implementar esta librería es necesario activar las opciones de desarrollador
import 'package:ti3app/SettingsApp.dart';
import 'package:ti3app/main.dart';

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
        title: const Text('Mi perfil'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ), onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()),
            );
          },
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AppSettings()),
            );
          },
              icon: const Icon(Icons.settings,
              color: Colors.black,),
          ),
        ],
      ),
      body: Center(
        child: Container(
          //padding: EdgeInsets.only(left: 15,top: 20, right: 15),
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.blue, Colors.lightGreenAccent],)
            ),
            //color: Colors.purpleAccent,
            width: double.infinity,
            height: size.height * 0.9,
          child: Container(
            padding: const EdgeInsets.only(left: 15,top: 20, right: 15),
            child: GestureDetector(
              onTap: (){
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            _getImageFromGallery();
                          },
                          child: Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              border: Border.all(width: 4, color: Colors.white),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.3),
                                ),
                              ],
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/icons/icono_perfil.png'),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color: Colors.white,
                              ),
                              color: Colors.blueAccent,
                            ),
                            child: const Icon(
                              Icons.edit,
                              color:  Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30.0,),
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(20),
                          width: double.infinity,
                          height: 400,
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow:const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 15,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              const SizedBox(height: 10,),
                              Text('Información Personal',
                                style: Theme.of(context).textTheme.headline4,),
                              const SizedBox(height: 30,),
                              TextFormField(
                                autocorrect: false,
                                decoration:  const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blueAccent)),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.lightBlue,
                                        width: 2),),
                                  hintText: 'Ingrese su nombre',
                                  labelText: 'Nombre del usuario:',
                                  prefixIcon: Icon(Icons.person),
                                ),
                              ),
                              Transform.translate(
                                  offset: const Offset(-300,5),
                                  child: MaterialButton(
                                    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 25),
                                    onPressed: (){

                                    }, child:
                                    const Text(
                                      'Contactos',
                                      style: TextStyle(
                                        fontSize: 17.0,

                                      ),
                                    ),
                                  ),
                              ),

                              TextFormField(
                                autocorrect: false,
                                decoration:  const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blueAccent)),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.lightBlue,
                                        width: 2),),
                                  hintText: 'ejemplo@gmail.com',
                                  labelText: 'correo electrónico:',
                                  prefixIcon: Icon(Icons.alternate_email_rounded),
                                ),
                              ),
                              TextFormField(
                                autocorrect: false,
                                decoration:  const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blueAccent)),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.lightBlue,
                                        width: 2),),
                                  hintText: 'ingresa contraseña',
                                  labelText: 'contraseña:',
                                  prefixIcon: Icon(Icons.lock_outline),
                                ),
                              ),
                              TextFormField(
                                autocorrect: false,
                                decoration:  const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blueAccent)),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.lightBlue,
                                        width: 2),),
                                  labelText: 'Biografía',
                                  prefixIcon: Icon(Icons.person),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

