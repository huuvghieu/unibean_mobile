import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/screens.dart';
import 'package:unibean_app/presentation/widgets/unverified_screen.dart';
import '../../../../blocs/blocs.dart';
import 'button_profile.dart';
import 'pending_card.dart';
import 'unverified_card.dart';
import 'verified_card.dart';

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
          if (state is Verified) {
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
                          top: 120 * hem,
                          child: Align(
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                color: klighGreyColor),
                          ),
                        ),

                        //widget information of profile
                        VerifiedCard(
                            hem: hem,
                            fem: fem,
                            ffem: ffem,
                            studentModel: state.studentModel),

                        Positioned(
                            left: 0 * fem,
                            top: 300 * hem,
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
                                    title: 'Đổi đậu lấy quà',
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
                                              .routeName,
                                          arguments: state.studentModel.id);
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
                                          'assets/icons/order-history-icon.svg',
                                      title: 'Đơn hàng của bạn',
                                      onPressed: () async {
                                        var id = await AuthenLocalDataSource
                                            .getStudentId();
                                        Navigator.pushNamed(context,
                                            ProfileOrderScreen.routeName,
                                            arguments: id);
                                      }),
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
          } else if (state is Unverified) {
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
                          top: 120 * hem,
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
                            top: 300 * hem,
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
                                          context, UnverifiedScreen.routeName);
                                    },
                                    svgIcon:
                                        'assets/icons/change-bean-icon.svg',
                                    title: 'Đổi đậu lấy quà',
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
                                          context, UnverifiedScreen.routeName);
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
                                          'assets/icons/order-history-icon.svg',
                                      title: 'Đơn hàng của bạn',
                                      onPressed: () async {
                                        Navigator.pushNamed(context,
                                            UnverifiedScreen.routeName);
                                      }),
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
          } else if (state is Pending) {
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
                          top: 120 * hem,
                          child: Align(
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                color: klighGreyColor),
                          ),
                        ),

                        //widget information of profile
                        PendingCard(
                          hem: hem,
                          fem: fem,
                          ffem: ffem,
                          studentModel: state.studentModel,
                        ),

                        Positioned(
                            left: 0 * fem,
                            top: 300 * hem,
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
                                    title: 'Đổi đậu lấy quà',
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
                                              .routeName,
                                          arguments: state.studentModel.id);
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
                                          'assets/icons/order-history-icon.svg',
                                      title: 'Đơn hàng của bạn',
                                      onPressed: () async {
                                        var id = await AuthenLocalDataSource
                                            .getStudentId();
                                        Navigator.pushNamed(context,
                                            ProfileOrderScreen.routeName,
                                            arguments: id);
                                      }),
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
          } else if (state is Rejected) {
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
                          top: 120 * hem,
                          child: Align(
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                color: klighGreyColor),
                          ),
                        ),

                        //widget information of profile
                        PendingCard(
                          hem: hem,
                          fem: fem,
                          ffem: ffem,
                          studentModel: state.studentModel,
                        ),

                        Positioned(
                            left: 0 * fem,
                            top: 300 * hem,
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
                                    title: 'Đổi đậu lấy quà',
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
                                              .routeName,
                                          arguments: state.studentModel.id);
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
                                          'assets/icons/order-history-icon.svg',
                                      title: 'Đơn hàng của bạn',
                                      onPressed: () async {
                                        var id = await AuthenLocalDataSource
                                            .getStudentId();
                                        Navigator.pushNamed(context,
                                            ProfileOrderScreen.routeName,
                                            arguments: id);
                                      }),
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
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      fontSize: 16,
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
                    style: GoogleFonts.openSans(
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

                    Navigator.pushNamedAndRemoveUntil(context,
                        LoginScreen.routeName, (Route<dynamic> route) => false);
                  },
                  child: Text(
                    'Có',
                    style: GoogleFonts.openSans(
                        textStyle:
                            TextStyle(color: Colors.black, fontSize: 15)),
                  )),
            ],
          );
        });
  }
}
