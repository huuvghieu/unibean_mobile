import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../config/constants.dart';

class IsClaimedButton extends StatelessWidget {
  const IsClaimedButton({
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
              border: Border.all(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: Text(
              'Đã nhận',
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor)),
            ),
          )),
    );
  }
}
