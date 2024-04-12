import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';
import 'package:unibean_app/presentation/screens/student_features/profile/components/body.dart';

import '../../../config/constants.dart';
import '../../../widgets/app_bar_campaign.dart';
import '../../../widgets/unverified_screen.dart';
import '../../screens.dart';

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
    if (roleState is Unverified) {
      return _buildVerifiedStudent(fem, hem, ffem, '', roleState);
    } else if (roleState is Verified) {
      return _buildVerifiedStudent(
          fem, hem, ffem, roleState.studentModel.id, roleState);
    }
    return Scaffold(
        appBar: AppBarCampaign(hem: hem, ffem: ffem, fem: fem),
        body: Container(
            color: klighGreyColor,
            child: Center(
              child: Container(
                  child: Lottie.asset('assets/animations/loading-screen.json')),
            )));
  }

  Widget _buildVerifiedStudent(
      double fem, double hem, double ffem, String studentId, roleState) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 80 * hem,
          centerTitle: true,
          title: Text(
            'UniBean',
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    fontSize: 22 * ffem,
                    fontWeight: FontWeight.w900,
                    height: 1.3625 * ffem / fem,
                    color: Colors.white)),
          ),
          actions: [
            // SvgPicture.asset('assets/icons/notification-icon.svg')
            Padding(
              padding: EdgeInsets.only(right: 20 * fem),
              child: BlocBuilder<NotificationBloc, NotificationState>(
                builder: (context, state) {
                  if (state is NewNotification) {
                    return IconButton(
                      icon: Icon(
                        Icons.notifications_active_rounded,
                        color: Colors.yellow,
                        size: 25 * fem,
                      ),
                      onPressed: () {
                        if (roleState is Unverified) {
                          Navigator.pushNamed(
                              context, UnverifiedScreen.routeName);
                        } else {
                          context
                              .read<NotificationBloc>()
                              .add(LoadNotification());
                          Navigator.pushNamed(
                              context, NotificationListScreen.routeName);
                        }
                      },
                    );
                  }
                  return IconButton(
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 25 * fem,
                    ),
                    onPressed: () {
                      if (roleState is Unverified) {
                        Navigator.pushNamed(
                            context, UnverifiedScreen.routeName);
                      } else {
                        Navigator.pushNamed(
                            context, NotificationListScreen.routeName);
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Body(
          studentId: studentId,
        ),
      ),
    );
  }
}
