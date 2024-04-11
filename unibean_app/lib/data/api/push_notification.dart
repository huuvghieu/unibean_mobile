import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/presentation/screens/screens.dart';

import '../../main.dart';
import '../repositories.dart';

class PushNotification {
  final _firebaseMessing = FirebaseMessaging.instance;
  final _studentRepository = StudentRepositoryImp();

  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    final studentId = await AuthenLocalDataSource.getStudentId();
    if (studentId == null) {
      await _firebaseMessing.requestPermission(
          alert: true,
          announcement: true,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true);
      final _fCMToken = await _firebaseMessing.getToken();
      print('Device token: $_fCMToken');
    } else {
      final wishList = await _studentRepository.fetchWishListByStudentId();
      for (var element in wishList!) {
        _firebaseMessing.subscribeToTopic(element);
      }
      final unWishList = await AuthenLocalDataSource.getUnsubcribeWishListId();
      if (unWishList == null) {
      } else {
        _firebaseMessing.unsubscribeFromTopic(unWishList);
        AuthenLocalDataSource.removeUnsubcribeWishListId();
      }
      await _firebaseMessing.requestPermission(
          alert: true,
          announcement: true,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true);
      final _fCMToken = await _firebaseMessing.getToken();
      print('Device token: $_fCMToken');
    }
  }

  // initalize local notifications
  Future localNotiInit() async {
    final studentId = await AuthenLocalDataSource.getStudentId();
    if (studentId == null) {
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/logo_splash');
      final DarwinInitializationSettings initializationSettingsDarwin =
          DarwinInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) => null,
      );
      final LinuxInitializationSettings initializationSettingsLinux =
          LinuxInitializationSettings(defaultActionName: 'Open notification');
      final InitializationSettings initializationSettings =
          InitializationSettings(
              android: initializationSettingsAndroid,
              iOS: initializationSettingsDarwin,
              linux: initializationSettingsLinux);
      _flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onDidReceiveNotificationResponse: onNotificationTap,
          onDidReceiveBackgroundNotificationResponse: onNotificationTap);
    } else {
      final wishList = await _studentRepository.fetchWishListByStudentId();
      for (var element in wishList!) {
        _firebaseMessing.subscribeToTopic(element);
      }
      final unWishList = await AuthenLocalDataSource.getUnsubcribeWishListId();
      if (unWishList == null) {
      } else {
        _firebaseMessing.unsubscribeFromTopic(unWishList);
        AuthenLocalDataSource.removeUnsubcribeWishListId();
      }
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/logo_splash');
      final DarwinInitializationSettings initializationSettingsDarwin =
          DarwinInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) => null,
      );
      final LinuxInitializationSettings initializationSettingsLinux =
          LinuxInitializationSettings(defaultActionName: 'Open notification');
      final InitializationSettings initializationSettings =
          InitializationSettings(
              android: initializationSettingsAndroid,
              iOS: initializationSettingsDarwin,
              linux: initializationSettingsLinux);
      _flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onDidReceiveNotificationResponse: onNotificationTap,
          onDidReceiveBackgroundNotificationResponse: onNotificationTap);
    }
  }

  // on tap local notification in foreground
  static void onNotificationTap(NotificationResponse notificationResponse) {
    navigatorKey.currentState!.pushNamed(NotificationScreen.routeName,
        arguments: notificationResponse);
  }

  // show a simple notification
  static Future showSimpleNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: payload);
  }
}
