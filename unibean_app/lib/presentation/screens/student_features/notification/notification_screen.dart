import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/presentation/screens/screens.dart';
import 'package:unibean_app/presentation/widgets/app_bar_campaign.dart';

class NotificationScreen extends StatefulWidget {
  static const String routeName = '/notification-student';

  static Route route({required dynamic data}) {
    return MaterialPageRoute(
        builder: (_) => NotificationScreen(
              data: data,
            ),
        settings: const RouteSettings(arguments: routeName));
  }

  const NotificationScreen({super.key, required this.data});
  final dynamic data;

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  Map payload = {};
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigateToCampaignDetailScreen();
    });
  }

  void navigateToCampaignDetailScreen() {
    if (widget.data is RemoteMessage) {
      payload = widget.data.data;
    } else if (widget.data is NotificationResponse) {
      payload = jsonDecode(widget.data.payload!);
    }

    if (payload.containsKey('campaignId')) {
      Navigator.of(context).pushNamed(CampaignDetailScreen.routeName,
          arguments: payload['campaignId']);
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double baseHeight = 812;
    double ffem = fem * 0.97;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return Scaffold(
      appBar: AppBarCampaign(hem: hem, ffem: ffem, fem: fem),
      body: Center(
        child: Lottie.asset('assets/animations/loading-screen.json'),
      ),
    );
  }
}
