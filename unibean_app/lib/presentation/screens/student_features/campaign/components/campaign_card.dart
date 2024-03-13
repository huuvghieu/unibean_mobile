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

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: 172 * fem,
            margin: EdgeInsets.only(left: 10 * fem),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15 * fem),
              color: Colors.white,
              
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 5*fem, left: 5*fem, top: 5*hem),
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
                              'assets/images/image-404.jpg',
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150*fem,
                      padding: EdgeInsets.only(top: 5 * hem),
                      child: Text(
                        campaignModel.brandName,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                          fontSize: 13 * ffem,
                          color: kLowTextColor,
                          fontWeight: FontWeight.normal,
                        )),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 10*fem, right: 10*fem,
                      top: 5 * hem),
                  child: Text(
                    campaignModel.campaignName,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                      fontSize: 13 * ffem,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    )),
                  ),
                ),
               
              
              ],
            ),
          ),
           Positioned(
            bottom: 3*hem,
            left: 10*fem,
             child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10*fem),
                      child: Text(
                        'Nhận:',
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                          fontSize: 12 * ffem,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5 * fem),
                      child: Text(
                        '${formatter.format(campaignModel.totalIncome)}',
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                          fontSize: 14 * ffem,
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
                        height: 18 * fem,
                      ),
                    )
                  ],
                ),
           ),
        ],
      ),
    );
  }
}
