import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/constants.dart';
import '../../../screens.dart';

class NotUseButton extends StatelessWidget {
  const NotUseButton({
    super.key,
    required this.fem,
    required this.hem,
    required this.id,
  });

  final double fem;
  final double hem;
  final String id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, QRVoucherScreen.routeName,
            arguments: id);
      },
      child: Center(
        child: Text(
          'Mã QR',
          style: GoogleFonts.openSans(
              textStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor)),
        ),
      ),
    );
  }
}
