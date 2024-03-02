import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField(
      {super.key,
      required this.hem,
      required this.fem,
      required this.ffem,
      required this.validator,
      required this.textController});

  final double hem;
  final double fem;
  final double ffem;
  final FormFieldValidator<String> validator;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: textController,
      style: GoogleFonts.nunito(
          textStyle: TextStyle(
              color: Colors.black,
              fontSize: 17 * ffem,
              fontWeight: FontWeight.w700)),
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Nhập số điện thoại",
        hintStyle: GoogleFonts.nunito(
            textStyle: TextStyle(
                color: kLowTextColor,
                fontSize: 17 * ffem,
                fontWeight: FontWeight.w700)),
      ),
    );
  }
}
