import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/screens.dart';
import 'package:unibean_app/presentation/screens/student_features/profile/components/pending_card.dart';
import 'package:unibean_app/presentation/screens/student_features/profile/components/rejected_card.dart';
import 'package:unibean_app/presentation/widgets/unverified_screen.dart';
import '../../../../../domain/repositories.dart';
import '../../../../blocs/blocs.dart';
import '../../../store_features/profile/components/name_profile.dart';
import 'button_profile.dart';
import 'unverified_card.dart';
import 'verified_card.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.studentId});
  final String studentId;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;

    return BlocListener<InternetBloc, InternetState>(
      listener: (context, state) {
        if (state is Connected) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              elevation: 0,
              duration: const Duration(milliseconds: 2000),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'Đã kết nối internet',
                message: 'Đã kết nối internet!',
                contentType: ContentType.success,
              ),
            ));
        } else if (state is NotConnected) {
          showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: const Text('Không kết nối Internet'),
                content: Text('Vui lòng kết nối Internet'),
                actions: [
                  TextButton(
                      onPressed: () {
                        final stateInternet =
                            context.read<InternetBloc>().state;
                        if (stateInternet is Connected) {
                          Navigator.pop(context);
                        } else {}
                      },
                      child: const Text('Đồng ý'))
                ],
              );
            },
          );
        }
      },
      child: RefreshIndicator(
          onRefresh: () async {
            context.read<RoleAppBloc>().add(RoleAppStart());
          },
          child: CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                BlocBuilder<RoleAppBloc, RoleAppState>(
                  builder: (context, state) {
                    if (state is Verified) {
                      return Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/background_splash.png'),
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
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          color: klighGreyColor),
                                    ),
                                  ),

                                  //widget information of profile
                                  BlocProvider(
                                    create: (context) => StudentBloc(
                                        studentRepository:
                                            context.read<StudentRepository>())
                                      ..add(LoadStudentById(
                                          studentId: studentId)),
                                    child:
                                        BlocBuilder<StudentBloc, StudentState>(
                                            builder: (context, state) {
                                      if (state is StudentByIdSuccess) {
                                        final stateName =
                                            state.studentMode.state;
                                        if (stateName == 'Pending') {
                                          return PendingCard(
                                            hem: hem,
                                            fem: fem,
                                            ffem: ffem,
                                            studentModel: state.studentMode,
                                          );
                                        } else if (stateName == 'Rejected') {
                                          return RejectedCard(
                                              hem: hem,
                                              fem: fem,
                                              ffem: ffem,
                                              studentModel: state.studentMode);
                                        } else if (stateName == 'Active') {
                                          return VerifiedCard(
                                            hem: hem,
                                            fem: fem,
                                            ffem: ffem,
                                            studentModel: state.studentMode,
                                          );
                                        }
                                      }
                                      return Positioned(
                                        top: 80 * hem,
                                        left: 25 * fem,
                                        child: Container(
                                          width: 324 * fem,
                                          height: 180 * hem,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      15 * fem),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Color(0x0c000000),
                                                    offset: Offset(
                                                        0 * fem, 10 * fem),
                                                    blurRadius: 5 * fem)
                                              ]),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 10 * hem,
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: 15 * fem,
                                                    right: 15 * fem),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    //avatar
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100 * fem),
                                                      child: Container(
                                                        width: 80 * hem,
                                                        height: 80 * fem,
                                                        child: Image.asset(
                                                          'assets/images/ava_signup.png',
                                                          width: 100 * fem,
                                                          height: 100 * hem,
                                                        ),
                                                      ),
                                                    ),

                                                    SizedBox(
                                                      width: 20 * fem,
                                                    ),

                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        //Name
                                                        NameProfile(
                                                          fem: fem,
                                                          ffem: ffem,
                                                          hem: hem,
                                                          name: '',
                                                        ),

                                                        //student code
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 10 * hem,
                                                                  bottom:
                                                                      5 * hem),
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right:
                                                                        5 * fem,
                                                                    left: 5 *
                                                                        fem),
                                                            height: 30 * hem,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                border: Border.all(
                                                                    color: Color(
                                                                        0xfffffe58f)),
                                                                color:
                                                                    kbgYellow),
                                                            child: Center(
                                                              child: Text(
                                                                '',
                                                                style: GoogleFonts.openSans(
                                                                    textStyle: TextStyle(
                                                                        fontSize:
                                                                            13 *
                                                                                ffem,
                                                                        height: 1.3625 *
                                                                            ffem /
                                                                            fem,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color:
                                                                            kYellow)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 280 * fem,
                                                child: Divider(
                                                  thickness: 1 * fem,
                                                  color: const Color.fromARGB(
                                                      255, 225, 223, 223),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: 10 * hem,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    InkWell(
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 5 * fem,
                                                                right: 5 * fem),
                                                        width: 140 * fem,
                                                        height: 40 * hem,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color:
                                                              Colors.grey[100],
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Center(
                                                              child: SvgPicture
                                                                  .asset(
                                                                'assets/icons/qr-unbean-icon.svg',
                                                                colorFilter: ColorFilter.mode(
                                                                    kPrimaryColor,
                                                                    BlendMode
                                                                        .srcIn),
                                                                height:
                                                                    18 * fem,
                                                                width: 18 * fem,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5 * fem,
                                                            ),
                                                            Text(
                                                              'Trang cá nhân',
                                                              style: GoogleFonts.openSans(
                                                                  textStyle: TextStyle(
                                                                      fontSize:
                                                                          12 *
                                                                              fem,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      height: 1.3625 *
                                                                          ffem /
                                                                          fem,
                                                                      color:
                                                                          kPrimaryColor)),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 5 * fem,
                                                                right: 5 * fem),
                                                        width: 140 * fem,
                                                        height: 40 * hem,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color:
                                                              Colors.grey[100],
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Center(
                                                              child: SvgPicture
                                                                  .asset(
                                                                'assets/icons/verifi-icon.svg',
                                                                colorFilter: ColorFilter.mode(
                                                                    kPrimaryColor,
                                                                    BlendMode
                                                                        .srcIn),
                                                                height:
                                                                    25 * fem,
                                                                width: 25 * fem,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5 * fem,
                                                            ),
                                                            Text(
                                                              'Xác minh',
                                                              style: GoogleFonts.openSans(
                                                                  textStyle: TextStyle(
                                                                      fontSize:
                                                                          12 *
                                                                              fem,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      height: 1.3625 *
                                                                          ffem /
                                                                          fem,
                                                                      color:
                                                                          kPrimaryColor)),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  ),

                                  Positioned(
                                      left: 0 * fem,
                                      top: 300 * hem,
                                      child: Container(
                                        // color: Colors.red,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,

                                        child: Column(
                                          children: [
                                            ButtonProfile(
                                              fem: fem,
                                              hem: hem,
                                              ffem: ffem,
                                              widthIcon: 16,
                                              heightIcon: 16,
                                              onPressed: () {
                                                Navigator.pushNamed(context,
                                                    ProductScreen.routeName);
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
                                                    arguments:
                                                        state.studentModel.id);
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
                                                  var id =
                                                      await AuthenLocalDataSource
                                                          .getStudentId();
                                                  Navigator.pushNamed(
                                                      context,
                                                      ProfileOrderScreen
                                                          .routeName,
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
                                                svgIcon:
                                                    'assets/icons/logout-icon.svg',
                                                title: 'Đăng xuất',
                                                onPressed: () =>
                                                    _dialogLogout(context)),
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
                                image: AssetImage(
                                    'assets/images/background_splash.png'),
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
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
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
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,

                                        child: Column(
                                          children: [
                                            ButtonProfile(
                                              fem: fem,
                                              hem: hem,
                                              ffem: ffem,
                                              widthIcon: 16,
                                              heightIcon: 16,
                                              onPressed: () {
                                                Navigator.pushNamed(context,
                                                    UnverifiedScreen.routeName);
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
                                                Navigator.pushNamed(context,
                                                    UnverifiedScreen.routeName);
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
                                                  Navigator.pushNamed(
                                                      context,
                                                      UnverifiedScreen
                                                          .routeName);
                                                }),
                                            SizedBox(
                                              height: 10 * hem,
                                            ),
                                            //button logout
                                            ButtonProfile(
                                                fem: fem,
                                                hem: hem,
                                                ffem: ffem,
                                                svgIcon:
                                                    'assets/icons/logout-icon.svg',
                                                title: 'Đăng xuất',
                                                onPressed: () =>
                                                    _dialogLogout(context)),
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
              ]))
            ],
          )),
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
