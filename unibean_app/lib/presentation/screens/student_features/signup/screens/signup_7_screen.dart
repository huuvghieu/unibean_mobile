import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/components/step_7/body_7.dart';

class SignUp7Screen extends StatelessWidget {
  static const String routeName = '/signup_7';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const SignUp7Screen(),
        settings: const RouteSettings(name: routeName));
  }

  const SignUp7Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // double baseWidth = 375;
    // double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    // double baseHeight = 812;
    // double hem = MediaQuery.of(context).size.height / baseHeight;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        // appBar: AppBar(
        //   toolbarHeight: 120 * hem,
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   centerTitle: true,
        // ),
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: const Body7(),
      ),
    );
  }
}
