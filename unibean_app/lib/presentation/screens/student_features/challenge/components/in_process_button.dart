import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';

class InProcessButton extends StatelessWidget {
  const InProcessButton({
    super.key,
    required this.fem,
    required this.hem,
  });

  final double fem;
  final double hem;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
          width: 85 * fem,
          height: 30 * hem,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: kLowTextColor),
              borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: Text(
              'Nhận',
              style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: kLowTextColor)),
            ),
          )),
    );
  }
}
