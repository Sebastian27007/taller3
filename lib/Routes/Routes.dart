import 'package:flutter/material.dart';
//Aqui se importan los archivos que se usaran en la Aplicación
import 'package:ti3app/main.dart';
import 'package:ti3app/create_perfil.dart';
import 'package:ti3app/contacts.dart';
import 'package:ti3app/Login_app.dart';
//import 'package:ti3app/screen_asesores.dart';
import 'package:ti3app/SettingsApp.dart';
import 'package:ti3app/Screens/Screen1.dart';

//Aqui se crean las rutas de la app
Map<String, WidgetBuilder> routes = {
  '/home': (context) => MyApp(),
  '/perfil': (context) => UserPerfil(),
  '/Login': (context) => LoginApp(),
  '/contactos': (context) => contactsApp(),
  '/screen1': (context) => Myscreen(),
  '/opciones': (context) => AppSettings(),
  //'/asesores': (context) => asesores(),
};

//codigo usado para enrutas:

/*
ejemplo:
Navigator.pushNamed(context, '/Login');
*/