import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:unibean_app/presentation/blocs/validation/validation_bloc.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/cubits/validation/validation_cubit.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/components/step/button_sign_up.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/components/step/content_form.dart';
import 'package:unibean_app/presentation/widgets/text_form_field_default.dart';
import 'package:unibean_app/presentation/widgets/text_form_field_password.dart';

import '../../../../screens.dart';

class FormBody extends StatefulWidget {
  const FormBody({
    super.key,
    required this.hem,
    required this.fem,
    required this.ffem,
  });

  final double hem;
  final double fem;
  final double ffem;

  @override
  State<FormBody> createState() => _FormBodyState();
}

class _FormBodyState extends State<FormBody> {
  final _formKey = GlobalKey<FormState>();
  var box = Hive.box('myBox');
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Chúng tôi sẽ kết nối với\n tài khoản của bạn!',
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
                textStyle: TextStyle(
                    fontSize: 20 * widget.ffem,
                    fontWeight: FontWeight.w900,
                    height: 1.3625 * widget.ffem / widget.fem,
                    color: Colors.black)),
          ),
          SizedBox(
            height: 20 * widget.hem,
          ),
          Text(
            'Hãy kiểm tra thông tin thật cẩn thận',
            style: GoogleFonts.nunito(
                textStyle: TextStyle(
                    fontSize: 15 * widget.ffem,
                    fontWeight: FontWeight.w600,
                    height: 1.3625 * widget.ffem / widget.fem,
                    color: kLowTextColor)),
          ),
          SizedBox(
            height: 40 * widget.hem,
          ),
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
                    height: 20 * widget.hem,
                  ),
                  BlocBuilder<ValidationCubit, ValidationState>(
                    builder: (context, state) {
                      if (state is CheckUserNameFailed) {
                        Column(
                          children: [
                            TextFormFieldDefault(
                              hem: widget.hem,
                              fem: widget.fem,
                              ffem: widget.ffem,
                              labelText: 'TÀI KHOẢN',
                              hintText: 'unibean123',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Tài khoản không được bỏ trống';
                                } else if (!userNamePattern.hasMatch(value)) {
                                  return 'Tài khoản phải chứa ký tự thường \nhoặc số có độ dài từ 5 đến 50 ký tự';
                                }
                                return null;
                              },
                              textController: userNameController,
                            ),
                            SizedBox(
                              height: 3 * widget.hem,
                            ),
                            Text(
                              state.error.toString(),
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12 * widget.ffem,
                                      fontWeight: FontWeight.w700)),
                            ),
                            SizedBox(
                              height: 25 * widget.hem,
                            ),
                            TextFormFieldPassword(
                              hem: widget.hem,
                              fem: widget.fem,
                              ffem: widget.ffem,
                              labelText: 'MẬT KHẨU *',
                              hintText: '******',
                              isPassword: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Mật khẩu không được bỏ trống';
                                } else if (!passwordPattern.hasMatch(value)) {
                                  return 'Mật khẩu phải chứa ít nhất tám ký tự,\nít nhất một số và cả chữ thường,\nchữ hoa và ký tự đặc biệt.';
                                }
                                return null;
                              },
                              textController: passController,
                            ),
                            SizedBox(
                              height: 25 * widget.hem,
                            ),
                            TextFormFieldPassword(
                              hem: widget.hem,
                              fem: widget.fem,
                              ffem: widget.ffem,
                              labelText: 'XÁC NHẬN MẬT KHẨU *',
                              hintText: '******',
                              isPassword: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Nhập lại mật khẩu không được bỏ trống';
                                } else if (value != passController.text) {
                                  return 'Mật khẩu không khớp';
                                }
                                return null;
                              },
                              textController: confirmPassController,
                            ),
                          ],
                        );
                      }
                      return ContentForm(
                          widget: widget,
                          userNameController: userNameController,
                          passController: passController,
                          confirmPassController: confirmPassController);
                    },
                  ),
                  SizedBox(
                    height: 20 * widget.hem,
                  ),
                ],
              )),
          SizedBox(
            height: 20 * widget.hem,
          ),
          BlocBuilder<ValidationCubit, ValidationState>(
            builder: (context, state) {
              return ButtonSignUp(
                widget: widget,
                onPress: () {
                  if (state is CheckUserNameFailed) {
                    if (_formKey.currentState!.validate()) {
                      context
                          .read<ValidationCubit>()
                          .validateUserName(userNameController.text)
                          .then((value) => null);
                    }
                  } else {
                    if (_formKey.currentState!.validate()) {
                      context
                          .read<ValidationCubit>()
                          .validateUserName(userNameController.text)
                          .then((value) {
                        if (value == '') {
                          box.put('userNameSignUp', userNameController.text);
                          box.put('passSignUp', userNameController.text);
                          box.put('confPassSignUp', confirmPassController.text);
                          Navigator.pushNamed(context, SignUp1Screen.routeName,
                              arguments: true);
                        } else {
                          return null;
                        }
                      });
                    }
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }
}
