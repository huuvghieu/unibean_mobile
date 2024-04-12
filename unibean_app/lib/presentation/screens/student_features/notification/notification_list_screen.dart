import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';

import '../../../blocs/blocs.dart';
import '../../screens.dart';

class NotificationListScreen extends StatelessWidget {
  static const String routeName = '/notification-list-student';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => NotificationListScreen(),
        settings: const RouteSettings(arguments: routeName));
  }

  const NotificationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double baseHeight = 812;
    double ffem = fem * 0.97;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return SafeArea(
      child: Scaffold(
          backgroundColor: klighGreyColor,
          appBar: AppBar(
            elevation: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background_splash.png'),
                      fit: BoxFit.cover)),
            ),
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 25 * fem,
              ),
            ),
            toolbarHeight: 50 * hem,
            centerTitle: true,
            title: Text(
              'Thông báo',
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      fontSize: 18 * ffem,
                      fontWeight: FontWeight.w900,
                      color: Colors.white)),
            ),
            // actions: [
            //   Padding(
            //     padding: EdgeInsets.only(top: 10),
            //     child: Text(
            //     'Xóa tất cả',
            //     style: GoogleFonts.openSans(
            //         textStyle: TextStyle(
            //             fontSize: 12 * ffem,
            //             fontWeight: FontWeight.normal,
            //             color: Colors.white)),
            //                 ),
            //   ),
            // ],
          ),
          body: CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                BlocBuilder<NotificationBloc, NotificationState>(
                  builder: (context, state) {
                    if (state is NotificationLoading) {
                      return buildNotificationShimmer(3, fem, hem);
                    } else if (state is NotificationLoaded) {
                      if (state.notifications.isEmpty) {
                        return Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(
                              left: 15 * fem, right: 15 * fem, top: 20),
                          height: 220 * hem,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.notifications,
                                color: kPrimaryColor,
                                size: 50 * fem,
                              ),
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Không có thông báo mới',
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        final notifications = state.notifications;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: notifications.length,
                                itemBuilder: (context, index) {
                                  var notification = notifications[index];
                                  return GestureDetector(
                                    onTap: () async {},
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: 15 * hem,
                                          left: 10 * fem,
                                          right: 10 * fem),
                                      constraints: BoxConstraints(
                                          maxHeight: 120 * hem,
                                          minWidth: 340 * fem),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15 * fem),
                                          color: Colors.white,
                                          border:
                                              Border.all(color: klighGreyColor),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color(0x0c000000),
                                                offset:
                                                    Offset(0 * fem, 0 * fem),
                                                blurRadius: 5 * fem)
                                          ]),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(5),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Container(
                                                width: 100 * fem,
                                                height: 80 * hem,
                                                child: Image.asset(
                                                  'assets/images/bean_logo.jpg',
                                                  fit: BoxFit.fill,
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return Icon(
                                                      Icons.error_outlined,
                                                      size: 50 * fem,
                                                      color: kPrimaryColor,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8 * fem,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 200 * fem,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 5 * hem,
                                                      bottom: 5 * hem),
                                                  child: Text(
                                                      notification.title,
                                                      softWrap: true,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style:
                                                          GoogleFonts.openSans(
                                                              textStyle:
                                                                  TextStyle(
                                                        fontSize: 15 * ffem,
                                                        color: kPrimaryColor,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ))),
                                                ),
                                              ),
                                              Container(
                                                width: 200 * fem,
                                                child: Text(notification.body,
                                                    softWrap: true,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.openSans(
                                                        textStyle: TextStyle(
                                                      fontSize: 15 * ffem,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ))),
                                              ),
                                              SizedBox(
                                                height: 5 * hem,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      }
                    }
                    return buildVoucherStudentShimmer(3, fem, hem);
                  },
                ),
              ]))
            ],
          )),
    );
  }
}

Widget buildNotificationShimmer(count, double fem, double hem) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        width: 170 * fem,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15 * fem),
          color: Colors.white,
        ),
      ),
      Container(
        width: 170 * fem,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15 * fem),
          color: Colors.white,
        ),
      )
    ],
  );
}
