import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';

class OthersInforBrandDetail extends StatelessWidget {
  const OthersInforBrandDetail({
    super.key,
    required this.hem,
    required this.fem,
    required this.ffem,
  });

  final double hem;
  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10 * hem,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  width: 40 * fem,
                  height: 40 * hem,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[100],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.favorite,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
              Text(
                '1k Theo dõi',
                style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                        fontSize: 10 * fem,
                        fontWeight: FontWeight.w600,
                        height: 1.3625 * ffem / fem,
                        color: kLowTextColor)),
              )
            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  width: 40 * fem,
                  height: 40 * hem,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[100],
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/campaign-navbar-icon.svg',
                      colorFilter: ColorFilter.mode(
                          kPrimaryColor, BlendMode.srcIn),
                          width: 18*fem,
                          height: 18*hem,
                    ),
                  ),
                ),
              ),
              Text(
                '5 Chiến dịch',
                style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                        fontSize: 10 * fem,
                        fontWeight: FontWeight.w600,
                        height: 1.3625 * ffem / fem,
                        color: kLowTextColor)),
              )
            ],
          )
        ],
      ),
    );
  }
}
