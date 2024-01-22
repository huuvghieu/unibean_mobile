import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/data/models/brand_model.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/student_features/campaign/components/brand_banner_item.dart';
import 'package:unibean_app/presentation/screens/student_features/campaign/components/campaign_carousel.dart';
import 'package:unibean_app/presentation/screens/student_features/campaign/components/membership_card.dart';
import 'package:unibean_app/presentation/screens/student_features/campaign_list/campaign_list_screen.dart';

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
            SizedBox(
              height: 20 * hem,
            ),
            MemberShipCard(
                fem: fem, hem: hem, ffem: ffem, heightText: heightText),
            SizedBox(
              height: 20 * hem,
            ),
            Container(
              margin: EdgeInsets.only(left: 10 * fem),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hôm nay có gì?',
                    style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                      fontSize: 20 * ffem,
                      height: heightText,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, CampaignListScreen.routeName);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 5 * hem, right: 10 * fem),
                      child: Text(
                        'Xem tất cả',
                        style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                          fontSize: 14 * ffem,
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
            SizedBox(
              height: 25 * hem,
            ),
            Container(
              margin: EdgeInsets.only(left: 10 * fem),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kênh thông tin',
                    style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                      fontSize: 20 * ffem,
                      height: heightText,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    )),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.only(top: 5 * hem, right: 10 * fem),
                      child: Text(
                        'Xem tất cả',
                        style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                          fontSize: 14 * ffem,
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
              height: 20 * hem,
            ),
            SizedBox(
                height: 120 * hem,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Brand.listBrand.length,
                  itemBuilder: (context, index) {
                    return BrandBannerItem(
                        fem: fem,
                        hem: hem,
                        ffem: ffem,
                        heightText: heightText,
                        index: index);
                  },
                )),
            SizedBox(
              height: 15 * hem,
            ),
            Container(
              margin: EdgeInsets.only(left: 10 * fem),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Vouchers nổi bật',
                    style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                      fontSize: 20 * ffem,
                      height: heightText,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    )),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.only(top: 5 * hem, right: 10 * fem),
                      child: Text(
                        'Xem tất cả',
                        style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                          fontSize: 14 * ffem,
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
              height: 10 * hem,
            ),
            Column(
              children: [
                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
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
    );
  }
}
