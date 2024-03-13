import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../data/models.dart';
import '../../../../config/constants.dart';

class CampaignInformationCard extends StatelessWidget {
  const CampaignInformationCard({
    super.key,
    required this.hem,
    required this.fem,
    required this.ffem,
    required this.campaignDetil,
  });

  final double hem;
  final double fem;
  final double ffem;
  final CampaignDetailModel campaignDetil;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: EdgeInsets.only(top: 15 * hem, bottom: 15 * hem),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15 * fem),
            child: Text(
              'THÔNG TIN CHIẾN DỊCH CUNG CẤP',
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                fontSize: 15 * ffem,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: 5 * hem, left: 5 * fem, bottom: 5 * hem),
                padding: EdgeInsets.only(left: 15 * fem),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10 * fem),
                  child: Container(
                    width: 80 * fem,
                    height: 90 * hem,
                    child: Image.network(
                      campaignDetil.image,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/image-404.jpg',
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10 * fem,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5 * hem, bottom: 5 * hem),
                    child: Text(campaignDetil.brandName,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                          fontSize: 13 * ffem,
                          color: kLowTextColor,
                          fontWeight: FontWeight.normal,
                        ))),
                  ),
                  Container(
                    width: 200 * fem,
                    // height: 45*hem,
                    child: Text(campaignDetil.campaignName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                          fontSize: 14 * ffem,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ))),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
