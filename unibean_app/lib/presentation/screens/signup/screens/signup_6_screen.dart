import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/screens/signup/components/body_6.dart';
import 'package:unibean_app/presentation/screens/signup/screens/signup_1_screen.dart';
import 'package:unibean_app/presentation/widgets/app_bar_signup.dart';

class SignUp6Screen extends StatefulWidget {
  static const String routeName = '/signup_6';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const SignUp6Screen(),
        settings: const RouteSettings(name: routeName));
  }

  const SignUp6Screen({super.key});

  @override
  State<SignUp6Screen> createState() => _SignUp6ScreenState();
}

class _SignUp6ScreenState extends State<SignUp6Screen> {
  late String title;

  @override
  void initState() {
    if (SignUp1Screen.defaultStep == 7) {
      title = 'Bước 7/7';
    } else {
      title = 'Bước 6/6';
    }
    super.initState();
  }  
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
          text: title),
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: const Body6(),
      ),
    );
  }
}
