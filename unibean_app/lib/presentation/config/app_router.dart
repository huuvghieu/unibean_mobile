import 'package:flutter/material.dart';
import 'package:unibean_app/data/models.dart';
import '../screens/screens.dart';

class AppRouter {
  // static final LandingScreenBloc landingScreenBloc = LandingScreenBloc();
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/landing-screen':
        return MaterialPageRoute(
          builder: (_) => const LandingScreen(),
        );

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
        return SignUp7Screen.route(phoneNumber: settings.arguments as String);

      case SignUp8Screen.routeName:
        return SignUp8Screen.route();

      case ProfileTransactionHistoryScreen.routeName:
        return ProfileTransactionHistoryScreen.route(
            studentId: settings.arguments as String);

      case ProfileVoucherScreen.routeName:
        return ProfileVoucherScreen.route(id: settings.arguments as String);

      case ProductScreen.routeName:
        return ProductScreen.route();

      case ProductDetailScreen.routeName:
        return ProductDetailScreen.route(id: settings.arguments as String);

      case ProfileOrderScreen.routeName:
        return ProfileOrderScreen.route(id: settings.arguments as String);

      case CampaignScreen.routeName:
        return CampaignScreen.route();

      case CampaignListScreen.routeName:
        return CampaignListScreen.route();

      case CampaignDetailScreen.routeName:
        return CampaignDetailScreen.route(id: settings.arguments as String);

      case CampaignVoucherScreen.routeName:
        List<dynamic> args = settings.arguments as List<dynamic>;

        return CampaignVoucherScreen.route(
            campaignDetail: args[0], campaignVoucher: args[1]);

      case BrandDetailScreen.routeName:
        return BrandDetailScreen.route(id: settings.arguments as String);

      case BrandListScreen.routeName:
        return BrandListScreen.route();

      case VoucherScreen.routeName:
        return VoucherScreen.route();

      case VoucherListScreen.routeName:
        return VoucherListScreen.route(
            voucherModels: settings.arguments as List<VoucherModel>);

      case RedeemVoucherScreen.routeName:
        List<dynamic> args = settings.arguments as List<dynamic>;

        return RedeemVoucherScreen.route(
            campignId: args[0],
            campaignDetailId: args[1],
            studentId: args[2],
            quantity: args[3],
            description: args[4],
            campaignName: args[5],
            total: args[6],
            voucherName: args[7],
            priceVoucher: args[8]);

      case SuccessRedeemVoucherScreen.routeName:
        List<dynamic> args = settings.arguments as List<dynamic>;

        return SuccessRedeemVoucherScreen.route(
            voucherName: args[0], total: args[1]);

      case QRScreen.routeName:
        return QRScreen.route(id: settings.arguments as String);

      case QRVoucherScreen.routeName:
        return QRVoucherScreen.route(id: settings.arguments as String);

      case FilterVoucherScreen.routeName:
        return FilterVoucherScreen.route();

      case VoucherDetailScreen.routeName:
        return VoucherDetailScreen.route(id: settings.arguments as String);

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

  // void dispose() {
  //   landingScreenBloc.close();
  // }
}
