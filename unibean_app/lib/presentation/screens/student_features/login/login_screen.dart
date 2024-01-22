import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/screens/student_features/login/components/body.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  // static Route route() {
  //   return MaterialPageRoute(
  //     builder: (_) => const LoginScreen(),
  //     settings: const RouteSettings(name: routeName),
  //   );
  // }
  static Route route() {
    return PageRouteBuilder(
        pageBuilder: (_, __, ___) => LoginScreen(),
        transitionDuration: Duration(seconds: 1),
        transitionsBuilder: (_, a, __, c) {
          const begin = Offset(-1.0, 0.0);
          const end = Offset.zero;
          var tween = Tween(begin: begin, end: end);
          var offsetAnimation = a.drive(tween);

          return SlideTransition(position: offsetAnimation, child: c);
        },
        settings: const RouteSettings(name: routeName));
  }

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: const Body(),
      ),
    );
  }
}
