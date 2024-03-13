import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';

import '../../data/models.dart';

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
      child: Stack(
        children: [
          Container(
            margin:
                EdgeInsets.only(top: 15 * hem, left: 10 * fem, right: 10 * fem),
            constraints:
                BoxConstraints(maxHeight: 150 * hem, minWidth: 340 * fem),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10 * fem),
                      bottomLeft: Radius.circular(10 * fem)),
                  child: Container(
                    width: 140 * fem,
                    height: 160 * hem,
                    child: Image.network(
                      voucherModel.image,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/image-404.jpg',
                          color: kPrimaryColor,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 8 * fem,
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5 * hem, bottom: 5 * hem),
                      child: Text(voucherModel.brandName,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                            fontSize: 12 * ffem,
                            color: kDarkPrimaryColor,
                            fontWeight: FontWeight.normal,
                          ))),
                    ),
                    Container(
                      width: 200 * fem,
                      child: Text(voucherModel.voucherName,
                          softWrap: true,
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
                      height: 5 * hem,
                    ),
                    Container(
                      width: 180 * fem,
                      child: Text(voucherModel.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: true,
                          style: GoogleFonts.openSans(
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
            bottom: 12 * hem,
            right: 20 * fem,
            child: Container(
              width: 80 * fem,
              height: 32 * hem,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  border: Border.all(color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(5)),
              child: TextButton(
                onPressed: onPressed,
                child: Center(
                  child: Text(
                    'Xem ngay',
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
