import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';

class InProcessChallenge extends StatelessWidget {
  const InProcessChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25*hem,
                  ),

                  Container(
                    width: 340 * fem,
                    height: 245 * hem,
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Brand Name',
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                fontSize: 14 * ffem,
                                color: kLowTextColor,
                                height: 1.3625 * ffem / fem,
                              )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5*fem, right: 5*fem),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color: kLowTextColor,
                              ),
                            ),
                            Text(
                              'CampaignName',
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                fontSize: 14 * ffem,
                                color: kLowTextColor,
                                height: 1.3625 * ffem / fem,
                              )),
                            )
                          ],
                        ),
                        Stack(
                  children: [
                    Container(
                      width: 330 * fem,
                      height: 185 * hem,
                      margin: EdgeInsets.only(
                          top: 25 * hem, left: 20 * fem, right: 20 * fem),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15 * fem),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x0c000000),
                                offset: Offset(10 * fem, 10 * fem),
                                blurRadius: 5 * fem)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20 * hem,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20 * fem),
                            child: Text(
                              'Điểm hiện tại',
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15 * ffem,
                                height: 1.3625 * ffem / fem,
                                fontWeight: FontWeight.w600,
                              )),
                            ),
                          ),
                          SizedBox(
                            height: 25 * hem,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                child: Container(
                                  width: 70 * fem,
                                  height: 60 * hem,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/item-card-voucher.png'))),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10 * fem),
                                child: Text(
                                  'Bạn cần thêm 5 điểm nữa để đạt hạng Bạc',
                                  style: GoogleFonts.nunito(
                                    fontSize: 11 * ffem,
                                    height: 1.3625 * ffem / fem,
                                    fontWeight: FontWeight.bold,
                                    color: kLowTextColor,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 50 * hem,
                      left: 240 * fem,
                      child: Container(
                        width: 120 * fem,
                        height: 30 * hem,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10 * fem),
                            color: kPrimaryColor),
                        child: Center(
                          child: Text(
                            '125 điểm',
                            style: GoogleFonts.nunito(
                              color: Colors.white,
                              height: 1.3625 * ffem / fem,
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                      ],
                      
                    ),
                  ),
                ],
              ),
            )
          ]),
        )
      ],
    );
  }
}
