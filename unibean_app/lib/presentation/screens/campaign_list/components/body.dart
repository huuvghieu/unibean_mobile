import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/screens/campaign_detail/campaign_detail_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
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
              height: 20*fem,
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
                        width: 300 * fem,
                        height: 130 * hem,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20 * fem),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(assetImg[index]))),
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
