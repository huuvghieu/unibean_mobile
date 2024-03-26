import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/components/step_8/body_8.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/screens/signup_1_screen.dart';
import 'package:unibean_app/presentation/widgets/app_bar_signup.dart';

class SignUp8Screen extends StatefulWidget {
  static const String routeName = '/signup_8';

  final String phoneNumber;
  static Route route({required String phoneNumber}) {
    return MaterialPageRoute(
        builder: (_) => SignUp8Screen(phoneNumber: phoneNumber),
        settings: const RouteSettings(name: routeName));
  }

  const SignUp8Screen({super.key, required this.phoneNumber});

  @override
  State<SignUp8Screen> createState() => _SignUp8ScreenState();
}

class _SignUp8ScreenState extends State<SignUp8Screen> {
  late String title;

  @override
  void initState() {
    if (SignUp1Screen.defaultRegister == true) {
      title = 'Bước 8/9';
    } else {
      title = 'Bước 8/8';
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
        body: Body8(phoneNumber: widget.phoneNumber),
      ),
    );
  }
}
