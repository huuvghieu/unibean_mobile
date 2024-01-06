import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/screens/profile/components/button_profile.dart';
import 'package:unibean_app/presentation/screens/profile/components/information_card_profile.dart';
import 'package:unibean_app/presentation/screens/profile_trans/profile_trans_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;

    return SingleChildScrollView(
      child: Container(
        // color: Colors.black,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background_splash.png'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  //background body
                  Positioned(
                    left: 0 * fem,
                    top: 180 * hem,
                    child: Align(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Color(0xfff8f6fb)),
                    ),
                  ),

                  //widget information of profile
                  InformationCardProfile(hem: hem, fem: fem, ffem: ffem),

                  Positioned(
                      left: 0 * fem,
                      top: 350 * hem,
                      child: Container(
                        // color: Colors.red,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,

                        child: Column(
                          children: [
                            ButtonProfile(
                              fem: fem,
                              hem: hem,
                              ffem: ffem,
                              widthIcon: 20,
                              heightIcon: 20,
                              onPressed: () {
                                Navigator.pushNamed(context,
                                    ProfileTransactionHistoryScreen.routeName);
                              },
                              svgIcon: 'assets/icons/transaction-icon.svg',
                              title: 'Lịch sử giao dịch',
                            ),
                            SizedBox(
                              height: 10 * hem,
                            ),
                            ButtonProfile(
                                fem: fem,
                                hem: hem,
                                ffem: ffem,
                                svgIcon: 'assets/icons/voucher-navbar-icon.svg',
                                title: 'Uni Student Bean',
                                onPressed: () {}),
                            SizedBox(
                              height: 10 * hem,
                            ),
                            ButtonProfile(
                                fem: fem,
                                hem: hem,
                                ffem: ffem,
                                svgIcon:
                                    'assets/icons/update-information-icon.svg',
                                title: 'Cập nhật thông tin',
                                onPressed: () {}),
                            SizedBox(
                              height: 10 * hem,
                            ),
                            ButtonProfile(
                                fem: fem,
                                hem: hem,
                                ffem: ffem,
                                svgIcon: 'assets/icons/logout-icon.svg',
                                title: 'Đăng xuất',
                                onPressed: () {}),
                          ],
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
