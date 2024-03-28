import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';

import '../../../config/constants.dart';
import '../../../widgets/app_bar_campaign.dart';
import 'components/body.dart';

class ProfileStoreScreen extends StatelessWidget {
  const ProfileStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    final roleState = context.watch<RoleAppBloc>().state;

    return BlocBuilder<RoleAppBloc, RoleAppState>(
      builder: (context, state) {
        if (roleState is StoreRole) {
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
                    child: IconButton(
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 30 * fem,
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
        } else if (roleState is RoleAppLoading) {
          return Scaffold(
              appBar: AppBarCampaign(hem: hem, ffem: ffem, fem: fem),
              body: Container(
                  color: klighGreyColor,
                  child: Center(
                    child: Container(
                        child: Lottie.asset(
                            'assets/animations/loading-screen.json')),
                  )));
        }
        return Container();
      },
    );
  }
}
