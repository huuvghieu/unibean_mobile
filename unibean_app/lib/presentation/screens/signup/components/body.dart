import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/constants.dart';
import 'package:unibean_app/presentation/widgets/text_form_field_default.dart';
import 'package:unibean_app/presentation/widgets/text_form_field_password.dart';

import '../../screens.dart';

class Body extends StatelessWidget {
  const Body({super.key});

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
          image: AssetImage('assets/images/bg_signup_1.png'),
        )),
        child: Column(
          children: [
            SizedBox(
              height: 130 * hem,
            ),
            Container(
              width: 210 * fem,
              height: 210 * fem,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/signup_account.png'))),
            ),
            SizedBox(
              height: 10 * hem,
            ),
            Text(
              'Chúng tôi sẽ kết nối với\n tài khoản của bạn!',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w900,
                      height: 1.3625 * ffem / fem,
                      color: Colors.black)),
            ),
            SizedBox(
              height: 20 * hem,
            ),
            Text(
              'Hãy kiểm tra thông tin thật cẩn thận',
              style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.3625 * ffem / fem,
                      color: kLowTextColor)),
            ),
            SizedBox(
              height: 40 * hem,
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
                    height: 20 * hem,
                  ),
                  TextFormFieldDefault(
                    hem: hem,
                    fem: fem,
                    ffem: ffem,
                    labelText: 'TÀI KHOẢN',
                    hintText: 'unibean123',
                  ),
                  SizedBox(
                    height: 25 * hem,
                  ),
                  TextFormFieldPassword(
                      hem: hem,
                      fem: fem,
                      ffem: ffem,
                      labelText: 'MẬT KHẨU *',
                      hintText: '******',
                      isPassword: true),
                  SizedBox(
                    height: 25 * hem,
                  ),
                  TextFormFieldPassword(
                      hem: hem,
                      fem: fem,
                      ffem: ffem,
                      labelText: 'XÁC NHẬN MẬT KHẨU *',
                      hintText: '******',
                      isPassword: true),
                  SizedBox(
                    height: 20 * hem,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30 * hem,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, SignUp1Screen.routeName,
                    arguments: 7);
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
