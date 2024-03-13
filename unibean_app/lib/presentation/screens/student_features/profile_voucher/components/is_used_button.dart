import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class IsUsedButton extends StatelessWidget {
  const IsUsedButton({
    super.key,
    required this.fem,
    required this.hem,
  });

  final double fem;
  final double hem;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Đã sử dụng',
      style: GoogleFonts.openSans(
          textStyle: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w600, color: Colors.grey)),
    );
  }
}
