import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Container(
      width: 180 * fem,
      margin: EdgeInsets.only(left: 5 * fem),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15 * fem),
        color: Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //       color: Color(0x0c000000),
        //       offset: Offset(0 * fem, 10 * fem),
        //       blurRadius: 5 * fem)
        // ]
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10 * fem),
                    topRight: Radius.circular(10 * fem)),
                child: Container(
                  height: 170 * hem,
                  width: 180 * fem,
                  child: Image.asset(
                    CampaignDemo.listCampaign[1].assetImage,
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
                Padding(
                  padding: EdgeInsets.only(top: 5 * hem),
                  child: Text(
                    campaignModel.brandName,
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
            Padding(
              padding: EdgeInsets.only(
                  left: 10 * fem, right: 12 * fem, top: 5 * hem),
              child: Text(
                campaignModel.campaignName,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                  fontSize: 13 * ffem,
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
                    '${campaignModel.totalIncome.toStringAsFixed(0)}',
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
            Padding(
              padding: EdgeInsets.only(left: 75 * fem),
              child: TextButton(
                onPressed: () {},
                child: Container(
                    width: 85 * fem,
                    height: 30 * hem,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        'Chi tiết',
                        style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor)),
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
