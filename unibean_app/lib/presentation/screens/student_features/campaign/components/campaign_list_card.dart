import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/data/models.dart';

import '../../../../config/constants.dart';
import '../../../../widgets/shimmer_widget.dart';

class CampaignListCard extends StatelessWidget {
  const CampaignListCard(
      {super.key,
      required this.fem,
      required this.hem,
      required this.ffem,
      required this.campaignModel,
      required this.onTap});

  final double fem;
  final double hem;
  final double ffem;
  final CampaignModel campaignModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
              left: 10 * fem, right: 10 * fem, bottom: 15 * hem),
          width: 350 * fem,
          height: 150 * hem,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15 * fem),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: 5 * hem, left: 5 * fem, bottom: 5 * hem),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10 * fem),
                  child: Container(
                    width: 130 * fem,
                    height: 160 * hem,
                    child: Image.network(
                      campaignModel.image,
                      fit: BoxFit.fill,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return ShimmerWidget.rectangular(height: 160 * hem);
                      },
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
                    child: Text(campaignModel.brandName,
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
                    child: Text(campaignModel.campaignName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                          fontSize: 14 * ffem,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ))),
                  ),
                  SizedBox(
                    height: 2 * hem,
                  ),
                  Container(
                    width: 200 * fem,
                    child: Text('Thời gian tham gia chiến dịch:',
                        softWrap: true,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                          fontSize: 13 * ffem,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ))),
                  ),
                  Container(
                    width: 200 * fem,
                    child: Text(
                        '${changeFormateDate(campaignModel.startOn)} - ${changeFormateDate(campaignModel.endOn)}',
                        softWrap: true,
                        style: GoogleFonts.openSans(
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
        Positioned(
          bottom: 25 * hem,
          right: 22 * fem,
          child: Container(
            width: 80 * fem,
            height: 32 * hem,
            decoration: BoxDecoration(
                color: kPrimaryColor,
                border: Border.all(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(5)),
            child: TextButton(
              onPressed: onTap,
              child: Text(
                'Xem ngay',
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        fontSize: 11 * ffem,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
