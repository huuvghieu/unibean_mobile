import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/screens/student_features/voucher/components/body.dart';

class VoucherScreen extends StatelessWidget {
  static const String routeName = '/voucher-student';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const VoucherScreen(),
        settings: const RouteSettings(arguments: routeName));
  }

  const VoucherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;

    return SafeArea(
      child: DefaultTabController(
        length: 2,
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
            title: Padding(
              padding: EdgeInsets.only(left: 20 * fem, top: 20*hem),
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
                  text: 'Vouchers',
                ),
                Tab(text: 'Vouchers của bạn'),
              ],
            ),
          ),
          extendBody: true,
          body: Body(),
        ),
      ),
    );
  }
}
