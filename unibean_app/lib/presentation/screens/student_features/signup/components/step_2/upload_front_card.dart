import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';

class UpLoadFrontCard extends StatelessWidget {
  const UpLoadFrontCard(
      {super.key,
      required this.fem,
      required this.hem,
      required this.ffem,
      required this.onPressed});

  final double fem;
  final double hem;
  final double ffem;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10 * fem,
      bottom: 18 * fem,
      child: Container(
        width: 120 * fem,
        height: 30 * hem,
        decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor, width: 2),
          borderRadius: BorderRadius.circular(5 * fem),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            'Tải hình mặt trước',
            style: GoogleFonts.openSans(
              textStyle: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 10 * ffem,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
