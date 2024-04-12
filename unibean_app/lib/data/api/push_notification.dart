import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/data/models.dart';
import 'package:unibean_app/presentation/blocs/notification/notification_bloc.dart';
import 'package:unibean_app/presentation/screens/screens.dart';
import 'package:http/http.dart' as http;
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

  static Future<String> _base64encodedImage(String url) async {
    final http.Response response = await http.get(Uri.parse(url));
    final String base64Data = base64Encode(response.bodyBytes);
    return base64Data;
  }

  // show a simple notification
  static Future showSimpleNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    final String largeIcon =
        await _base64encodedImage('https://dummyimage.com/48x48');
    final String bigPicture =
        await _base64encodedImage('https://dummyimage.com/400x800');
    final BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(
            ByteArrayAndroidBitmap.fromBase64String(
                bigPicture), //Base64AndroidBitmap(bigPicture),
            largeIcon: ByteArrayAndroidBitmap.fromBase64String(largeIcon),
            contentTitle: title,
            htmlFormatContentTitle: true,
            summaryText: body,
            htmlFormatSummaryText: true);

    final AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            styleInformation: bigPictureStyleInformation,
            ticker: 'ticker');
    final NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: payload);
    notificationBloc.add(AddNewNotification(
        notificationModel:
            NotificationModel(title: title, body: body, payload: payload)));
  }
}
