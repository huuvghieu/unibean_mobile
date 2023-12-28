import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/screens/signup/components/body1.dart';
import 'package:unibean_app/presentation/widgets/app_bar_signup.dart';

class SignUp1Screen extends StatefulWidget {
  static const String routeName = '/signup_1';
  static Route route({required int step}) {
    return MaterialPageRoute(
        builder: (_) => SignUp1Screen(
              step: step,
            ),
        settings: const RouteSettings(name: routeName));
  }

  final int step;
  static late int defaultStep;
  const SignUp1Screen({required this.step, super.key});

  @override
  State<SignUp1Screen> createState() => _SignUp1ScreenState();
}

class _SignUp1ScreenState extends State<SignUp1Screen> {
  late String title;

  @override
  void initState() {
    if (widget.step == 7) {
      title = 'Bước 2/7';
      SignUp1Screen.defaultStep = 7;
    } else {
      title = 'Bước 1/6';
      SignUp1Screen.defaultStep = 6;
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
        body: const Body1(),
      ),
    );
  }
}
