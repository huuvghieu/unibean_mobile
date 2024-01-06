import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unibean_app/presentation/blocs/landing_screen/landing_screen_bloc.dart';
import 'package:unibean_app/presentation/constants.dart';
import 'package:unibean_app/presentation/screens/landing/components/cus_nav_bar.dart';
import 'package:unibean_app/presentation/screens/screens.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return BlocBuilder<LandingScreenBloc, LandingScreenState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
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
            extendBody: true,
            body: bottomNavScreen.elementAt(state.tabIndex),
            bottomNavigationBar: CusNavBar(),
          ),
        );
      },
    );
  }
}

const List<Widget> bottomNavScreen = [
  Text('Index 0: Chiến Dịch'),
  Text('Index 1: Kho Voucher'),
  Text('Index 2: Thành Tựu'),
  ProfileScreen()
];
