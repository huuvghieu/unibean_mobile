import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/student_features/login/login_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/bg_welcome_screen.png',
          ),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 500 * hem,
          ),
          Text(
            'Tham gia cùng chúng tôi\n và nhận những phần quà hấp dẫn!',
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
          SizedBox(
            height: 60 * hem,
            child: Text(
              'Tham gia các hoạt động bạn yêu thích,\n tích bean và đổi những phần quà đặc biệt!',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.3625 * ffem / fem,
                      color: kLowTextColor)),
            ),
          ),
          SizedBox(
            height: 20 * hem,
          ),
          TextButton(
            onPressed: () {},
            child: Container(
              width: 270 * fem,
              height: 45 * hem,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(23 * fem)),
              child: Center(
                child: Text(
                  'Bắt đầu',
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
                  'Bạn đã có tài khoản?',
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
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 2 * fem, bottom: 20 * hem),
                  child: Text(
                    'Đăng nhập',
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
    );
  }
}
