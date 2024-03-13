import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key,
    required this.fem,
    required this.hem,
    required this.ffem,
    required this.text,
  });

  final double fem;
  final double hem;
  final double ffem;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10 * fem),
      child: Padding(
        padding: EdgeInsets.only(bottom: 10 * hem),
        child: Text(
          text,
          style: GoogleFonts.openSans(
              textStyle: TextStyle(
            fontSize: 16 * ffem,
            color: Colors.black,
            fontWeight: FontWeight.w800,
          )),
        ),
      ),
    );
  }
}
