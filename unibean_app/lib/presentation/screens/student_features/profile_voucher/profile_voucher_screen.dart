import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/screens/screens.dart';
import 'package:unibean_app/presentation/screens/student_features/profile_voucher/components/body.dart';
// import 'package:unibean_app/presentation/screens/student_features/campaign_list/components/filter_showdal_bottom.dart';

import '../../../blocs/blocs.dart';

class ProfileVoucherScreen extends StatelessWidget {
  static const String routeName = '/profile-voucher-student';
  static Route route({required String id}) {
    return MaterialPageRoute(
      builder: (_) => BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationFailed)
            Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName,
                (Route<dynamic> route) => false);
        },
        child: ProfileVoucherScreen(id: id,),
      ),
      settings: const RouteSettings(name: routeName),
    );
  }

  const ProfileVoucherScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background_splash.png'),
                      fit: BoxFit.cover)),
            ),
            toolbarHeight: 80 * hem,
            title: Container(
              child: Text(
                'Ưu đãi của bạn',
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w900,
                        height: 1.3625 * ffem / fem,
                        color: Colors.white)),
              ),
            ),
            centerTitle: true,
            leading: Container(
              margin: EdgeInsets.only(left: 20 * fem),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 35 * fem,
                ),
              ),
            ),
            leadingWidth: 50 * fem,
            actions: [
              InkWell(
                onTap: () {
                  // _filterModalBottomSheet(context);
                },
                child: Container(
                  margin: EdgeInsets.only(right: 20 * fem),
                  width: 25 * fem,
                  height: 25 * fem,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/filter-icon.png'),
                    fit: BoxFit.cover,
                  )),
                ),
              )
            ],
          ),
          body: Body(id: id)),
    );
  }
}
