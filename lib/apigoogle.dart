import 'package:flutter/material.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:googleapis/calendar/v3.dart' as calendar;
import 'package:url_launcher/url_launcher.dart';

const _clientId = "290325605957-2csp29v4b48qahc1qt2bu4qgugol20rt.apps.googleusercontent.com";
const _clientSecret = "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";

void main() {
  runApp(MyApp());
}

void prompt(String url) {
  print("Por favor ve a la siguiente URL y concede acceso a la aplicación:");
  print("  => $url");
  print("");
}

void _openURL() async {
  var clientID = ClientId(_clientId, _clientSecret);
  var scopes = [calendar.CalendarApi.calendarScope];

  var url = await clientViaUserConsent(clientID, scopes, prompt);

  // Abre la URL en el navegador interno de la aplicación
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: false, forceWebView: false);
  } else {
    throw 'No se puede abrir $url';
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Google Calendar API'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              _openURL();
            },
            child: Text('Authorize Google Calendar Access'),
          ),
        ),
      ),
    );
  }
}
