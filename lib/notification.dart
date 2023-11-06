import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Notifications and Email'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            sendNotification();
            sendEmail();
          },
          child: Text('Presione'),
        ),
      ),
    );
  }

  void sendNotification() async {
    var android = AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = IOSInitializationSettings();
    var initSettings = InitializationSettings(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.initialize(initSettings);

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      '',
      '',
      '',
      importance: Importance.max,
      priority: Priority.high,
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      'Notification Title',
      'Notification Body',
      platformChannelSpecifics,
      payload: 'New Payload',
    );
  }

  void sendEmail() async {
    String username = 'cuevasramirez360@gmail.com';
    String password = '';

    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'Martin')
      ..recipients.add('recipient@gmail.com')
      ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

    try {
      await send(message, smtpServer);
      print('Email sent!');
    } catch (e) {
      print('Error occurred while sending email: $e');
    }
  }
}
