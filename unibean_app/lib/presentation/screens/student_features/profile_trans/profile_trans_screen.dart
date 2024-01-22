import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/screens/student_features/profile_trans/components/body.dart';

class ProfileTransactionHistoryScreen extends StatelessWidget {
  static const String routeName = '/profile-trans';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const ProfileTransactionHistoryScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const ProfileTransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;

    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background_splash.png'),
                      fit: BoxFit.cover)),
            ),
            toolbarHeight: 130 * hem,
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
                    margin: EdgeInsets.only(top: 10 * fem),
                    child: Text(
                      'Lịch sử giao dịch',
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              fontSize: 20 * ffem,
                              fontWeight: FontWeight.w900,
                              height: 1.3625 * ffem / fem,
                              color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            leadingWidth: 200 * fem,
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3,
              indicatorPadding: EdgeInsets.only(bottom: 1*fem),
              labelColor: Colors.white,
              labelStyle: GoogleFonts.nunito(
                  textStyle: TextStyle(
                fontSize: 15 * ffem,
                height: 1.3625 * ffem / fem,
                fontWeight: FontWeight.w700,
              )),
              unselectedLabelColor: Colors.white60,
              unselectedLabelStyle: GoogleFonts.nunito(
                  textStyle: TextStyle(
                fontSize: 15 * ffem,
                height: 1.3625 * ffem / fem,
                fontWeight: FontWeight.w700,
              )),
              tabs: [
                Tab(
                  text: 'Tích điểm',
                ),
                Tab(text: 'Đổi quà'),

                Tab(text: 'Nhận quà'),
              ],
            ),
          ),
          body: Body(),
        ),
      ),
    );
  }
}
