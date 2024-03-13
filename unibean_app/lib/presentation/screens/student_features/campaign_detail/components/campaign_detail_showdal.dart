import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/constants.dart';

class CampaignDetailShowdal extends StatelessWidget {
  const CampaignDetailShowdal(
      {super.key,
      required this.fem,
      required this.hem,
      required this.ffem,
      required this.onTap});

  final double fem;
  final double hem;
  final double ffem;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 15 * fem, left: 15 * fem),
        padding:EdgeInsets.only(right: 10 * fem, left: 10 * fem),
        width: MediaQuery.of(context).size.width,
        height: 100 * hem,
        decoration: BoxDecoration(
            // border: Border.all(
            //   color: kPrimaryColor,
            // ),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15 * fem),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Thông tin chiến dịch',
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                      fontSize: 14 * ffem,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                  Text(
                    'Nhấn vào để xem chi tiết',
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                      fontSize: 13 * ffem,
                      color: kLowTextColor,
                      fontWeight: FontWeight.w600,
                    )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10 * fem),
              child: Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
    );
  }
}
