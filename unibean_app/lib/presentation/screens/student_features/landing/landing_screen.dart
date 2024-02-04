import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unibean_app/presentation/blocs/landing_screen/landing_screen_bloc.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/student_features/landing/components/cus_nav_bar.dart';
import 'package:unibean_app/presentation/screens/screens.dart';
import 'package:unibean_app/presentation/widgets/app_bar_campaign.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return BlocBuilder<LandingScreenBloc, LandingScreenState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: _buildAppbar(state.tabIndex, hem, fem, ffem),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Container(
              width: 52.5 * fem,
              height: 52.5 * hem,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50 * fem),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 186, 186, 186).withOpacity(0.35),
                    spreadRadius: 8,
                    blurRadius: 8,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              margin: EdgeInsets.only(top: 10 * hem),
              child: FittedBox(
                child: FloatingActionButton(
                  backgroundColor: kPrimaryColor,
                  elevation: 5 * fem,
                  shape: const CircleBorder(),
                  onPressed: () {},
                  child: Container(
                    width: 20 * fem,
                    height: 20 * hem,
                    child: SvgPicture.asset(
                      'assets/icons/qr-unbean-icon.svg',
                    ),
                  ),
                ),
              ),
            ),
            body: bottomNavScreen.elementAt(state.tabIndex),
            extendBody: true,
            bottomNavigationBar: CusNavBar(),
          ),
        );
      },
    );
  }
}

const List<Widget> bottomNavScreen = [
  CampaignScreen(),
  VoucherScreen(),
  ChallengeScreen(),
  ProfileScreen()
];
PreferredSizeWidget? _buildAppbar(
    int tabIndex, double hem, double fem, double ffem) {
  if (tabIndex == 0 || tabIndex == 1) {
    return AppBarCampaign(hem: hem, ffem: ffem, fem: fem);
  }
  return null;
}
