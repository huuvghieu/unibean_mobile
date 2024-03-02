import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:unibean_app/presentation/config/constants.dart';

class NameProfile extends StatelessWidget {
  const NameProfile(
      {super.key,
      required this.fem,
      required this.ffem,
      required this.hem,
      required this.name});

  final double fem;
  final double ffem;
  final double hem;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160 * fem,
      child: Row(
        children: [
          Flexible(
            child: Text(
              name,
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
         
        ],
      ),
    );
  }
}
