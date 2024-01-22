import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/widgets/text_form_field_default.dart';
import 'package:unibean_app/presentation/widgets/text_form_field_password.dart';

import '../../../screens.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    double height = MediaQuery.of(context).size.height;
    print(height);

    double responsiveSize() {
      if (height < 800) {
        return 270 * hem;
      }
      return 330 * hem;
    }

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg_login.png'),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            SizedBox(height: responsiveSize()),
            Text(
              'Chào mừng bạn đã quay trở lại!',
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
              'Đăng nhập và tận hưởng những ưu đãi\n yêu thích của bạn!',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                fontSize: 15 * ffem,
                fontWeight: FontWeight.w900,
                height: 1.3625 * ffem / fem,
                color: kLowTextColor,
              )),
            ),
            SizedBox(
              height: 20 * hem,
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
                    height: 30 * hem,
                  ),
                  TextFormFieldDefault(
                    hem: hem,
                    fem: fem,
                    ffem: ffem,
                    labelText: 'TÀI KHOẢN',
                    hintText: 'unibean123',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tài khoản không được bỏ trống';
                      }
                      return null;
                    },
                    textController: emailController,
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
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tài khoản không được bỏ trống';
                      }
                      return null;
                    },
                    textController: TextEditingController(),
                  ),
                  SizedBox(
                    height: 30 * hem,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25 * hem,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, SignUp1Screen.routeName,
                    arguments: false);
              },
              child: Container(
                width: 300 * fem,
                height: 45 * hem,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(23 * fem)),
                child: Center(
                  child: Text(
                    'Đăng nhập',
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
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, SignUp1Screen.routeName,
                    arguments: false);
              },
              child: Container(
                width: 300 * fem,
                height: 45 * hem,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(23 * fem)),
                child: Center(
                  child: Text(
                    'Đăng nhập bằng Gmail',
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
            SizedBox(
              height: 10 * hem,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20 * hem),
                  child: Text(
                    'Bạn chưa có tài khoản?',
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
                    Navigator.pushNamed(context, SignUpScreen.routeName);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 2 * fem, bottom: 20 * hem),
                    child: Text(
                      'Đăng ký',
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
