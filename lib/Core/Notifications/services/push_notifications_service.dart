import 'dart:developer';
import 'package:gradution_project/Core/Imports/common_imports.dart';

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
