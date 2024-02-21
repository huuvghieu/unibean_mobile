// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/presentation/config/constants.dart';
// import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/screens.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/components/step_6/phone_number_text_field.dart';

import '../../../../../cubits/validation/validation_cubit.dart';
import 'button_sign_up_6.dart';

class FormBody6 extends StatefulWidget {
  const FormBody6({
    super.key,
    required this.fem,
    required this.hem,
    required this.ffem,
  });

  final double fem;
  final double hem;
  final double ffem;

  @override
  State<FormBody6> createState() => _FormBody6State();
}

class _FormBody6State extends State<FormBody6> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneNumberController = TextEditingController();
  String? errorString;
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
                PhoneNumberTextField(
                  hem: widget.hem,
                  fem: widget.fem,
                  ffem: widget.ffem,
                  labelText: 'SỐ ĐIỆN THOẠI *',
                  hintText: '0xxx xxx xxx',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Số điện thoại không được bỏ trống';
                    }
                    // else if (!phoneNumberPattern.hasMatch(value)) {
                    //   return 'Số điện thoại không hợp lệ';
                    // }
                    return null;
                  },
                  textController: phoneNumberController,
                ),
                errorString != null
                    ? Padding(
                        padding: EdgeInsets.only(
                          top: 2 * widget.hem,
                          left: 45 * widget.fem,
                        ),
                        child: SizedBox(
                          width: 270 * widget.fem,
                          child: Text(
                            errorString.toString(),
                            style: GoogleFonts.nunito(
                                fontSize: 12 * widget.ffem,
                                fontWeight: FontWeight.normal,
                                height: 1.3625 * widget.ffem / widget.fem,
                                color: kErrorTextColor),
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 5 * widget.hem,
                      ),
                SizedBox(
                  height: 20 * widget.hem,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30 * widget.hem,
          ),
          BlocBuilder<ValidationCubit, ValidationState>(
            builder: (context, state) {
              return ButtonSignUp6(
                  widget: widget,
                  onPressed: () {
                    if (state is CheckPhoneFailed) {
                      if (_formKey.currentState!.validate()) {
                        context
                            .read<ValidationCubit>()
                            .validatePhoneNumber(phoneNumberController.text)
                            .then((value) async {
                          if (value == '') {
                            await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: phoneNumberController.text,
                              verificationCompleted:
                                  (PhoneAuthCredential credential) {
                                Navigator.pushNamed(
                                    context, SignUp6Screen.routeName);
                              },
                              verificationFailed: (FirebaseAuthException e) {
                                if (e.code == 'invalid-phone-number') {
                                  setState(() {
                                    errorString = 'Số điện thoại không hợp lệ';
                                  });
                                }
                              },
                              codeSent:
                                  (String verificationId, int? resendToken) {},
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {},
                            );
                          } else {
                            setState(() {
                              if (state.error ==
                                  '["Số điện thoại không hợp lệ"]') {
                                errorString = 'Số điện thoại không hợp lệ';
                              }
                            });
                          }
                        });
                      }
                    } else {
                      if (_formKey.currentState!.validate()) {
                        context
                            .read<ValidationCubit>()
                            .validatePhoneNumber(phoneNumberController.text)
                            .then((value) async {
                          if (value == '') {
                            await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: phoneNumberController.text,
                              verificationCompleted:
                                  (PhoneAuthCredential credential) {
                                Navigator.pushNamed(
                                    context, SignUp6Screen.routeName,
                                    arguments: phoneNumberController.text);
                              },
                              verificationFailed: (FirebaseAuthException e) {
                                if (e.code == 'invalid-phone-number') {
                                  setState(() {
                                    errorString = 'Số điện thoại không hợp lệ';
                                  });
                                }
                              },
                              codeSent: (String verificationId,
                                  int? resendToken) async {
                                AuthenLocalDataSource.saveVerificationId(
                                    verificationId);
                              },
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {
                                AuthenLocalDataSource.saveVerificationId(
                                    verificationId);
                              },
                            );
                            Navigator.pushNamed(
                                context, SignUp7Screen.routeName,
                                arguments: phoneNumberController.text);
                          } else {
                            if (value == '["Số điện thoại không hợp lệ"]') {
                              setState(() {
                                errorString = 'Số điện thoại không hợp lệ';
                              });
                            }
                          }
                        });
                      }
                    }
                  });
            },
          ),
        ],
      ),
    );
  }
}
