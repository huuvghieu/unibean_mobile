import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/screens.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/components/step_5/phone_number_text_field.dart';

import '../../../../../cubits/validation/validation_cubit.dart';
import 'button_sign_up_5.dart';

class FormBody5 extends StatefulWidget {
  const FormBody5({
    super.key,
    required this.fem,
    required this.hem,
    required this.ffem,
  });

  final double fem;
  final double hem;
  final double ffem;

  @override
  State<FormBody5> createState() => _FormBody5State();
}

class _FormBody5State extends State<FormBody5> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneNumberController = TextEditingController();
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
                    } else if (!phoneNumberPattern.hasMatch(value)) {
                      return 'Số điện thoại không hợp lệ';
                    }
                    return null;
                  },
                  textController: phoneNumberController,
                ),
                SizedBox(
                  height: 25 * widget.hem,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30 * widget.hem,
          ),
          BlocBuilder<ValidationCubit, ValidationState>(
            builder: (context, state) {
              return ButtonSignUp5(
                  widget: widget,
                  onPressed: () {
                    if (state is CheckPhoneFailed) {
                      if (_formKey.currentState!.validate()) {
                        context
                            .read<ValidationCubit>()
                            .validatePhoneNumber(phoneNumberController.text)
                            .then((value) {
                          if (value == '') {
                            Navigator.pushNamed(
                              context,
                              SignUp6Screen.routeName,
                            );
                          } else {
                            return null;
                          }
                        });
                      }
                    } else {
                      if (_formKey.currentState!.validate()) {
                        context
                            .read<ValidationCubit>()
                            .validatePhoneNumber(phoneNumberController.text)
                            .then((value) {
                          if (value == '') {
                            // Navigator.pushNamed(
                            //   context,
                            //   SignUp6Screen.routeName,
                            // );
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
