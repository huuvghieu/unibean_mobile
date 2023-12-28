import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/screens/login/login_screen.dart';
import 'package:unibean_app/presentation/screens/signup/screens/signup_2_screen.dart';
import 'package:unibean_app/presentation/screens/signup/screens/signup_3_screen.dart';
import 'package:unibean_app/presentation/screens/signup/screens/signup_4_screen.dart';
import 'package:unibean_app/presentation/screens/signup/screens/signup_5_screen.dart';
import 'package:unibean_app/presentation/screens/signup/screens/signup_6_screen.dart';
import 'package:unibean_app/presentation/screens/signup/screens/signup_7_screen.dart';
import 'package:unibean_app/presentation/screens/signup/screens/signup_1_screen.dart';
import 'package:unibean_app/presentation/screens/signup/screens/signup_screen.dart';
import 'package:unibean_app/presentation/screens/splash/onboarding_screen.dart';
import 'package:unibean_app/presentation/screens/splash/splash_screen.dart';
import 'package:unibean_app/presentation/screens/welcome/welcome_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return SplashScreen.route();

      case OnBoardingScreen.routeName:
        return OnBoardingScreen.route();

      case WelcomeScreen.routeName:
        return WelcomeScreen.route();

      case LoginScreen.routeName:
        return LoginScreen.route();

      case SignUpScreen.routeName:
        return SignUpScreen.route();

      case SignUp1Screen.routeName:
        return SignUp1Screen.route(step: settings.arguments as int);

      case SignUp2Screen.routeName:
        return SignUp2Screen.route();

      case SignUp3Screen.routeName:
        return SignUp3Screen.route();

      case SignUp4Screen.routeName:
        return SignUp4Screen.route();

      case SignUp5Screen.routeName:
        return SignUp5Screen.route();        

      case SignUp6Screen.routeName:
        return SignUp6Screen.route();

      case SignUp7Screen.routeName:
        return SignUp7Screen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('Error'),
              ),
            ),
        settings: const RouteSettings(name: '/'));
  }
}
