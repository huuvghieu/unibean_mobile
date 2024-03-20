import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';

class Body extends StatelessWidget {
  const Body(
      {super.key,
      required this.campignId,
      required this.campaignDetailId,
      required this.studentId,
      required this.quantity,
      required this.description,
      required this.voucherName,
      required this.campaignName,
      required this.total,
      required this.priceVoucher
      });

  final String campignId;
  final String campaignDetailId;
  final String studentId;
  final int quantity;
  final String description;
  final String voucherName;
  final String campaignName;
  final double total;
  final double priceVoucher;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double baseHeight = 812;
    double ffem = fem * 0.97;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(left: 15 * fem, right: 15 * fem),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15 * hem,
            ),
            Text(
              'CHI TIẾT GIAO DỊCH',
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.bold,
                      height: 1.3625 * ffem / fem,
                      color: Colors.black)),
            ),
            SizedBox(
              height: 15 * hem,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                  left: 15 * fem,
                  right: 15 * fem,
                  top: 5 * hem,
                  bottom: 5 * hem),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: kPrimaryColor)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50 * hem,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Nội dung',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey)),
                        ),
                        Container(
                          width: 120 * fem,
                          child: Text(
                            '$voucherName',
                            textAlign: TextAlign.justify,
                            maxLines: 2,
                            softWrap: true,
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50 * hem,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Chiến dịch',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey)),
                        ),
                        Container(
                          width: 120 * fem,
                          child: Text(
                            '$campaignName',
                            textAlign: TextAlign.justify,
                            maxLines: 2,
                            softWrap: true,
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50 * hem,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Số đậu xanh',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey)),
                        ),
                        Text(
                          '${formatter.format(priceVoucher)}',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  fontSize: 15 * ffem,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50 * hem,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Số lượng',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey)),
                        ),
                        Text(
                          '$quantity',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  fontSize: 15 * ffem,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Divider(),
                  ),
                  Container(
                    height: 50 * hem,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'TỔNG ĐẬU XANH',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                        Text(
                          '${formatter.format(total)}',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  fontSize: 20 * ffem,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
