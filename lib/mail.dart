import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enviar Recordatorio'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            enviarCorreo();
          },
          child: Text('Enviar Recordatorio'),
        ),
      ),
    );
  }

  enviarCorreo() async {
    String email = 'cuevasramirez360@gmail.com';

    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'Tu Nombre')
      ..recipients.add(email)
      ..subject = 'Recordatorio'
      ..text = 'recordatorio para  algo importante.';

    try {
      final sendReport = await send(message, smtpServer);
      print('Correo enviado: ${sendReport.toString()}');
    } on MailerException catch (e) {
      print('Error al enviar el correo: $e');
    }
  }
}
