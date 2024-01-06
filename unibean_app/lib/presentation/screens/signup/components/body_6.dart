import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:unibean_app/presentation/constants.dart';

import '../../screens.dart';

class Body6 extends StatelessWidget {
  const Body6({super.key});

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
              style: GoogleFonts.nunito(
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
              'Nhập mã số xác nhận đã được gửi đến\n số điện thoại 0xxx xxx xxx',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.3625 * ffem / fem,
                      color: kLowTextColor)),
            ),
            SizedBox(
              height: 30 * hem,
            ),
            Container(
              width: 318 * fem,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15 * fem),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0c000000),
                      offset: Offset(0 * fem, 4 * fem),
                      blurRadius: 2.5 * fem,
                    )
                  ]),
              child: Column(
                children: [
                  SizedBox(
                    height: 25 * hem,
                  ),
                  OtpForm(),
                  SizedBox(
                    height: 25 * hem,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30 * hem,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, SignUp7Screen.routeName);
              },
              child: Container(
                width: 300 * fem,
                height: 45 * hem,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(23 * fem)),
                child: Center(
                  child: Text(
                    'Tiếp tục',
                    style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                            fontSize: 17 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.3625 * ffem / fem,
                            color: Colors.white)),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20 * hem),
                  child: Text(
                    'Bạn không nhận được mã xác nhận?',
                    style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                            fontSize: 13 * ffem,
                            fontWeight: FontWeight.bold,
                            height: 1.3625 * ffem / fem,
                            color: kLowTextColor)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 2 * fem, bottom: 20 * hem),
                    child: Text(
                      'Gửi lại mã',
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              fontSize: 13 * ffem,
                              fontWeight: FontWeight.w900,
                              height: 1.3625 * ffem / fem,
                              color: kPrimaryColor)),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: OTPTextField(
        length: 4,
        width: MediaQuery.of(context).size.width,
        fieldWidth: 50,
        style: GoogleFonts.nunito(
            textStyle: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w700)),
        textFieldAlignment: MainAxisAlignment.spaceAround,
        fieldStyle: FieldStyle.underline,
      ),
    );
  }
}
