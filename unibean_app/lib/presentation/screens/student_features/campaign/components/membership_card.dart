import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';

class MemberShipCard extends StatelessWidget {
  const MemberShipCard({
    super.key,
    required this.fem,
    required this.hem,
    required this.ffem,
    required this.heightText,
  });

  final double fem;
  final double hem;
  final double ffem;
  final double heightText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 360 * fem,
        height: 200 * hem,
        child: Stack(
          children: [
            Container(
              width: 350 * fem,
              height: 200 * hem,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20 * fem),
                  boxShadow: [
                    BoxShadow(
                        color: const Color.fromARGB(255, 150, 150, 150),
                        offset: Offset(10 * fem, 10 * fem),
                        blurRadius: 10 * fem)
                  ],
                  image: DecorationImage(
                      image: AssetImage('assets/images/bg-card-level.png'),
                      fit: BoxFit.cover)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25 * hem, left: 30 * fem),
                    child: Container(
                      // color: Colors.red,
                      width: 250 * fem,
                      child: Text(
                        'Xin Chào,\nPhạm Quốc Thịnh!',
                        style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                          fontSize: 20 * ffem,
                          height: heightText,
                          color: kDarkPrimaryColor,
                          fontWeight: FontWeight.w800,
                        )),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30 * hem, left: 30 * fem),
                        child: Text(
                          'Số dư:',
                          style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                            fontSize: 20 * ffem,
                            height: heightText,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10 * fem, top: 30 * hem),
                        child: Row(
                          children: [
                            Text(
                              '10',
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                fontSize: 20 * ffem,
                                height: heightText,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w900,
                              )),
                            ),
                            SvgPicture.asset(
                              'assets/icons/green-bean-icon.svg',
                              width: 30 * fem,
                              height: 35 * fem,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10 * fem, top: 30 * hem),
                        child: Row(
                          children: [
                            Text(
                              '10',
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                fontSize: 20 * ffem,
                                height: heightText,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w900,
                              )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 4 * fem),
                              child: SvgPicture.asset(
                                'assets/icons/red-bean-icon.svg',
                                width: 30 * fem,
                                height: 27 * fem,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: 130 * hem,
              left: 255 * fem,
              child: Container(
                width: 100 * fem,
                height: 37 * hem,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10 * fem),
                    color: kDarkPrimaryColor),
                child: Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 12.5 * fem, right: 5 * fem),
                      child: Text(
                        'SILVER',
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                          height: heightText,
                          fontSize: 14 * ffem,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Container(
                      width: 20 * fem,
                      height: 27 * fem,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/upload-file-2ac29.appspot.com/o/levels%2F01HK4J583PKDM0J672X26GSEX2.png?alt=media&token=8c70f59e-68cd-42c4-84ad-c3b18a78a7df',
                        ),
                      )),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 5 * hem,
              right: 20 * fem,
              child: Container(
                width: 110 * fem,
                height: 110 * hem,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/ava_signup.png'),
                        fit: BoxFit.cover)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
