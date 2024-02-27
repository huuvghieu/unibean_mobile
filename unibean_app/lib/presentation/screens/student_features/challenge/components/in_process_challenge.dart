import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
                    height: 25 * hem,
                  ),
                  Container(
                    width: 340 * fem,
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
                              padding: EdgeInsets.only(
                                  left: 5 * fem, right: 5 * fem),
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
                        SizedBox(
                          width: 340 * fem,
                          child: Stack(
                            children: [
                              Container(
                                width: 330 * fem,
                                height: 240 * hem,
                                margin: EdgeInsets.only(
                                    top: 10 * hem,
                                    left: 10 * fem,
                                    right: 10 * fem),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15 * fem),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 15 * hem,
                                    ),
                                    Container(
                                      width: 180 * fem,
                                      height: 50 * hem,
                                      margin: EdgeInsets.only(left: 20 * fem),
                                      child: Text(
                                        'Mời bạn cùng vui 50',
                                        style: GoogleFonts.nunito(
                                            textStyle: TextStyle(
                                          color: kDarkPrimaryColor,
                                          fontSize: 18 * ffem,
                                          height: 1.3625 * ffem / fem,
                                          fontWeight: FontWeight.w900,
                                        )),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 80 * fem,
                                          height: 80 * hem,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/item-card-voucher.png'))),
                                        ),
                                        Container(
                                          width: 200 * fem,
                                          padding:
                                              EdgeInsets.only(left: 10 * fem),
                                          child: Text(
                                            'Được 50 tài khoản nhập mã giới thiệu để hoàn thành thử thách',
                                            textAlign: TextAlign.justify,
                                            style: GoogleFonts.nunito(
                                              fontSize: 14 * ffem,
                                              height: 1.3625 * ffem / fem,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10 * hem,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 180 * fem,
                                          child: LinearProgressIndicator(
                                            color: kPrimaryColor,
                                            minHeight: 15 * hem,
                                            semanticsLabel: '40/60',
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            value: 40 / 50,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30 * fem,
                                        ),
                                        Text(
                                          '40/50',
                                          textAlign: TextAlign.justify,
                                          style: GoogleFonts.nunito(
                                            fontSize: 18 * ffem,
                                            height: 1.3625 * ffem / fem,
                                            fontWeight: FontWeight.bold,
                                            color: kLowTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5*hem,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: Container(
                                              width: 85 * fem,
                                              height: 30 * hem,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: kPrimaryColor),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Center(
                                                child: Text(
                                                  'Nhận',
                                                  style: GoogleFonts.nunito(
                                                      textStyle: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: kPrimaryColor)),
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 20 * hem,
                                left: 250 * fem,
                                child: Container(
                                  width: 90 * fem,
                                  height: 35 * hem,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(5 * fem),
                                      color: kPrimaryColor),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 10 * fem),
                                        child: Text(
                                          '+ 600',
                                          style: GoogleFonts.nunito(
                                            color: Colors.white,
                                            height: 1.3625 * ffem / fem,
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        'assets/icons/green-bean-icon.svg',
                                        width: 25 * fem,
                                        height: 30 * fem,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
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
