import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../data/models.dart';
import '../../../../config/constants.dart';
import '../../../screens.dart';

class BrandInformationCard extends StatelessWidget {
  const BrandInformationCard({
    super.key,
    required this.hem,
    required this.fem,
    required this.ffem,
    required this.voucherDetail,
  });

  final double hem;
  final double fem;
  final double ffem;
  final VoucherDetailModel voucherDetail;

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
              'THÔNG TIN THƯƠNG HIỆU CUNG CẤP',
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                fontSize: 15 * ffem,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                        width: 50 * fem,
                        height: 50 * hem,
                        child: Image.network(
                          voucherDetail.brandImage,
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
                        child: Text(voucherDetail.brandName.toUpperCase(),
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                              fontSize: 14 * ffem,
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                            ))),
                      ),
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, BrandDetailScreen.routeName,
                      arguments: voucherDetail.brandId);
                },
                child: Container(
                  height: 30 * hem,
                  margin: EdgeInsets.only(right: 15 * fem),
                  padding: EdgeInsets.only(right: 10 * fem, left: 10 * fem),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: kLowTextColor)),
                  child: Center(
                    child: Text(
                      'Xem tất cả',
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              fontSize: 13 * ffem,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
