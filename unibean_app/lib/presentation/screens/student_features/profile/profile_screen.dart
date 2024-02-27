import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';
import 'package:unibean_app/presentation/screens/student_features/profile/components/body.dart';
import 'package:unibean_app/presentation/widgets/card_for_unknow.dart';

import '../../../config/constants.dart';
import '../../../widgets/app_bar_campaign.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    final roleState = context.watch<RoleAppBloc>().state;

    return authenScreen(roleState, fem, hem, ffem, context);
  }

  Widget authenScreen(roleState, fem, hem, ffem, context) {
    if (roleState is RoleAppUnknown) {
      return _buildUnknown(fem, hem, ffem);
    } else if (roleState is RoleAppStudentVerified) {
      return _buildVerifiedStudent(fem, hem, ffem);
    } else if (roleState is RoleAppLoading) {
      return Scaffold(
          appBar: AppBarCampaign(hem: hem, ffem: ffem, fem: fem),
          body: Container(
              color: klighGreyColor,
              child: Center(
                child: Container(
                    child:
                        Lottie.asset('assets/animations/loading-screen.json')),
              )));
    }
    return _buildUnknown(fem, hem, ffem);
  }

  Widget _buildUnknown(double fem, double hem, double ffem) {
    return Scaffold(
        appBar: AppBarCampaign(hem: hem, ffem: ffem, fem: fem),
        body: Container(
            color: klighGreyColor,
            child:
                Center(child: CardForUnknow(fem: fem, hem: hem, ffem: ffem))));
  }

  Widget _buildVerifiedStudent(double fem, double hem, double ffem) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 160 * hem,
          title: Padding(
            padding: EdgeInsets.only(left: 20 * fem),
            child: Text(
              'UNI Student Bean',
              style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                      fontSize: 30 * ffem,
                      fontWeight: FontWeight.w900,
                      height: 1.3625 * ffem / fem,
                      color: Colors.white)),
            ),
          ),
          actions: [
            // SvgPicture.asset('assets/icons/notification-icon.svg')
            Padding(
              padding: EdgeInsets.only(right: 20 * fem),
              child: IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 35 * fem,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Body(),
      ),
    );
  }
}
