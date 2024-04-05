import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      required this.priceVoucher});

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
                      fontSize: 18 * ffem,
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
                  border: Border.all(color: kPrimaryColor),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF757575).withOpacity(0.3),
                      blurRadius: 10.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                      offset: const Offset(
                        5.0, // Move to right 5  horizontally
                        5.0, // Move to bottom 5 Vertically
                      ),
                    )
                  ]),
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
                                  fontSize: 15 * ffem,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey)),
                        ),
                        Container(
                          width: 120 * fem,
                          child: Text(
                            '$voucherName',
                            textAlign: TextAlign.end,
                            maxLines: 2,
                            softWrap: true,
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    fontSize: 16 * ffem,
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
                                  fontSize: 15 * ffem,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey)),
                        ),
                        Container(
                          width: 120 * fem,
                          child: Text(
                            '$campaignName',
                            textAlign: TextAlign.end,
                            maxLines: 2,
                            softWrap: true,
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    fontSize: 16 * ffem,
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
                                  fontSize: 15 * ffem,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey)),
                        ),
                        Text(
                          '${formatter.format(priceVoucher)}',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  fontSize: 16 * ffem,
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
                                  fontSize: 15 * ffem,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey)),
                        ),
                        Text(
                          '$quantity',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  fontSize: 16 * ffem,
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
                                  fontSize: 15 * ffem,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10 * fem),
                              child: Text(
                                '${formatter.format(total)}',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                  fontSize: 25 * ffem,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                )),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 2 * fem, top: 4 * hem, bottom: 2 * hem),
                              child: SvgPicture.asset(
                                'assets/icons/green-bean-icon.svg',
                                width: 28 * fem,
                                height: 28 * fem,
                              ),
                            )
                          ],
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
