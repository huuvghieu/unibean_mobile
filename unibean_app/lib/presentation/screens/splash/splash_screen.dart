import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:unibean_app/presentation/screens/screens.dart';


class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const SplashScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;
  var box = Hive.box('myBox');
  var launchApp = false;
  

  @override
  void initState() {
    super.initState();
    checkLaunchApp();
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg-splash.png'),
                fit: BoxFit.cover)),
        child: Center(
            child: AnimatedOpacity(
          opacity: animate ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 1500),
          child: const Image(
            image: AssetImage('assets/images/logo_splash.png'),
          ),
        )));
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      animate = true;
    });
    await Future.delayed(const Duration(milliseconds: 1800));
    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) {
              if (launchApp) {
                return const WelcomeScreen();
              }
              return const OnBoardingScreen();
            },
            transitionDuration: const Duration(seconds: 1),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
          ),
          (Route<dynamic> route) => false);
    }
  }

  void checkLaunchApp() {
    var check = box.get('launchApp');
    if (check == null || check == false) {
      launchApp = false;
      box.put('launchApp', true);
    } else {
      launchApp = true;
    }
  }
}
