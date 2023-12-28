import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/screens/signup/components/body_4.dart';
import 'package:unibean_app/presentation/screens/signup/screens/signup_1_screen.dart';
import 'package:unibean_app/presentation/widgets/app_bar_signup.dart';

class SignUp4Screen extends StatefulWidget {
  static const String routeName = '/signup_4';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const SignUp4Screen(),
        settings: const RouteSettings(name: routeName));
  }

  const SignUp4Screen({super.key});

  @override
  State<SignUp4Screen> createState() => _SignUp4ScreenState();
}

class _SignUp4ScreenState extends State<SignUp4Screen> {
  late String title;

  @override
  void initState() {
    if (SignUp1Screen.defaultStep == 7) {
      title = 'Bước 5/7';
    } else {
      title = 'Bước 4/6';
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
        body: Body4(),
      ),
    );
  }
}
