// import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/presentation/config/constants.dart';
// import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/screens.dart';

import '../../../../../cubits/validation/validation_cubit.dart';
import 'button_sign_up_7.dart';
import 'content_7.dart';
import 'phone_number_text_field.dart';

class FormBody7 extends StatefulWidget {
  const FormBody7({
    super.key,
    required this.fem,
    required this.hem,
    required this.ffem,
  });

  final double fem;
  final double hem;
  final double ffem;

  @override
  State<FormBody7> createState() => _FormBody7State();
}

class _FormBody7State extends State<FormBody7> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  String? errorString;

  @override
  void initState() {
    countryController.text = "+84";
    super.initState();
  }

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
                BlocBuilder<ValidationCubit, ValidationState>(
                  builder: (context, state) {
                    if (state is CheckPhoneFailed) {
                      return Column(
                        children: [
                          Container(
                            width: 272 * widget.fem,
                            height: 80 * widget.hem,
                            child: InputDecorator(
                              decoration: InputDecoration(
                                labelText: 'SỐ ĐIỆN THOẠI *',
                                // hintText: hintText,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                labelStyle: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 15 * widget.ffem,
                                      fontWeight: FontWeight.w900),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 26 * widget.fem,
                                    vertical: 10 * widget.hem),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(28 * widget.fem),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: const Color.fromARGB(
                                            255, 220, 220, 220)),
                                    gapPadding: 10),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(28 * widget.fem),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: const Color.fromARGB(
                                            255, 220, 220, 220)),
                                    gapPadding: 10),
                                errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(28 * widget.fem),
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: const Color.fromARGB(
                                            255, 220, 220, 220)),
                                    gapPadding: 10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 40,
                                    child: TextField(
                                      readOnly: true,
                                      controller: countryController,
                                      style: GoogleFonts.openSans(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17 * widget.ffem,
                                              fontWeight: FontWeight.w700)),
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "|",
                                    style: TextStyle(
                                        fontSize: 33, color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: PhoneNumberTextField(
                                    fem: widget.fem,
                                    ffem: widget.ffem,
                                    hem: widget.hem,
                                    textController: phoneNumberController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Số điện thoại không được bỏ trống';
                                      } else if (!phoneNumberPattern
                                          .hasMatch(value)) {
                                        return 'Số điện thoại không hợp lệ';
                                      }
                                      return null;
                                    },
                                  ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3 * widget.hem,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 48 * widget.fem),
                              child: Text(
                                state.error.toString(),
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        color: kErrorTextColor,
                                        fontSize: 12 * widget.ffem,
                                        fontWeight: FontWeight.normal)),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    return Content7(
                        widget: widget,
                        countryController: countryController,
                        phoneNumberController: phoneNumberController);
                  },
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
                            style: GoogleFonts.openSans(
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
              return ButtonSignUp7(
                  widget: widget,
                  onPressed: () {
                    if (state is CheckPhoneFailed) {
                      if (_formKey.currentState!.validate()) {
                        _submitForm(
                            context, countryController, phoneNumberController);
                      }
                    } else {
                      if (_formKey.currentState!.validate()) {
                        _submitForm(
                            context, countryController, phoneNumberController);
                      }
                    }
                  });
            },
          ),
        ],
      ),
    );
  }

  void _submitForm(
      BuildContext context, countryController, phoneNumberController) async {
    final authenModel = await AuthenLocalDataSource.getAuthen();
    if (authenModel == null) {
      context
          .read<ValidationCubit>()
          .validatePhoneNumber(
              '${countryController.text + phoneNumberController.text}')
          .then((value) async {
        if (value == '') {
          await FirebaseAuth.instance.verifyPhoneNumber(
            phoneNumber:
                '${countryController.text + phoneNumberController.text}',
            verificationCompleted: (PhoneAuthCredential credential) {
              Future.delayed(const Duration(seconds: 2), () {
                Navigator.pushNamed(context, SignUp8Screen.routeName,
                    arguments: phoneNumberController.text);
              });
            },
            verificationFailed: (FirebaseAuthException e) {
              if (e.code == 'invalid-phone-number') {
                setState(() {
                  errorString = 'Số điện thoại không hợp lệ';
                });
              }
            },
            codeSent: (String verificationId, int? resendToken) async {
              AuthenLocalDataSource.saveVerificationId(verificationId);
            },
            codeAutoRetrievalTimeout: (String verificationId) {
              AuthenLocalDataSource.saveVerificationId(verificationId);
            },
          );

          //save phonenumber
          final createAuthenModel =
              await AuthenLocalDataSource.getCreateAuthen();
          createAuthenModel!.phoneNumber =
              '${countryController.text + phoneNumberController.text}';
          String createAuthenString = jsonEncode(createAuthenModel);
          print(createAuthenString);
          AuthenLocalDataSource.saveCreateAuthen(createAuthenString);
          //go to next screen
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pushNamed(context, SignUp8Screen.routeName,
                arguments: phoneNumberController.text);
          });
        } else {
          if (value == '["Số điện thoại không hợp lệ"]') {
            setState(() {
              errorString = 'Số điện thoại không hợp lệ';
            });
          }
        }
      });
    } else {
      context
          .read<ValidationCubit>()
          .validatePhoneNumber(
              '${countryController.text + phoneNumberController.text}')
          .then((value) async {
        if (value == '') {
          await FirebaseAuth.instance.verifyPhoneNumber(
            phoneNumber:
                '${countryController.text + phoneNumberController.text}',
            verificationCompleted: (PhoneAuthCredential credential) {
              Future.delayed(const Duration(seconds: 2), () {
                Navigator.pushNamed(context, SignUp8Screen.routeName,
                    arguments: phoneNumberController.text);
              });
            },
            verificationFailed: (FirebaseAuthException e) {
              if (e.code == 'invalid-phone-number') {
                setState(() {
                  errorString = 'Số điện thoại không hợp lệ';
                });
              }
            },
            codeSent: (String verificationId, int? resendToken) async {
              AuthenLocalDataSource.saveVerificationId(verificationId);
            },
            codeAutoRetrievalTimeout: (String verificationId) {
              AuthenLocalDataSource.saveVerificationId(verificationId);
            },
          );

          //save phonenumber
          final verifyAuthenModel =
              await AuthenLocalDataSource.getVerifyAuthen();
          verifyAuthenModel!.phoneNumber =
              '${countryController.text + phoneNumberController.text}';
          String verifyAuthenString = jsonEncode(verifyAuthenModel);
          AuthenLocalDataSource.saveVerifyAuthen(verifyAuthenString);

          //go to next screen
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pushNamed(context, SignUp8Screen.routeName,
                arguments: phoneNumberController.text);
          });
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
}
