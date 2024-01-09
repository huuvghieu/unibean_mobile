import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';

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

    final assetImg = [
      'assets/images/voucher-banner.png',
      'assets/images/voucher-banner.png',
      'assets/images/voucher-banner.png',
    ];

    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(
              height: 20 * fem,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 30 * fem, right: 30 * fem, bottom: 30 * hem),
              width: 300 * fem,
              height: 130 * hem,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20 * fem),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          AssetImage('assets/images/campaign-banner-img.png'))),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25 * fem),
              child: Text(
                'Thông tin chiến dịch',
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
                  top: 10 * hem, left: 25 * fem, right: 25 * fem),
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
            SizedBox(
              height: 25 * hem,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25 * fem),
              child: Text(
                'Thời gian',
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
                  top: 10 * hem, left: 25 * fem, right: 25 * fem),
              child: Text(
                'Chiến dịch này sẽ hết hạn vào 12/03/2024',
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
            SizedBox(
              height: 25 * hem,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25 * fem),
              child: Text(
                'Các Vouchers trong chiến dịch',
                style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                  fontSize: 15 * ffem,
                  height: heightText,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                )),
              ),
            ),
            SizedBox(
              height: 15*hem,
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
                      
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 25 * fem, right: 25 * fem),
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
