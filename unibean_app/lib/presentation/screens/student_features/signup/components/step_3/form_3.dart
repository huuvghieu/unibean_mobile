import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/components/step_3/birthday_form.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/components/step_3/drop_down_gender.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/screens/signup_4_screen.dart';

class FormBody3 extends StatefulWidget {
  const FormBody3({
    super.key,
    required this.fem,
    required this.hem,
    required this.ffem,
    required this.dobController,
  });

  final double fem;
  final double hem;
  final double ffem;
  final TextEditingController dobController;

  @override
  State<FormBody3> createState() => _FormBody3State();
}

class _FormBody3State extends State<FormBody3> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            width: 318 * widget.fem,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15 * widget.fem),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0c000000),
                    offset: Offset(0 * widget.fem, 4 * widget.fem),
                    blurRadius: 2.5 * widget.fem,
                  )
                ]),
            child: Column(
              children: [
                SizedBox(
                  height: 25 * widget.hem,
                ),
                DropDownGender(
                  fem: widget.fem,
                  hem: widget.hem,
                  ffem: widget.ffem,
                  hintText: 'Khác',
                  labelText: 'GIỚI TÍNH *',
                ),
                SizedBox(
                  height: 20 * widget.hem,
                ),
                BirthdayForm(
                  hem: widget.hem,
                  fem: widget.fem,
                  ffem: widget.ffem,
                  controller: widget.dobController,
                ),
                SizedBox(
                  height: 20 * widget.hem,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20 * widget.hem,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, SignUp4Screen.routeName);
            },
            child: Container(
              width: 300 * widget.fem,
              height: 45 * widget.hem,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(23 * widget.fem)),
              child: Center(
                child: Text(
                  'Tiếp tục',
                  style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                          fontSize: 17 * widget.ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.3625 * widget.ffem / widget.fem,
                          color: Colors.white)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
