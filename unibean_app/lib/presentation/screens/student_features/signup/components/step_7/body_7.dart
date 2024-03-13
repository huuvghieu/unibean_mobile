import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/components/step_7/otp_form.dart';

// import '../../../../screens.dart';

class Body7 extends StatelessWidget {
  final String phoneNumber;
  const Body7({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;

    final defaultPinTheme = PinTheme(
        width: 50 * fem,
        height: 60 * hem,
        textStyle: GoogleFonts.openSans(
            textStyle: TextStyle(
                fontSize: 22 * ffem,
                fontWeight: FontWeight.w900,
                height: 1.3625 * ffem / fem,
                color: Colors.black)),
        decoration: BoxDecoration(
            // color: kPrimaryColor,
            border: Border(bottom: BorderSide(color: Colors.black))));
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/bg_signup_5.png'),
        )),
        child: Column(
          children: [
            SizedBox(
              height: 400 * hem,
            ),
            Text(
              'Nhập mã xác nhận',
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
              'Nhập mã số xác nhận đã được gửi đến\n số điện thoại +84$phoneNumber',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.3625 * ffem / fem,
                      color: kLowTextColor)),
            ),
            SizedBox(
              height: 30 * hem,
            ),
            OTPForm(
              fem: fem,
              hem: hem,
              defaultPinTheme: defaultPinTheme,
              ffem: ffem,
              phoneNumber: '+84$phoneNumber',
            ),
          ],
        ),
      ),
    );
  }
}
