import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/constants.dart';
import 'package:unibean_app/presentation/screens/signup/screens/signup_6_screen.dart';

class Body5 extends StatelessWidget {
  const Body5({super.key});

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
          image: AssetImage('assets/images/bg_signup_4.png'),
        )),
        child: Column(
          children: [
            SizedBox(
              height: 400 * hem,
            ),
            Text(
              'Số điện thoại của bạn',
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
              'Nhập số điện thoại của bạn,\n chúng tôi sẽ gửi đến bạn mã OTP để xác nhận',
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
                  Container(
                    height: 42 * hem,
                    width: 272 * fem,
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 17 * ffem,
                              fontWeight: FontWeight.w700)),
                      decoration: InputDecoration(
                        labelText: 'SỐ ĐIỆN THOẠI',
                        hintText: '0xxx xxx xxx',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelStyle: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 15 * ffem,
                              fontWeight: FontWeight.w900),
                        ),
                        hintStyle: GoogleFonts.nunito(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 17 * ffem,
                                fontWeight: FontWeight.w700)),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 26 * fem, vertical: 10 * hem),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28 * fem),
                            borderSide: BorderSide(
                                width: 2,
                                color:
                                    const Color.fromARGB(255, 220, 220, 220)),
                            gapPadding: 10),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28 * fem),
                            borderSide: BorderSide(
                                width: 2,
                                color:
                                    const Color.fromARGB(255, 220, 220, 220)),
                            gapPadding: 10),
                      ),
                    ),
                  ),
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
                Navigator.pushNamed(context, SignUp6Screen.routeName);
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
          ],
        ),
      ),
    );
  }
}
