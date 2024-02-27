import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/data/models.dart';

import '../../../../config/constants.dart';

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
    return Container(
      margin:
          EdgeInsets.only(left: 15 * fem, right: 10 * fem, bottom: 15 * hem),
      width: 350 * fem,
      height: 160 *hem,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15 * fem),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color(0x0c000000),
                offset: Offset(5 * fem, 5 * fem),
                blurRadius: 5 * fem)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10*fem),
              bottomLeft: Radius.circular(10*fem)
            ),
            child: Container(
              width: 130*fem,
              height: 160*hem,
              child: Image.asset(
                // campaignModel.image,
                CampaignDemo.listCampaign[0].assetImage,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/campaign-default.png',
                  );
                },
              ),
            ),
          ),
          SizedBox(
            width: 10 * fem,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Padding(
                padding: EdgeInsets.only(top: 5*hem, bottom: 10*hem ),
                child: Text(campaignModel.brandName,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                      fontSize: 13 * ffem,
                      color: kDarkPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ))),
              ),
              Container(
                width: 200 * fem,
                // height: 45*hem,
                child: Text(campaignModel.campaignName,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                      fontSize: 15 * ffem,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ))
                    
                    ),
              ),
              Container(
                width: 200 * fem,
                child: Text('Thời gian tham gia chiến dịch:',
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
                child:
                    Text('${campaignModel.startOn} - ${campaignModel.endOn}',
                        softWrap: true,
                        style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                          fontSize: 12 * ffem,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ))),
              ),
              TextButton(
                onPressed: onTap,
                child: Container(
                    margin: EdgeInsets.only(left: 100*fem),
                    width: 85 * fem,
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
            ],
          )
        ],
      ),
    );
  }
}
