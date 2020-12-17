import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppGet {
  var notifiactionPayload = ''.obs;
  addNotificationPayload(String payload) {
    this.notifiactionPayload.value = payload;

    // showAlertDialoug(String message, String header) {
    //   Get.defaultDialog(
    //       title: header,
    //       content: Text(message),
    //       confirm: RaisedButton(
    //           child: Text('ok'),
    //           onPressed: () {
    //             Get.back();
    //           }));
    // }
  }
}
