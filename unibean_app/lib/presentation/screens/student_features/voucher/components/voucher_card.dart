import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/data/models.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/screens.dart';

class VoucherCard extends StatelessWidget {
  const VoucherCard(
      {super.key,
      required this.fem,
      required this.hem,
      required this.ffem,
      required this.voucherModel});

  final double fem;
  final double hem;
  final double ffem;
  final VoucherModel voucherModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, VoucherDetailScreen.routeName,
            arguments: voucherModel.id);
      },
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
                  padding: EdgeInsets.only(
                      top: 5 * hem, right: 5 * fem, left: 5 * fem),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10 * fem),
                        topRight: Radius.circular(10 * fem)),
                    child: Container(
                      height: 150 * hem,
                      width: 180 * fem,
                      child: Image.network(
                        voucherModel.image,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset('assets/images/image-404.jpg');
                        },
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 150 * fem,
                    padding: EdgeInsets.only(top: 5 * hem),
                    child: Text(
                      voucherModel.brandName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                        fontSize: 13 * ffem,
                        color: kLowTextColor,
                        fontWeight: FontWeight.normal,
                      )),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 10 * fem, right: 10 * fem, top: 5 * hem),
                  child: Text(
                    voucherModel.voucherName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
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
            left: 8 * fem,
            bottom: 5 * hem,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10 * fem),
                      child: Text(
                        '${formatter.format(voucherModel.price)}',
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                          fontSize: 14 * ffem,
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
                        width: 24 * fem,
                        height: 22 * fem,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
