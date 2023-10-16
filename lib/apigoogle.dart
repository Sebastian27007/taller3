import 'package:googleapis_auth/auth_io.dart';
import 'package:googleapis/calendar/v3.dart' as calendar;

const _clientId = "290325605957-2csp29v4b48qahc1qt2bu4qgugol20rt.apps.googleusercontent.com";
const _clientSecret = "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";

void main() {
  var clientID = ClientId(_clientId, _clientSecret);
  var scopes = [calendar.CalendarApi.calendarScope];

  clientViaUserConsent(clientID, scopes, prompt)
      .then((AuthClient client) {
    var calendarApi = calendar.CalendarApi(client);
    // Ahora puedes usar calendarApi para interactuar con la API de Google Calendar
  });
}

void prompt(String url) {
  print("Por favor ve a la siguiente URL y concede acceso a la aplicación:");
  print("  => $url");
  print("");
}