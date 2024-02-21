import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/components/step/body.dart';
import 'package:unibean_app/presentation/widgets/app_bar_signup.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = '/signup';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const SignUpScreen(),
        settings: const RouteSettings(arguments: SignUpScreen.routeName));
  }

  const SignUpScreen({super.key});

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
        appBar: AppBarSignUp(hem: hem, ffem: ffem, fem: fem, text: 'Bước 1/7'),
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: const Body(),
      ),
    );
  }
}
