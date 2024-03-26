import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/components/step_7/body_7.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/screens/signup_1_screen.dart';
import 'package:unibean_app/presentation/widgets/app_bar_signup.dart';

class SignUp7Screen extends StatefulWidget {
  static const String routeName = '/signup_7';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => SignUp7Screen(),
        settings: const RouteSettings(name: routeName));
  }

  const SignUp7Screen({super.key});

  @override
  State<SignUp7Screen> createState() => _SignUp7ScreenState();
}

class _SignUp7ScreenState extends State<SignUp7Screen> {
  late String title;

  @override
  void initState() {
    if (SignUp1Screen.defaultRegister == true) {
      title = 'Bước 7/9';
    } else {
      title = 'Bước 7/8';
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
        appBar: AppBarSignUp(hem: hem, ffem: ffem, fem: fem, text: title),
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: Body7(),
      ),
    );
  }
}
