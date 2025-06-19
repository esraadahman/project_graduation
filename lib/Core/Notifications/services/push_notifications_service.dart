import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hive/hive.dart';

import 'package:gradution_project/Core/api/endPointes.dart';
import 'package:gradution_project/Core/hive_constants/hive_constants.dart';

class PushNotificationsService {
  static final Box box = Hive.box(HiveConstants.Boxname);
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static Future init() async {
    await messaging.requestPermission();
    String? dToken = await messaging.getToken();
    await box.put(ApiKey.d_token, dToken);
    // print notification token on terminal
    log(dToken ?? "null");

    // for background notification  , take a function as prameter
    FirebaseMessaging.onBackgroundMessage(handelBackGroundMessage);
  }

  static Future<void> handelBackGroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    log(message.notification?.title ?? "null title");
  }
}
