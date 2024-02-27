import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/data/models.dart';
import 'package:unibean_app/presentation/config/constants.dart';

class MemberShipCard extends StatelessWidget {
  const MemberShipCard({
    super.key,
    required this.fem,
    required this.hem,
    required this.ffem,
    required this.heightText,
    required this.studentModel,
  });

  final double fem;
  final double hem;
  final double ffem;
  final double heightText;
  final StudentModel studentModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 350 * fem,
        height: 210 * hem,
        child: Stack(
          children: [
            Container(
              width: 340 * fem,
              height: 210 * hem,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20 * fem),
                  boxShadow: [
                    BoxShadow(
                        color: const Color.fromARGB(255, 150, 150, 150),
                        offset: Offset(0 * fem, 0 * fem),
                        blurRadius: 5 * fem)
                  ],
                  image: DecorationImage(
                      image: AssetImage('assets/images/bg-card-level.png'),
                      fit: BoxFit.cover)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25 * hem, left: 35 * fem),
                    child: Container(
                      // color: Colors.red,
                      width: 250 * fem,
                      child: Text(
                        'Xin Chào,\n   ${studentModel.fullName}',
                        style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                          fontSize: 20 * ffem,
                          height: heightText,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w800,
                        )),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20 * hem, left: 50 * fem),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 20 * fem, top: 0 * hem),
                            child: Row(
                              children: [
                                Text(
                                  '${studentModel.greenWalletBalance.toStringAsFixed(0)}',
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
                            padding:
                                EdgeInsets.only(right: 20 * fem, top: 0 * hem),
                            child: Row(
                              children: [
                                Text(
                                  '${studentModel.redWalletBalance.toStringAsFixed(0)}',
                                  style: GoogleFonts.nunito(
                                      textStyle: TextStyle(
                                    fontSize: 20 * ffem,
                                    height: heightText,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w900,
                                  )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 2*fem,bottom: 4 *hem),
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
                  )
                ],
              ),
            ),
            Positioned(
              top: 160 * hem,
              left: 250 * fem,
              child: Container(
                width: 100 * fem,
                height: 40 * hem,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5 * fem),
                    color: kDarkPrimaryColor),
                child: Center(
                  child: Text(
                    '${studentModel.code}',
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      height: heightText,
                      fontSize: 14 * ffem,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10 * hem,
              right: 25 * fem,
              child: Container(
                width: 90 * fem,
                height: 90 * hem,
                decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        image: NetworkImage('${studentModel.avatar}'),
                        fit: BoxFit.cover)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
