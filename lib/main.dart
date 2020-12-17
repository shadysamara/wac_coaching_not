import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wac_fcm_coaching/appget.dart';
import 'package:wac_fcm_coaching/local_helper.dart';
import 'package:wac_fcm_coaching/fcm.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalHelper.initLocalNotification();
  Fcm.fcm.initFcm();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      home: MyAppScaffold(),
    );
  }
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Scaffold(body: Center(child: Text('Error')));
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyAppScaffold();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Scaffold(body: Center(child: Text('Loading')));
      },
    );
  }
}

class MyAppScaffold extends StatefulWidget {
  @override
  _MyAppScaffoldState createState() => _MyAppScaffoldState();
}

class _MyAppScaffoldState extends State<MyAppScaffold> {
  AppGet appGet = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // appGet.notifiactionPayload.listen((String newValue) {
    //   // showAlertDialoug(newValue, 'notification');
    //   print(newValue);
    // });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: RaisedButton(onPressed: () {
          LocalHelper.showNotification(22, 'my title222', 'message body222');
        }),
      ),
    );
  }
}
