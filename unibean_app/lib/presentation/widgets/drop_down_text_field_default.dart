import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/data/models.dart';
import 'package:unibean_app/presentation/config/constants.dart';

class DropDownTextFieldDefault extends StatefulWidget {
  final double hem;
  final double fem;
  final double ffem;
  final String labelText;
  final String hintText;
  const DropDownTextFieldDefault({
    super.key,
    required this.hem,
    required this.fem,
    required this.ffem,
    required this.labelText,
    required this.hintText,
  });

  @override
  State<DropDownTextFieldDefault> createState() =>
      _DropDownTextFieldDefaultState();
}

class _DropDownTextFieldDefaultState extends State<DropDownTextFieldDefault> {
  List<UniversityModel> universities = List.empty();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 43 * widget.hem,
        width: 272 * widget.fem,
        child: DropdownButtonFormField(
          style: GoogleFonts.openSans(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 17 * widget.ffem,
                  fontWeight: FontWeight.w700)),
          decoration: InputDecoration(
            labelText: widget.labelText,
            hintText: widget.hintText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: GoogleFonts.openSans(
              textStyle: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 15 * widget.ffem,
                  fontWeight: FontWeight.w900),
            ),
            hintStyle: GoogleFonts.openSans(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 17 * widget.ffem,
                    fontWeight: FontWeight.w700)),
            contentPadding: EdgeInsets.symmetric(
                horizontal: 26 * widget.fem, vertical: 10 * widget.hem),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28 * widget.fem),
                borderSide: BorderSide(
                    width: 2, color: const Color.fromARGB(255, 220, 220, 220)),
                gapPadding: 10),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28 * widget.fem),
                borderSide: BorderSide(
                    width: 2, color: const Color.fromARGB(255, 220, 220, 220)),
                gapPadding: 10),
          ),
          value: universities[0].id,
          onChanged: (newValue) {
            setState(() {
              // wid
            });
          },
          items: universities.map((u) {
            return DropdownMenuItem(
              child: Text(u.universityName.toString()),
              value: u.id,
            );
          }).toList(),
        ));
  }
}
