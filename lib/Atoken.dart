import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ti3app/main.dart';

class Atoken {
  static const String TOKEN_KEY = 'session_token';

  static Future<String?> getSessionToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(TOKEN_KEY);
  }

  static Future<void> setSessionToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(TOKEN_KEY, token);
  }

  static Future<void> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      String token = await userCredential.user!.getIdToken();
      await setSessionToken(token);
      // aqui poner lo de wolver al inicio o una bievenida?
      if (loginSuccessful){
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),
        );
      }else {
        showDialog(
            context: context,
            builder: BuildContext context) {
          return AlertDialog(
            title: Text('Error de inicio de sesión'),
            content: Text('Credenciales inválidas, puede intentarlo nuevamente.'),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context)
                  }, child: Text('OKI DOKI'))
            ],
          )
        }
      }
    } catch (e) {
      // Error al iniciar sesión, mensaje de error o un pantallazo azul ? mmh
    }
  }
}