import 'package:firebase_messaging/firebase_messaging.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

Future<void> _configureFirebaseMessaging() async {
  _firebaseMessaging.configure(
    onMessage: (Map<String, dynamic> message) async {
      print("onMessage: $message");
    },
    onLaunch: (Map<String, dynamic> message) async {
      print("onLaunch: $message");
    },
    onResume: (Map<String, dynamic> message) async {
      print("onResume: $message");
    },
  );
}

Future<void> _requestNotificationPermissions() async {
  NotificationSettings settings = await _firebaseMessaging.requestPermission(
    alert: true,
    badge: true,
    provisional: false,
    sound: true,
  );

  print("User granted permission: ${settings.authorizationStatus}");
}

String? _deviceToken;

Future<void> _getDeviceToken() async {
  _deviceToken = await _firebaseMessaging.getToken();
  print("Device Token: $_deviceToken");
}
