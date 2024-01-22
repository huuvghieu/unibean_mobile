import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/landing_screen/landing_screen_bloc.dart';
import '../screens/screens.dart';

class AppRouter {
  static final LandingScreenBloc landingScreenBloc = LandingScreenBloc();
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/landing-screen':
        return MaterialPageRoute(
            builder: (_) => BlocProvider<LandingScreenBloc>.value(
                  value: landingScreenBloc,
                  child: const LandingScreen(),
                ));

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
        return SignUp1Screen.route(register: settings.arguments as bool);

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

      case ProfileTransactionHistoryScreen.routeName:
        return ProfileTransactionHistoryScreen.route();

      case CampaignScreen.routeName:
        return CampaignScreen.route();

      case CampaignListScreen.routeName:
        return CampaignListScreen.route();

      case CampaignDetailScreen.routeName:
        return CampaignDetailScreen.route();

      case BrandDetailScreen.routeName:
        return BrandDetailScreen.route();

      case VoucherScreen.routeName:
        return VoucherScreen.route();

      case FilterVoucherScreen.routeName:
        return FilterVoucherScreen.route();

      case VoucherDetailScreen.routeName:
        return VoucherDetailScreen.route();

      case ChallengeScreen.routeName:
        return ChallengeScreen.route();

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

  void dispose() {
    landingScreenBloc.close();
  }
}
