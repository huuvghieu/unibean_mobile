import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/screens.dart';

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
        CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                width: 340 * fem,
                height: 190 * hem,
                child: Stack(
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
              ),
              Container(
                margin: EdgeInsets.only(top: 25 * hem, left: 10 * fem),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Đặc biệt dành cho bạn',
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                        fontSize: 14 * ffem,
                        height: 1.3625 * ffem / fem,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      )),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, FilterVoucherScreen.routeName);
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 5 * hem,
                            ),
                            child: Icon(
                              Icons.filter_alt_sharp,
                              color: kPrimaryColor,
                              size: 12 * fem,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 5 * hem, right: 30 * fem, left: 5 * fem),
                            child: Text(
                              'Lọc',
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                fontSize: 10 * ffem,
                                height: 1.3625 * ffem / fem,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10 * hem,
              ),
              Column(
                children: [
                  ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, VoucherDetailScreen.routeName);
                        },
                        child: Container(
                          width: 350 * fem,
                          height: 170 * hem,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/voucher-banner.png'),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Container(
                        width: 350 * fem,
                        height: 170 * hem,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/voucher-banner.png'),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        width: 350 * fem,
                        height: 170 * hem,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/voucher-banner.png'),
                                fit: BoxFit.cover)),
                      )
                    ],
                  ),
                ],
              ),
            ]),
          )
        ],
      ),
      Container(
        child: Center(
          child: Text('voucher cua ban'),
        ),
      )
      ],
    );
  }
}
