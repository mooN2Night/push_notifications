import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<String?> getToken() async {
    return _firebaseMessaging.getToken();
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();

    String? fCNToken = await _firebaseMessaging.getToken();
    print(fCNToken);

    // _firebaseMessaging.getToken().then((token) =>
    //     print(token ?? 'nety tokena'));
  }
}