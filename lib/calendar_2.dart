import 'dart:io';
import 'package:googleapis_auth/auth_io.dart';
import 'package:googleapis/calendar/v3.dart';

void main() async {
  // Credenciales JSON descargadas desde la Consola de Desarrolladores de Google
  final jsonFile = File('C:/Users/Nycto/Documents/GitHub/taller3/assets/client_secret_864751837766-q3dsk3tv9lnfi6fngbc7hmm9n94iivuj.apps.googleusercontent.com.json');
  final jsonContents = await jsonFile.readAsString();

  // ID de cliente y alcance (scope) para la API de Google Calendar
  final clientId = ClientId('<CLIENT_ID>', '<CLIENT_SECRET>');
  final scopes = [CalendarApi.calendarReadonlyScope];

  // Autenticación con las credenciales
  final credentials = ServiceAccountCredentials.fromJson(jsonContents);
  final client = await clientViaServiceAccount(credentials, scopes);

  // Crear una instancia de la API de Google Calendar
  final calendar = CalendarApi(client);

  try {
    // Realizar una solicitud para obtener la lista de eventos
    final events = await calendar.events.list('<CALENDAR_ID>');

    // Imprimir los eventos
    for (final event in events.items!) {
      print('Título: ${event.summary}');
      print('Fecha de inicio: ${event.start?.dateTime}');
      print('Fecha de finalización: ${event.end?.dateTime}');
      print('---');
    }
  } catch (e) {
    print('Error: $e');
  }
}