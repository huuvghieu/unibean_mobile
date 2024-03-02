import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../../data/models.dart';
import '../../../../config/constants.dart';

class CampaignCard extends StatelessWidget {
  const CampaignCard({
    super.key,
    required this.fem,
    required this.hem,
    required this.ffem,
    required this.campaignModel,
    required this.onTap
  });

  final double fem;
  final double hem;
  final double ffem;
  final CampaignModel campaignModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
     var formatter = NumberFormat('#,##,000');

    return Container(
      width: 172 * fem,
      margin: EdgeInsets.only(left: 15 * fem),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15 * fem),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Color(0x0c000000),
              offset: Offset(0 * fem, 5 * fem),
              blurRadius: 5 * fem)
        ]
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 5*hem, right: 5*fem, left: 5*fem),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10 * fem),
                    topRight: Radius.circular(10 * fem)),
                child: Container(
                  height: 150 * hem,
                  width: 180 * fem,
                  child: Image.network(
                    campaignModel.image,
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 170 * fem,
                        height: 180 * hem,
                        child: Image.asset(
                          'assets/images/campaign-default.png',
                          width: 40 * fem,
                          height: 40 * hem,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150*fem,
                  padding: EdgeInsets.only(top: 5 * hem),
                  child: Text(
                    campaignModel.brandName,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                      fontSize: 13 * ffem,
                      color: kDarkPrimaryColor,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                  left: 10 * fem, right: 10 * fem, top: 5 * hem),
              child: Text(
                campaignModel.campaignName,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                  fontSize: 14 * ffem,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12 * fem),
                  child: Text(
                    'Nhận:',
                    style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                      fontSize: 13 * ffem,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 2 * fem),
                  child: Text(
                    '${formatter.format(campaignModel.totalIncome)}',
                    style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                      fontSize: 12 * ffem,
                      color: Colors.red,
                      fontWeight: FontWeight.normal,
                    )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 2 * fem, top: 2 * hem, bottom: 2 * hem),
                  child: SvgPicture.asset(
                    'assets/icons/red-bean-icon.svg',
                    width: 20 * fem,
                    height: 17 * fem,
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {},
                child: Container(
                    width: 80 * fem,
                    height: 30 * hem,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        border: Border.all(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        'Chi tiết',
                        style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
