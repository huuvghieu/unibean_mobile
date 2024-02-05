import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';

class CardVoucherNewItem extends StatelessWidget {
  const CardVoucherNewItem(
      {super.key,
      required this.fem,
      required this.hem,
      required this.ffem,
      required this.name,
      required this.assetName,
      required this.quality});

  final double fem;
  final double hem;
  final double ffem;
  final String name;
  final String assetName;
  final int quality;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(
        //     context, CampaignDetailScreen.routeName);
      },
      child: Container(
        margin: EdgeInsets.only(top: 15 * hem, left: 10 * fem, right: 10 * fem),
        width: 340 * fem,
        height: 150 * hem,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15 * fem),
            color: Colors.white,
            border: Border.all(color: klighGreyColor),
            boxShadow: [
              BoxShadow(
                  color: Color(0x0c000000),
                  offset: Offset(0 * fem, 0 * fem),
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
                      image: AssetImage(assetName), fit: BoxFit.fill)),
            ),
            SizedBox(
              width: 15 * fem,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200 * fem,
                  child: Text(name,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                        fontSize: 14 * ffem,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ))),
                ),
                SizedBox(
                  height: 5*hem,
                ),
                Container(
                  width: 200 * fem,
                  child: Text('Thời gian sử dụng ưu đãi',
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
                SizedBox(
                  height: 5*hem,
                ),
                Container(
                  width: 200 * fem,
                  child: Text('Số lượng: $quality',
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
  }
}
