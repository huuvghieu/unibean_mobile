import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/brand_detail/components/infor_card_brand_detail.dart';
import 'package:unibean_app/presentation/screens/campaign/components/campaign_carousel.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    double heightText = 1.3625 * ffem / fem;

    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              // color: Colors.black,
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background_splash.png'),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        //background body
                        Positioned(
                          left: 0 * fem,
                          top: 180 * hem,
                          child: Align(
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                color: Color(0xfff8f6fb)),
                          ),
                        ),

                        //widget information of profile
                        InformationCardBrandDetail(
                            hem: hem, fem: fem, ffem: ffem),

                        Positioned(
                          left: 0 * fem,
                          top: 350 * hem,
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 25 * fem),
                                  child: Text(
                                    'Thông tin về kênh',
                                    style: GoogleFonts.nunito(
                                        textStyle: TextStyle(
                                      fontSize: 15 * ffem,
                                      height: heightText,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900,
                                    )),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10 * hem,
                                      left: 25 * fem,
                                      right: 25 * fem),
                                  child: Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget nunc feugiat phasellus ultricies congue libero quis. Aliquet pellentesque a, arcu mattis. Urna eget interdum accumsan aliquam.',
                                    textAlign: TextAlign.justify,
                                    softWrap: true,
                                    style: GoogleFonts.nunito(
                                      textStyle: TextStyle(
                                        fontSize: 14 * ffem,
                                        height: heightText,
                                        color: kLowTextColor,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 25*fem, left: 25 * fem, right: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Các chiến dịch đang diễn ra',
                                        style: GoogleFonts.nunito(
                                            textStyle: TextStyle(
                                          fontSize: 15 * ffem,
                                          height: heightText,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900,
                                        )),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // Navigator.pushNamed(context,
                                          //     CampaignListScreen.routeName);
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 5 * hem, right: 10 * fem),
                                          child: Text(
                                            'Xem tất cả',
                                            style: GoogleFonts.nunito(
                                                textStyle: TextStyle(
                                              fontSize: 13 * ffem,
                                              height: heightText,
                                              color: kPrimaryColor,
                                              fontWeight: FontWeight.bold,
                                            )),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 25 * hem,
                                ),
                                CampaignCarousel(),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]),
        )
      ],
    );
  }
}
