import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:wac_fcm_coaching/local_helper.dart';

class Fcm {
  static Fcm fcm = Fcm();
  FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  initFcm() {
    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        LocalHelper.showNotification(1, message['notification']['title'],
            message['notification']['body']);
      },
      onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        LocalHelper.showNotification(1, message['notification']['title'],
            message['notification']['body']);
      },
      onResume: (Map<String, dynamic> message) async {
        LocalHelper.showNotification(1, message['notification']['title'],
            message['notification']['body']);
      },
    );
  }

  static Future<dynamic> myBackgroundMessageHandler(
      Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }

    // Or do other work.
  }
}
