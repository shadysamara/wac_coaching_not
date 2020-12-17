import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:wac_fcm_coaching/appget.dart';

class LocalHelper {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  static AndroidNotificationDetails androidNotificationDetails;
  static AppGet appGet;
  static initLocalNotification() async {
    appGet = Get.put(AppGet());
    //1
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    androidNotificationDetails = AndroidNotificationDetails(
      "wac",
      "wac channel",
      "test channel",
      importance: Importance.max,
      priority: Priority.high,
      enableVibration: true,
    );
    //4
    var indroidInitializationSettings =
        AndroidInitializationSettings('icon_not');
    //3
    var initializationSettings =
        InitializationSettings(android: indroidInitializationSettings);
    //2
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onNotificationSelected);
  }

  ////////////////////////////////////////////////////
  static Future<void> onNotificationSelected(String payload) {
    appGet.addNotificationPayload(payload);
  }

  //////////////////////////////////////////////////
  static showNotification(int id, String title, String body) {
    var notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    flutterLocalNotificationsPlugin.show(id, title, body, notificationDetails,
        payload: '{"id":"2","Name":"choclate"}');
  }
}
