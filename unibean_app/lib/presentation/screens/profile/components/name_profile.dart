import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';

class NameProfile extends StatelessWidget {
  const NameProfile({
    super.key,
    required this.fem,
    required this.ffem,
    required this.hem,
  });

  final double fem;
  final double ffem;
  final double hem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150 * fem,
      child: Row(
        children: [
          Flexible(
            child: Text(
              'Le Quang Vinh',
              // softWrap: true,
              maxLines: 2,
              style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w800,
                      height: 1.3625 * ffem / fem,
                      color: Colors.black)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5 * hem, left: 5 * fem),
            child: Icon(
              Icons.check_circle,
              color: kPrimaryColor,
              size: 12.5 * fem,
            ),
          )
        ],
      ),
    );
  }
}
