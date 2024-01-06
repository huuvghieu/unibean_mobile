import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/constants.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;

    return TabBarView(
      children: [
        Container(
          color: kbgWhiteColor,
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: 25 * hem,
              ),
              Container(
                  width: 340 * fem,
                  height: 90 * hem,
                  child: Stack(
                    children: [
                      Container(
                        width: 330 * fem,
                        height: 90 * hem,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10 * fem),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x0c000000),
                                  offset: Offset(0 * fem, 10 * fem),
                                  blurRadius: 5 * fem)
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20*fem),
                              child: Text(
                                'Hoàn thành thử thách no. #1234',
                                style: GoogleFonts.nunito(
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.3625 * ffem / fem,
                                  color: Colors.black
                                ),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: 20*fem),
                              child: Text('của chiến dịch "ABC"',
                                  style: GoogleFonts.nunito(
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.3625 * ffem / fem,
                                    color: Colors.black
                                  )),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: 20*fem, top: 5*hem),
                              child: Text('13:54 on 10/12/2022',
                               style: GoogleFonts.nunito(
                                    fontSize: 10 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.3625 * ffem / fem,
                                    color: kLowTextColor
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 37 * hem,
                        left: 252 * fem,
                        child: Container(
                          width: 85 * fem,
                          height: 32 * hem,
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(8 * fem)),
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: 4 * hem, left: 4 * fem),
                            child: Text(
                              '+ 10 điểm',
                              style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 16 * ffem,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
        Container(
          child: Center(
            child: Text('Đổi quà'),
          ),
        ),
        Container(
          child: Center(
            child: Text('Nhận quà'),
          ),
        ),
      ],
    );
  }
}
