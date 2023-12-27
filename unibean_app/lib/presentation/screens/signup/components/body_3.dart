import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:unibean_app/presentation/constants.dart';
import 'package:unibean_app/presentation/screens/signup/screens/signup_4_screen.dart';
import 'package:unibean_app/presentation/widgets/drop_down_text_field_default.dart';

class Body3 extends StatefulWidget {
  Body3({super.key});

  @override
  State<Body3> createState() => _Body3State();
}

class _Body3State extends State<Body3> {
  final dobController = TextEditingController();

  @override
  void dispose() {
    dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/bg_signup_3.png'),
        )),
        child: Column(
          children: [
            SizedBox(
              height: 400 * hem,
            ),
            Text(
              'Các thông tin khác về bạn',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w900,
                      height: 1.3625 * ffem / fem,
                      color: Colors.black)),
            ),
            SizedBox(
              height: 10 * hem,
            ),
            Text(
              'Chúng mình mong muốn tìm hiểu thêm\n về bạn để cung cấp và giới thiệu cho bạn\n các hoạt động phù hợp.',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.3625 * ffem / fem,
                      color: kLowTextColor)),
            ),
            SizedBox(
              height: 18 * hem,
            ),
            Container(
              width: 318 * fem,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15 * fem),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0c000000),
                      offset: Offset(0 * fem, 4 * fem),
                      blurRadius: 2.5 * fem,
                    )
                  ]),
              child: Column(
                children: [
                  SizedBox(
                    height: 25 * hem,
                  ),
                  DropDownTextFieldDefault(
                    fem: fem,
                    hem: hem,
                    ffem: ffem,
                    hintText: 'Khác',
                    labelText: 'GIỚI TÍNH *',
                  ),
                  SizedBox(
                    height: 20 * hem,
                  ),
                  BirthdayForm(
                    hem: hem,
                    fem: fem,
                    ffem: ffem,
                    controller: dobController,
                  ),
                  SizedBox(
                    height: 20 * hem,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20 * hem,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, SignUp4Screen.routeName);
              },
              child: Container(
                width: 300 * fem,
                height: 45 * hem,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(23 * fem)),
                child: Center(
                  child: Text(
                    'Tiếp tục',
                    style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                            fontSize: 17 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.3625 * ffem / fem,
                            color: Colors.white)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BirthdayForm extends StatefulWidget {
  const BirthdayForm(
      {super.key,
      required this.hem,
      required this.fem,
      required this.ffem,
      required this.controller});

  final double hem;
  final double fem;
  final double ffem;
  final TextEditingController controller;

  @override
  State<BirthdayForm> createState() => _BirthdayFormState();
}

class _BirthdayFormState extends State<BirthdayForm> {
  DateTime? date = DateTime.now();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42 * widget.hem,
      width: 272 * widget.fem,
      child: TextFormField(
        style: GoogleFonts.nunito(
            textStyle: TextStyle(
                color: Colors.black,
                fontSize: 17 * widget.ffem,
                fontWeight: FontWeight.w700)),
        keyboardType: TextInputType.number,
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: 'NGÀY SINH *',
          hintText: '01/01/2000',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: GoogleFonts.nunito(
            textStyle: TextStyle(
                color: kPrimaryColor,
                fontSize: 15 * widget.ffem,
                fontWeight: FontWeight.w900),
          ),
          hintStyle: GoogleFonts.nunito(
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
        onTap: () async {
          date = DateTime(1900);
          date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now());
          String formateDate = DateFormat('yyy-MM-dd').format(date!);
          widget.controller.text = formateDate;
        },
      ),
    );
  }
}
