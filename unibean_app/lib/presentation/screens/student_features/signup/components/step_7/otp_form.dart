import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/cubits/verification/verification_cubit.dart';
import 'package:unibean_app/presentation/screens/screens.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/components/step_7/button_signup_7.dart';

import '../../../../../../data/datasource/authen_local_datasource.dart';

class OTPForm extends StatefulWidget {
  const OTPForm({
    super.key,
    required this.fem,
    required this.hem,
    required this.defaultPinTheme,
    required this.ffem,
    required this.phoneNumber,
  });

  final double fem;
  final double hem;
  final PinTheme defaultPinTheme;
  final double ffem;
  final String phoneNumber;

  @override
  State<OTPForm> createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  final _formKey = GlobalKey<FormState>();
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  String? errorString;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            width: 350 * widget.fem,
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
                Container(
                  child: Pinput(
                    controller: pinController,
                    focusNode: focusNode,
                    length: 6,
                    defaultPinTheme: widget.defaultPinTheme,
                    focusedPinTheme: widget.defaultPinTheme,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập mã xác nhận';
                      }
                      return null;
                    },
                  ),
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
          BlocBuilder<VerificationCubit, VerificationState>(
            builder: (context, state) {
              return ButtonSignUp7(
                widget: widget,
                onPressed: () {
                  if (state is OTPVerificationFailed) {
                    setState(() {
                      errorString = state.error;
                    });
                    if (_formKey.currentState!.validate()) {
                      context
                          .read<VerificationCubit>()
                          .verifyOTP(pinController.text)
                          .then((value) async {
                        if (value!) {
                          final createAuthenModel =
                              await AuthenLocalDataSource.getCreateAuthen();
                          context.read<AuthenticationBloc>().add(
                              RegisterAccount(
                                  createAuthenModel: createAuthenModel!));
                          Navigator.pushNamedAndRemoveUntil(
                              context,
                              SignUp8Screen.routeName,
                              (Route<dynamic> route) => false);
                        } else {}
                      });
                    }
                  } else {
                    if (_formKey.currentState!.validate()) {
                      context
                          .read<VerificationCubit>()
                          .verifyOTP(pinController.text)
                          .then((value) async {
                        if (value!) {
                          final createAuthenModel =
                              await AuthenLocalDataSource.getCreateAuthen();
                          context.read<AuthenticationBloc>().add(
                              RegisterAccount(
                                  createAuthenModel: createAuthenModel!));
                          // Navigator.pushNamedAndRemoveUntil(
                          //     context,
                          //     SignUp8Screen.routeName,
                          //     (Route<dynamic> route) => false);
                        } else {}
                      });
                    }
                  }
                },
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20 * widget.hem),
                child: Text(
                  'Bạn không nhận được mã xác nhận?',
                  style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                          fontSize: 13 * widget.ffem,
                          fontWeight: FontWeight.bold,
                          height: 1.3625 * widget.ffem / widget.fem,
                          color: kLowTextColor)),
                ),
              ),
              InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: widget.phoneNumber,
                    verificationCompleted: (PhoneAuthCredential credential) {
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.pushNamed(context, SignUp7Screen.routeName,
                            arguments: widget.phoneNumber);
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
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 2 * widget.fem, bottom: 20 * widget.hem),
                  child: Text(
                    'Gửi lại mã',
                    style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                            fontSize: 13 * widget.ffem,
                            fontWeight: FontWeight.w900,
                            height: 1.3625 * widget.ffem / widget.fem,
                            color: kPrimaryColor)),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
