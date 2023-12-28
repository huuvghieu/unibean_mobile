import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/screens/welcome/components/body.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = '/welcome';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const WelcomeScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body:const Body(),
    );
  }
}
