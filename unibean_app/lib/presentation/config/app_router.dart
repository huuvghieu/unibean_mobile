import 'package:flutter/material.dart';
import 'package:unibean_app/data/models.dart';
import 'package:unibean_app/presentation/widgets/unverified_screen.dart';
import '../screens/screens.dart';
import '../screens/store_features/landing_screen/landing_store_screen.dart';

class AppRouter {
  // static final LandingScreenBloc landingScreenBloc = LandingScreenBloc();
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/landing-screen':
        return MaterialPageRoute(
          builder: (_) => const LandingScreen(),
        );

      case '/landing-screen-store':
        return MaterialPageRoute(
          builder: (_) => const LandingStoreScreen(),
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
        return SignUp7Screen.route();

      case SignUp8Screen.routeName:
        return SignUp8Screen.route(phoneNumber: settings.arguments as String);

      case SignUp9Screen.routeName:
        return SignUp9Screen.route();

      case UnverifiedScreen.routeName:
        return UnverifiedScreen.route();

      case ProfileTransactionHistoryScreen.routeName:
        return ProfileTransactionHistoryScreen.route(
            studentId: settings.arguments as String);

      case ProfileVoucherScreen.routeName:
        return ProfileVoucherScreen.route(id: settings.arguments as String);

      case ProfileUpdateDetailStoreScreen.routeName:
        return ProfileUpdateDetailStoreScreen.route(
            storeModel: settings.arguments as StoreModel);

      case ProductScreen.routeName:
        return ProductScreen.route();

      case ProductListScreen.routeName:
        return ProductListScreen.route(search: settings.arguments as String);

      case ProductDetailScreen.routeName:
        return ProductDetailScreen.route(id: settings.arguments as String);

      case ProductConfirmScreen.routeName:
        return ProductConfirmScreen.route(
            stationModel: settings.arguments as StationModel);

      case ProfileOrderScreen.routeName:
        return ProfileOrderScreen.route(id: settings.arguments as String);

      case OrderDetailScreen.routeName:
        List<dynamic> args = settings.arguments as List<dynamic>;
        return OrderDetailScreen.route(orderId: args[0], studentId: args[1]);

      case ProfileDetailScreen.routeName:
        return ProfileDetailScreen.route(
            studentModel: settings.arguments as StudentModel);

      case ProfileUpdateDetailScreen.routeName:
        return ProfileUpdateDetailScreen.route(
            studentModel: settings.arguments as StudentModel);

      case ProfileVerificationScreen.routeName:
        return ProfileVerificationScreen.route(
            studentModel: settings.arguments as StudentModel);

      case ProfileCartScreen.routeName:
        List<dynamic> args = settings.arguments as List<dynamic>;
        return ProfileCartScreen.route(
            studentId: args[0], fromProductDetail: args[1]);

      case UpdateVerificationScreen.routeName:
        return UpdateVerificationScreen.route(
            studentModel: settings.arguments as StudentModel);

      case CampaignScreen.routeName:
        return CampaignScreen.route();

      case CampaignListScreen.routeName:
        return CampaignListScreen.route();

      case CampaignDetailScreen.routeName:
        return CampaignDetailScreen.route(
            campaignId: settings.arguments as String);

      case CampaignVoucherScreen.routeName:
        List<dynamic> args = settings.arguments as List<dynamic>;

        return CampaignVoucherScreen.route(
            campaignDetail: args[0],
            campaignVoucher: args[1],
            studentId: args[2]);

      case CampaignVoucherDetailScreen.routeName:
        List<dynamic> args = settings.arguments as List<dynamic>;
        return CampaignVoucherDetailScreen.route(
            storeId: args[0], campaignVoucherId: args[1]);

      case CampaignVoucherListScreen.routeName:
        return CampaignVoucherListScreen.route(
            search: settings.arguments as String);

      case BrandDetailScreen.routeName:
        return BrandDetailScreen.route(id: settings.arguments as String);

      case BrandListScreen.routeName:
        return BrandListScreen.route();

      case BrandDetailStoreScreen.routeName:
        return BrandDetailStoreScreen.route(id: settings.arguments as String);

      case VoucherScreen.routeName:
        return VoucherScreen.route();

      case VoucherListScreen.routeName:
        List<dynamic> args = settings.arguments as List<dynamic>;
        return VoucherListScreen.route(search: args[0], studentId: args[1]);

      case VoucherItemDetailScreen.routeName:
        return VoucherItemDetailScreen.route(
            voucherStudent: settings.arguments as VoucherStudentModel);

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

      case SuccessScanVoucherScreen.routeName:
        return SuccessScanVoucherScreen.route(
            success: settings.arguments as String);

      case SuccessCreateOrderScreen.routeName:
        return SuccessCreateOrderScreen.route(
            orderModel: settings.arguments as OrderModel);

      case SuccessTransactScreen.routeName:
        return SuccessTransactScreen.route(
            transactResultModel: settings.arguments as TransactResultModel);

      case FailedScanVoucherScreen.routeName:
        return FailedScanVoucherScreen.route(
            failed: settings.arguments as String);

      case FailedScanStudentScreen.routeName:
        return FailedScanStudentScreen.route(
            failed: settings.arguments as String);

      case QRScreen.routeName:
        return QRScreen.route(id: settings.arguments as String);

      case NotificationScreen.routeName:
        return NotificationScreen.route(data: settings.arguments);

      case QRVoucherScreen.routeName:
        return QRVoucherScreen.route(id: settings.arguments as String);

      case QrViewScreen.routeName:
        return QrViewScreen.route(storeId: settings.arguments as String);

      case FilterVoucherScreen.routeName:
        return FilterVoucherScreen.route();

      case VoucherDetailScreen.routeName:
        return VoucherDetailScreen.route(id: settings.arguments as String);

      case ChallengeScreen.routeName:
        return ChallengeScreen.route();

      case StationScreen.routeName:
        return StationScreen.route();

      case StoreListScreen.routeName:
        List<dynamic> args = settings.arguments as List<dynamic>;
        return StoreListScreen.route(
            brandId: args[0], campaignDetailModel: args[1]);

      case WishListScreen.routeName:
        return WishListScreen.route();

      case NotificationListScreen.routeName:
        return NotificationListScreen.route();

      //Store
      case TransactionStoreScreen.routeName:
        return TransactionStoreScreen.route();

      case TransactScreen.routeName:
        List<dynamic> args = settings.arguments as List<dynamic>;
        return TransactScreen.route(studentModel: args[0], brandId: args[1]);

      case CampaignVoucherInformationScreen.routeName:
        return CampaignVoucherInformationScreen.route(
            campaginVoucherInformation:
                settings.arguments as CampaignVoucherInformationModel);

      case BonusScreen.routeName:
        return BonusScreen.route(storeModel: settings.arguments as StoreModel);

      case BonusDetailScreen.routeName:
        return BonusDetailScreen.route(bonusId: settings.arguments as String);

      case CampaignDetailStoreScreen.routeName:
        return CampaignDetailStoreScreen.route(
            campaignId: settings.arguments as String);
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
