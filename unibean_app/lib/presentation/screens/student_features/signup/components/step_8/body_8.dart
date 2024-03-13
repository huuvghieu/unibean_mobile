import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';

class Body8 extends StatelessWidget {
  const Body8({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/bg_signup_6.png'),
        )),
        child: Column(
          children: [
            SizedBox(
              height: 500 * hem,
            ),
            Text(
              'Bạn đã sẵn sàng bắt đầu!',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w900,
                      height: 1.3625 * ffem / fem,
                      color: Colors.black)),
            ),
            SizedBox(
              height: 10 * hem,
            ),
            Text(
              'Cảm ơn bạn đã đăng ký.\n Giờ đây, bạn có thể tham gia vào các sự kiện\n yêu thích, các kênh thông tin để tích lũy\n những ưu đãi hấp dẫn.',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.3625 * ffem / fem,
                      color: kLowTextColor)),
            ),
            SizedBox(
              height: 60 * hem,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/landing-screen',
                    (Route<dynamic> route) => false);
              },
              child: Container(
                width: 300 * fem,
                height: 45 * hem,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(23 * fem)),
                child: Center(
                  child: Text(
                    'Bắt đầu',
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            fontSize: 17 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.3625 * ffem / fem,
                            color: Colors.white)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
