import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/data/models.dart';
import '../../../config/constants.dart';
import 'components/body.dart';

class VoucherItemDetailScreen extends StatelessWidget {
  static const String routeName = '/voucher-item-detail-student';

  static Route route({required VoucherStudentModel voucherStudent}) {
    return MaterialPageRoute(
        builder: (_) => VoucherItemDetailScreen(
              voucherStudent: voucherStudent,
            ),
        settings: const RouteSettings(arguments: routeName));
  }

  const VoucherItemDetailScreen({super.key, required this.voucherStudent});

  final VoucherStudentModel voucherStudent;
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
            'Chi tiết ưu đãi',
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    fontSize: 18 * ffem,
                    fontWeight: FontWeight.w900,
                    height: 1.3625 * ffem / fem,
                    color: Colors.white)),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20 * fem),
              child: IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 25 * fem,
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/landing-screen',
                      (Route<dynamic> route) => false);
                },
              ),
            ),
          ],
        ),
        body: Body(
          voucherStudentModel: voucherStudent,
        ),
      ),
    );
  }
}
