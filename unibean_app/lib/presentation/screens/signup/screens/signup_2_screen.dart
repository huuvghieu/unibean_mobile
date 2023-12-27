import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/screens/signup/components/body_2.dart';
import 'package:unibean_app/presentation/widgets/app_bar_signup.dart';

class SignUp2Screen extends StatelessWidget {
  static const String routeName = '/signup_2';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const SignUp2Screen(),
        settings: const RouteSettings(name: routeName));
  }

  const SignUp2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBarSignUp(
          hem: hem, ffem: ffem, fem: fem,
          text: 'Bước 2/5'),
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: const Body2(),
      ),
    );
  }
}
