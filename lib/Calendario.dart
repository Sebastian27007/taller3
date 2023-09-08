import 'package:googleapis_auth/googleapis_auth.dart' as auth;
import 'package:googleapis/calendar/v3.dart' as calendar; // Importa el paquete de la API de Calendar si lo estás utilizando.

Future<void> obtenerCredenciales() async {
  final _credentials = auth.ClientId(
    'YOUR_CLIENT_ID',
    'YOUR_CLIENT_SECRET',
  );

  final _client = await auth.clientViaUserConsent(
    _credentials,
    ['https://www.googleapis.com/auth/calendar.readonly'],
    prompt: 'select_account',
  );

  // Ahora puedes usar _client para interactuar con la API de Google, por ejemplo:
  final calendarApi = calendar.CalendarApi(_client);

  // Realiza solicitudes a la API de Google Calendar aquí...

  // No olvides cerrar el cliente cuando hayas terminado de usarlo.
  _client.close();
}

void main() {
  obtenerCredenciales();
}