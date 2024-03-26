import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../data/models.dart';
import '../../../../config/constants.dart';
import '../../../../widgets/text_form_field_default.dart';

class FromVerification extends StatefulWidget {
  const FromVerification({
    super.key,
    required this.hem,
    required this.fem,
    required this.ffem,
    required this.studentModel,
  });

  final double hem;
  final double fem;
  final double ffem;
  final StudentModel studentModel;

  @override
  State<FromVerification> createState() => _FromVerificationState();
}

class _FromVerificationState extends State<FromVerification> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController codeController = TextEditingController();
  @override
  void initState() {
    codeController.text = widget.studentModel.code;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin:
                EdgeInsets.only(left: 15 * widget.fem, right: 15 * widget.fem),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormFieldDefault(
                  hem: widget.hem,
                  fem: widget.fem,
                  ffem: widget.ffem,
                  labelText: 'MÃ SỐ SINH VIÊN',
                  hintText: 'Nhập mã số sinh viên...',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mã số sinh viê không được bỏ trống';
                    } else if (!vietNameseTextOnlyPattern.hasMatch(value)) {
                      return 'Mã số sinh viê không hợp lệ';
                    }
                    return null;
                  },
                  textController: codeController,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'MẶT TRƯỚC',
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontSize: 13 * widget.ffem,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor)),
                ),
                SizedBox(
                  height: 10 * widget.fem,
                ),
                Container(
                  width: 300 * widget.fem,
                  height: 300 * widget.fem,
                  decoration: BoxDecoration(
                      border: Border.all(color: klightPrimaryColor),
                      borderRadius: BorderRadius.circular(15 * widget.fem),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x0c000000),
                            offset: Offset(0 * widget.fem, 10 * widget.fem),
                            blurRadius: 5 * widget.fem)
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      child: Image(
                        image: NetworkImage(
                          '${widget.studentModel.studentCardFront}',
                        ),
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/ava_signup.png',
                            width: 100 * widget.fem,
                            height: 100 * widget.hem,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'MẶT SAU',
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontSize: 13 * widget.ffem,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor)),
                ),
                SizedBox(
                  height: 10 * widget.fem,
                ),
                Container(
                  width: 300 * widget.fem,
                  height: 300 * widget.fem,
                  decoration: BoxDecoration(
                      border: Border.all(color: klightPrimaryColor),
                      borderRadius: BorderRadius.circular(15 * widget.fem),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x0c000000),
                            offset: Offset(0 * widget.fem, 10 * widget.fem),
                            blurRadius: 5 * widget.fem)
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      child: Image(
                        image: NetworkImage(
                          '${widget.studentModel.studentCardBack}',
                        ),
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/ava_signup.png',
                            width: 100 * widget.fem,
                            height: 100 * widget.hem,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
           SizedBox(
                  height: 10,
                ),
          TextButton(
            onPressed: () {},
            child: Container(
              width: 220 * widget.fem,
              height: 45 * widget.hem,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(23 * widget.fem)),
              child: Center(
                child: Text(
                  'Xác minh',
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontSize: 17 * widget.ffem,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buttonWidget(changed, BuildContext context) {
    if (changed) {
      return TextButton(
        onPressed: () {},
        child: Container(
          width: 220 * widget.fem,
          height: 45 * widget.hem,
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(23 * widget.fem)),
          // child: BlocBuilder<StudentBloc, StudentState>(
          //   builder: (context, state) {
          //     if (state is StudentUpding) {
          //       return Center(
          //           child: CircularProgressIndicator(
          //         color: Colors.white,
          //       ));
          //     } else {
          //       return Center(
          //         child: Text(
          //           'Lưu thông tin',
          //           style: GoogleFonts.openSans(
          //               textStyle: TextStyle(
          //                   fontSize: 17 * widget.ffem,
          //                   fontWeight: FontWeight.w600,
          //                   color: Colors.white)),
          //         ),
          //       );
          //     }
          //   },
          // )
          child: Center(
            child: Text(
              'Lưu thông tin',
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      fontSize: 17 * widget.ffem,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
            ),
          ),
        ),
      );
    } else {
      return TextButton(
        onPressed: () {},
        child: Container(
            width: 220 * widget.fem,
            height: 45 * widget.hem,
            decoration: BoxDecoration(
                color: kLowTextColor,
                borderRadius: BorderRadius.circular(23 * widget.fem)),
            child: Center(
              child: Text(
                'Lưu thông tin',
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        fontSize: 17 * widget.ffem,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
              ),
            )),
      );
    }
  }
}
