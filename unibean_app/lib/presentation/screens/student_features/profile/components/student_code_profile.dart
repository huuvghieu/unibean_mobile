import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentCodeProfile extends StatelessWidget {
  const StudentCodeProfile({
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
      padding: EdgeInsets.only(top: 10*hem, bottom: 5*hem),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.start,
        children: [
          Container(
              width: 12 * fem,
              height: 12 * hem,
              child: SvgPicture.asset(
                'assets/icons/id-card-icon.svg',
              )),
          SizedBox(
            width: 5 * fem,
          ),
          Text(
            'SE161967',
            style: GoogleFonts.nunito(
                textStyle: TextStyle(
                    fontSize: 10 * ffem,
                    height: 1.3625 * ffem / fem,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
          ),
        ],
      ),
    );
  }
}