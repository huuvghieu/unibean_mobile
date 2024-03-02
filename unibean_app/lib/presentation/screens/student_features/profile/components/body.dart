import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/student_features/profile/components/button_profile.dart';
import 'package:unibean_app/presentation/screens/student_features/profile/components/information_card_profile.dart';
import 'package:unibean_app/presentation/screens/student_features/profile/components/unverified_card.dart';
import 'package:unibean_app/presentation/screens/student_features/profile_products/product_screen.dart';
import 'package:unibean_app/presentation/screens/student_features/profile_trans/profile_trans_screen.dart';
import 'package:unibean_app/presentation/screens/student_features/profile_voucher/profile_voucher_screen.dart';
import 'package:unibean_app/presentation/widgets/card_for_unverified.dart';

import '../../../../blocs/blocs.dart';

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
      physics: NeverScrollableScrollPhysics(),
      child: BlocBuilder<RoleAppBloc, RoleAppState>(
        builder: (context, state) {
          if (state is RoleAppStudentVerified) {
            return Container(
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
                                color: klighGreyColor),
                          ),
                        ),

                        //widget information of profile
                        InformationCardProfile(
                          hem: hem,
                          fem: fem,
                          ffem: ffem,
                          studentModel: state.studentModel,
                        ),

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
                                    widthIcon: 16,
                                    heightIcon: 16,
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, ProductScreen.routeName);
                                    },
                                    svgIcon:
                                        'assets/icons/change-bean-icon.svg',
                                    title: 'Đổi bean lấy quà',
                                  ),
                                  SizedBox(
                                    height: 10 * hem,
                                  ),
                                  ButtonProfile(
                                    fem: fem,
                                    hem: hem,
                                    ffem: ffem,
                                    widthIcon: 20,
                                    heightIcon: 20,
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context,
                                          ProfileTransactionHistoryScreen
                                              .routeName);
                                    },
                                    svgIcon:
                                        'assets/icons/transaction-icon.svg',
                                    title: 'Lịch sử giao dịch',
                                  ),
                                  SizedBox(
                                    height: 10 * hem,
                                  ),
                                  ButtonProfile(
                                      fem: fem,
                                      hem: hem,
                                      ffem: ffem,
                                      svgIcon:
                                          'assets/icons/voucher-navbar-icon.svg',
                                      title: 'Ưu đãi của bạn',
                                      onPressed: () {
                                        Navigator.pushNamed(context,
                                            ProfileVoucherScreen.routeName);
                                      }),
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
                                  //button logout
                                  ButtonProfile(
                                      fem: fem,
                                      hem: hem,
                                      ffem: ffem,
                                      svgIcon: 'assets/icons/logout-icon.svg',
                                      title: 'Đăng xuất',
                                      onPressed: () => _dialogLogout(context)),
                                ],
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            );
          } else if (state is RoleAppStudentUnverified) {
            return Container(
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
                                color: klighGreyColor),
                          ),
                        ),

                        //widget information of profile
                        UnverifiedCard(
                            hem: hem,
                            fem: fem,
                            ffem: ffem,
                            authenModel: state.authenModel),

                        Positioned(
                            left: 0 * fem,
                            top: 350 * hem,
                            child: Container(
                              // color: Colors.red,
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,

                              child: Column(
                                children: [
                                  CardForUnVerified(
                                      fem: fem, hem: hem, ffem: ffem),

                                  SizedBox(
                                    height: 20 * hem,
                                  ),
                                  //button logout
                                  ButtonProfile(
                                      fem: fem,
                                      hem: hem,
                                      ffem: ffem,
                                      svgIcon: 'assets/icons/logout-icon.svg',
                                      title: 'Đăng xuất',
                                      onPressed: () => _dialogLogout(context)),
                                ],
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Future<void> _dialogLogout(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Bạn có muốn đăng xuất không?',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                      fontSize: 17,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w700)),
            ),
            actionsAlignment: MainAxisAlignment.spaceBetween,
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Không',
                    style: GoogleFonts.nunito(
                        textStyle:
                            TextStyle(color: Colors.black, fontSize: 15)),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    context.read<RoleAppBloc>().add(RoleAppEnd());
                    context
                        .read<LandingScreenBloc>()
                        .add(TabChange(tabIndex: 0));
                  },
                  child: Text(
                    'Có',
                    style: GoogleFonts.nunito(
                        textStyle:
                            TextStyle(color: Colors.black, fontSize: 15)),
                  )),
            ],
          );
        });
  }
}
