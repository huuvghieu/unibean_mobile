import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/constants.dart';

class TextFormFieldDefault extends StatelessWidget {
  const TextFormFieldDefault(
      {super.key,
      required this.hem,
      required this.fem,
      required this.ffem,
      required this.labelText,
      required this.hintText});

  final double hem;
  final double fem;
  final double ffem;
  final String labelText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42 * hem,
      width: 272 * fem,
      child: TextFormField(
        style: GoogleFonts.nunito(
            textStyle: TextStyle(
                color: Colors.black,
                fontSize: 17 * ffem,
                fontWeight: FontWeight.w700)),
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: GoogleFonts.nunito(
            textStyle: TextStyle(
                color: kPrimaryColor,
                fontSize: 15 * ffem,
                fontWeight: FontWeight.w900),
          ),
          hintStyle: GoogleFonts.nunito(
              textStyle: TextStyle(
                  color: kLowTextColor,
                  fontSize: 17 * ffem,
                  fontWeight: FontWeight.w700)),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 26 * fem, vertical: 10 * hem),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28 * fem),
              borderSide: BorderSide(
                  width: 2, color: const Color.fromARGB(255, 220, 220, 220)),
              gapPadding: 10),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28 * fem),
              borderSide: BorderSide(
                  width: 2, color: const Color.fromARGB(255, 220, 220, 220)),
              gapPadding: 10),
        ),
      ),
    );
  }
}
