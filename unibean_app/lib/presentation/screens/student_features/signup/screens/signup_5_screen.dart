import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/components/step_5/body_5.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/screens/signup_1_screen.dart';
import 'package:unibean_app/presentation/widgets/app_bar_signup.dart';

class SignUp5Screen extends StatefulWidget {
  static const String routeName = '/signup_5';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const SignUp5Screen(),
        settings: const RouteSettings(name: routeName));
  }

  const SignUp5Screen({super.key});

  @override
  State<SignUp5Screen> createState() => _SignUp5ScreenState();
}

class _SignUp5ScreenState extends State<SignUp5Screen> {
  late String title;

  @override
  void initState() {
    if (SignUp1Screen.defaultRegister == true) {
      title = 'Bước 6/7';
    } else {
      title = 'Bước 5/6';
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
        body: Body5(),
      ),
    );
  }
}
