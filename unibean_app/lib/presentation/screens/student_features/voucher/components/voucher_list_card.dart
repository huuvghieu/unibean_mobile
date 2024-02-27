import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';

import '../../../../../data/models.dart';

class VoucherListCard extends StatelessWidget {
  const VoucherListCard(
      {super.key,
      required this.fem,
      required this.hem,
      required this.ffem,
      required this.voucherModel,
      required this.onPressed});

  final double fem;
  final double hem;
  final double ffem;
  final VoucherModel voucherModel;
  final VoidCallback onPressed;

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
        height: 180 * hem,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10 * fem),
                  bottomLeft: Radius.circular(10 * fem)),
              child: Container(
                width: 140 * fem,
                height: 180 * hem,
                child: Image.asset(
                  // campaignModel.image,
                  'assets/images/voucher2.jpg',
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
              width: 5 * fem,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5 * hem, bottom: 5 * hem),
                  child: Text(voucherModel.brandName,
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
                  child: Text(voucherModel.voucherName,
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
                  height: 5 * hem,
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
                  height: 5 * hem,
                ),
                Container(
                  width: 200 * fem,
                  child: Text('Số lượng: ${voucherModel.numberOfItems}',
                      softWrap: true,
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                        fontSize: 12 * ffem,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ))),
                ),
                TextButton(
                  onPressed: onPressed,
                  child: Container(
                      margin: EdgeInsets.only(left: 100 * fem),
                      width: 85 * fem,
                      height: 30 * hem,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          border: Border.all(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          'Thu nhập',
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
      ),
    );
  }
}
