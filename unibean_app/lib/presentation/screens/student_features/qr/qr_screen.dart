import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:unibean_app/presentation/config/constants.dart';

class QRScreen extends StatelessWidget {
  static const String routeName = '/qr-student';

  static Route route({required String id}) {
    return MaterialPageRoute(
      builder: (_) => QRScreen(
        id: id,
      ),
      settings: const RouteSettings(name: routeName),
    );
  }

  const QRScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    // final roleState = context.watch<RoleAppBloc>().state;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 160 * hem,
            leadingWidth: 500*fem,
            leading: Container(
            margin: EdgeInsets.only(left: 20 * fem),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50 * hem,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 35 * fem,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10 * fem, left: 75*fem),
                  child: Text(
                    'MÃ QR CỦA BẠN',
                    style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                            fontSize: 22 * ffem,
                            fontWeight: FontWeight.w900,
                            height: 1.3625 * ffem / fem,
                            color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
          ),
          extendBodyBehindAppBar: true,
          extendBody: true,
          body: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background_splash.png'),
                    fit: BoxFit.cover)),
            child: Center(
              child: Container(
                color: kbgWhiteColor,
                child: QrImageView(
                  data: id,
                  version: QrVersions.auto,
                  size: 300,
                ),
              ),
            ),
          )),
    );
  }

  // Widget authenScreen(roleState, fem, hem, ffem, context) {
  //   if (roleState is RoleAppUnknown) {
  //     return _buildUnknown(fem, hem, ffem);
  //   } else if (roleState is RoleAppStudentVerified) {
  //     return _buildVerifiedStudent(fem, hem, ffem);
  //   } else if (roleState is RoleAppLoading) {
  //     return Scaffold(
  //         appBar: AppBarCampaign(hem: hem, ffem: ffem, fem: fem),
  //         body: Container(
  //             color: klighGreyColor,
  //             child: Center(
  //               child: Container(
  //                   child:
  //                       Lottie.asset('assets/animations/loading-screen.json')),
  //             )));
  //   }
  //   return _buildVerifiedStudent(fem, hem, ffem);
  // }

  // Widget _buildUnknown(double fem, double hem, double ffem) {
  //   return Scaffold(
  //       appBar: AppBarCampaign(hem: hem, ffem: ffem, fem: fem),
  //       body: Container(
  //           color: klighGreyColor,
  //           child:
  //               Center(child: CardForUnknow(fem: fem, hem: hem, ffem: ffem))));
  // }

  // Widget _buildVerifiedStudent(double fem, double hem, double ffem) {
  //   return SafeArea(
  //     child: Scaffold(
  //       appBar: AppBar(
  //         backgroundColor: Colors.transparent,
  //         elevation: 0,
  //         toolbarHeight: 160 * hem,
  //         title: Padding(
  //           padding: EdgeInsets.only(left: 20 * fem),
  //           child: Text(
  //             'UNI Student Bean',
  //             style: GoogleFonts.nunito(
  //                 textStyle: TextStyle(
  //                     fontSize: 30 * ffem,
  //                     fontWeight: FontWeight.w900,
  //                     height: 1.3625 * ffem / fem,
  //                     color: Colors.white)),
  //           ),
  //         ),
  //         actions: [
  //           // SvgPicture.asset('assets/icons/notification-icon.svg')
  //           Padding(
  //             padding: EdgeInsets.only(right: 20 * fem),
  //             child: IconButton(
  //               icon: Icon(
  //                 Icons.notifications,
  //                 color: Colors.white,
  //                 size: 35 * fem,
  //               ),
  //               onPressed: () {},
  //             ),
  //           ),
  //         ],
  //       ),
  //       extendBodyBehindAppBar: true,
  //       extendBody: true,
  //       body: Body(),
  //     ),
  //   );
  // }
}
