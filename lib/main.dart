import 'package:flutter/material.dart';
import 'package:wac_fcm_coaching/local_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalHelper.initLocalNotification();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: MyAppScaffold(),
    );
  }
}

class MyAppScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: RaisedButton(onPressed: () {
          LocalHelper.showNotification(4, 'my title', 'message body');
        }),
      ),
    );
  }
}
