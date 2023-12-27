import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/constants.dart';
import 'package:unibean_app/presentation/screens/signup/screens/signup_3_screen.dart';
import 'package:unibean_app/presentation/widgets/drop_down_text_field_default.dart';

class Body2 extends StatelessWidget {
  const Body2({super.key});

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
          image: AssetImage('assets/images/bg_signup_2.png'),
        )),
        child: Column(
          children: [
            SizedBox(
              height: 400 * hem,
            ),
            Text(
              'Trường bạn đang học',
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
              'Để hiểu rõ và dễ dàng hơn khi hỗ trợ bạn,\n mong bạn hãy cung cấp thông tin chính xác.',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.3625 * ffem / fem,
                      color: kLowTextColor)),
            ),
            SizedBox(
              height: 18 * hem,
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
                  DropDownTextFieldDefault(
                    fem: fem,
                    hem: hem,
                    ffem: ffem,
                    hintText: 'Chọn trường học',
                    labelText: 'TRƯỜNG *',
                  ),
                  SizedBox(
                    height: 20 * hem,
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 70 * hem,
                        width: 272 * fem,
                        // color: Colors.red,
                      ),
                      Positioned(
                        bottom: 5,
                        child: Container(
                          width: 272 * fem,
                          height: 58 * fem,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12 * fem)),
                            border: Border.all(
                                color: const Color.fromARGB(255, 220, 220, 220),
                                width: 2.0),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 22 * fem,
                        bottom: 50 * fem,
                        child: Container(
                            height: 20 * hem,
                            width: 105 * fem,
                            color: Colors.white,
                            child: Text(
                              'THẺ SINH VIÊN *',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 11.5 * ffem,
                                    fontWeight: FontWeight.w900),
                              ),
                            )),
                      ),
                      Positioned(
                        left: 22 * fem,
                        bottom: 18 * fem,
                        child: Container(
                          width: 100 * fem,
                          height: 30 * hem,
                          decoration: BoxDecoration(
                            border: Border.all(color: kPrimaryColor, width: 2),
                            borderRadius: BorderRadius.circular(5 * fem),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Tải hình ảnh lên',
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 10 * ffem,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10 * hem),
                    child: SizedBox(
                      width: 270 * fem,
                      child: Text(
                        'Hãy tải lên cả mặt trước và mặt sau của thẻ sinh viên, và đảm bảo rằng thông tin trên thẻ đầy đủ và rõ ràng.',
                        style: GoogleFonts.nunito(
                          fontSize: 9 * ffem,
                          fontWeight: FontWeight.w800,
                          height: 1.3625 * ffem / fem,
                          color: kLowTextColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20 * hem,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20 * hem,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, SignUp3Screen.routeName);
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
