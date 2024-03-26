import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/components/step_1/body1.dart';

// import 'package:unibean_app/presentation/widgets/app_bar_signup.dart';

class SignUp1Screen extends StatefulWidget {
  static const String routeName = '/signup_1';

  static Route route({required bool register}) {
    return MaterialPageRoute(
        builder: (_) => SignUp1Screen(register: register),
        settings: const RouteSettings(arguments: routeName));
  }

  final bool register;
  static late bool defaultRegister;

  const SignUp1Screen({required this.register, super.key});

  @override
  State<SignUp1Screen> createState() => _SignUp1ScreenState();
}

class _SignUp1ScreenState extends State<SignUp1Screen> {
  late String title;

  @override
  void initState() {
    if (widget.register == true) {
      title = 'Bước 2/9';
      SignUp1Screen.defaultRegister = true;
    } else {
      title = 'Bước 1/8';
      SignUp1Screen.defaultRegister = false;
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
        appBar: AppBar(
          toolbarHeight: 120 * hem,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back)),
          title: Text(
            title,
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
              fontSize: 15 * ffem,
              fontWeight: FontWeight.w900,
              height: 1.3625 * ffem / fem,
              color: kLowTextColor,
            )),
          ),
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: const Body1(),
      ),
    );
  }
}
