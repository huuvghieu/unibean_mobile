import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/presentation/cubits/validation/validation_cubit.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/components/step_4/button_sign_up_4.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/components/step_4/drop_down_major.dart';
import 'package:unibean_app/presentation/widgets/text_form_field_default.dart';

import '../../../../../config/constants.dart';
import '../../../../screens.dart';
import 'content_4.dart';

class FormBody4 extends StatefulWidget {
  const FormBody4({
    super.key,
    required this.fem,
    required this.hem,
    required this.ffem,
  });

  final double fem;
  final double hem;
  final double ffem;

  @override
  State<FormBody4> createState() => _FormBody4State();
}

class _FormBody4State extends State<FormBody4> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController studentCodeController = TextEditingController();
  TextEditingController majorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          BlocBuilder<ValidationCubit, ValidationState>(
            builder: (context, state) {
              print(state);
              if (state is CheckStudentCodeFailed) {
                return Container(
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
                        height: 40 * widget.hem,
                      ),
                      TextFormFieldDefault(
                        hem: widget.hem,
                        fem: widget.fem,
                        ffem: widget.ffem,
                        labelText: 'MÃ SỐ SINH VIÊN *',
                        hintText: 'UNIBEAN123123',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'MSSV không được bỏ trống';
                          }
                          return null;
                        },
                        textController: studentCodeController,
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
                            style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                    color: kErrorTextColor,
                                    fontSize: 12 * widget.ffem,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20 * widget.hem,
                      ),
                      DropDownMajor(
                        hem: widget.hem,
                        fem: widget.fem,
                        ffem: widget.ffem,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Chuyên ngành không được bỏ trống';
                          }
                          return null;
                        },
                        labelText: 'CHUYÊN NGÀNH *',
                        hintText: 'Chọn chuyên ngành',
                        majorController: majorController,
                      ),
                      SizedBox(
                        height: 40 * widget.hem,
                      ),
                    ],
                  ),
                );
              }
              return Content4(
                widget: widget,
                studentCodeController: studentCodeController,
                majorController: majorController,
              );
            },
          ),
          SizedBox(
            height: 10 * widget.hem,
          ),
          BlocBuilder<ValidationCubit, ValidationState>(
            builder: (context, state) {
              return ButtonSignUp4(
                  widget: widget,
                  onPressed: () {
                    if (state is CheckStudentCodeFailed) {
                      if (_formKey.currentState!.validate()) {
                        context
                            .read<ValidationCubit>()
                            .validateStudentCode(studentCodeController.text)
                            .then((value) async {
                          if (value == '') {
                            final createAuthenModel =
                                await AuthenLocalDataSource.getCreateAuthen();
                            createAuthenModel!.code =
                                studentCodeController.text;
                            createAuthenModel.majorId = majorController.text;
                            String createAuthenString =
                                jsonEncode(createAuthenModel);
                            AuthenLocalDataSource.saveCreateAuthen(
                                createAuthenString);
                            print(createAuthenString);
                            Navigator.pushNamed(
                                context, SignUp5Screen.routeName,
                                arguments: SignUp1Screen.defaultRegister);
                          } else {
                            return null;
                          }
                        });
                      }
                    } else {
                      if (_formKey.currentState!.validate()) {
                        context
                            .read<ValidationCubit>()
                            .validateStudentCode(studentCodeController.text)
                            .then((value) async {
                          if (value == '') {
                            final createAuthenModel =
                                await AuthenLocalDataSource.getCreateAuthen();
                            createAuthenModel!.code =
                                studentCodeController.text;
                            createAuthenModel.majorId = majorController.text;
                            String createAuthenString =
                                jsonEncode(createAuthenModel);
                            AuthenLocalDataSource.saveCreateAuthen(
                                createAuthenString);
                            Navigator.pushNamed(
                                context, SignUp5Screen.routeName,
                                arguments: SignUp1Screen.defaultRegister);
                          } else {
                            return null;
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
