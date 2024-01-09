import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/data/models/brand.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/brand_detail/brand_detail_screen.dart';

class BrandBannerItem extends StatelessWidget {
  const BrandBannerItem(
      {super.key,
      required this.fem,
      required this.hem,
      required this.ffem,
      required this.heightText,
      required this.index});

  final double fem;
  final double hem;
  final double ffem;
  final double heightText;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, BrandDetailScreen.routeName);
      },
      child: Container(
        margin: EdgeInsets.only(left: 20 * fem, right: 20 * fem),
        child: Column(
          children: [
            Container(
              width: 80 * fem,
              height: 80 * hem,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10 * fem),
                  image: DecorationImage(
                      image: AssetImage(Brand.listBrand[index].assetImage))),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5 * hem),
              child: Text(
                Brand.listBrand[index].name,
                style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                  fontSize: 13 * ffem,
                  height: heightText,
                  color: kLowTextColor,
                  fontWeight: FontWeight.normal,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
