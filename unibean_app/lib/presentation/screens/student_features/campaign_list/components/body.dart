import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/screens/student_features/campaign_detail/campaign_detail_screen.dart';

import '../../../../../data/models.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    // double heightText = 1.3625 * ffem / fem;
    final assetImg = [
      'assets/images/campaign-banner-img.png',
      'assets/images/campaign-banner-img.png',
      'assets/images/campaign-banner-img.png',
    ];
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(
              height: 20 * fem,
            ),
            Column(
              children: [
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: assetImg.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, CampaignDetailScreen.routeName);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 25 * fem, right: 25 * fem, bottom: 25 * hem),
                        width: 340 * fem,
                        height: 150 * hem,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15 * fem),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x0c000000),
                                  offset: Offset(5 * fem, 5 * fem),
                                  blurRadius: 5 * fem)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 110 * fem,
                              height: 110 * hem,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15 * fem),
                                  image: DecorationImage(
                                      image: AssetImage(CampaignDemo
                                          .listCampaign[1].assetImage),
                                      fit: BoxFit.fill)),
                            ),
                            SizedBox(
                              width: 15 * fem,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 200 * fem,
                                  child: Text(CampaignDemo.listCampaign[0].name,
                                      softWrap: true,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.nunito(
                                          textStyle: TextStyle(
                                        fontSize: 12 * ffem,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
                                      ))),
                                ),
                                Container(
                                  width: 200 * fem,
                                  child: Text('Thời gian tham gia Minigame',
                                      softWrap: true,
                                      style: GoogleFonts.nunito(
                                          textStyle: TextStyle(
                                        fontSize: 12 * ffem,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                      ))),
                                ),
                                Container(
                                  width: 200 * fem,
                                  child: Text('từ ngày 25/01 - 01/02/2024',
                                      softWrap: true,
                                      style: GoogleFonts.nunito(
                                          textStyle: TextStyle(
                                        fontSize: 12 * ffem,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                      ))),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            )
          ]),
        )
      ],
    );
  }
}
