import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class UniversityProfile extends StatelessWidget {
  const UniversityProfile({
    super.key,
    required this.fem,
    required this.hem,
    required this.ffem,
  });

  final double fem;
  final double hem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.start,
      children: [
        Container(
            width: 12 * fem,
            height: 12 * hem,
            child: SvgPicture.asset(
              'assets/icons/university-icon.svg',
            )),
        SizedBox(
          width: 5 * fem,
        ),
        Text(
          'FPT University',
          style: GoogleFonts.nunito(
              textStyle: TextStyle(
                  fontSize: 10 * ffem,
                  height: 1.3625 * ffem / fem,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
        ),
      ],
    );
  }
}