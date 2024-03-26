import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/components/step_2/button_sign_up_2.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/components/step_2/drop_down_campus.dart';

import '../../../../../../data/datasource/authen_local_datasource.dart';
import '../../../../screens.dart';
import 'drop_down_university.dart';

class FormBody2 extends StatefulWidget {
  const FormBody2({
    super.key,
    required this.fem,
    required this.hem,
    required this.ffem,
  });

  final double fem;
  final double hem;
  final double ffem;

  @override
  State<FormBody2> createState() => _FormBody2State();
}

class _FormBody2State extends State<FormBody2> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController campusController = TextEditingController();
  // File? _selectedFrontCard;
  // File? _selectedBackCard;
  // String? errorCard;
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
                DropDownUniversity(
                  fem: widget.fem,
                  hem: widget.hem,
                  ffem: widget.ffem,
                  hintText: 'Chọn trường học',
                  labelText: 'TRƯỜNG *',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Trường không được bỏ trống';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20 * widget.hem,
                ),
                DropDownCampus(
                  fem: widget.fem,
                  hem: widget.hem,
                  ffem: widget.ffem,
                  hintText: 'Chọn cơ sở',
                  labelText: 'CƠ SỞ *',
                  campusController: campusController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Cơ sở không được bỏ trống';
                    }
                    return null;
                  },
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
          ButtonSignUp2(
            fem: widget.fem,
            hem: widget.hem,
            ffem: widget.ffem,
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _submitForm(context, campusController);
              }
            },
          ),
        ],
      ),
    );
  }
}

void _submitForm(BuildContext context, campusController) async {
  final authenModel = await AuthenLocalDataSource.getAuthen();
  if (authenModel == null) {
    final createAuthenModel = await AuthenLocalDataSource.getCreateAuthen();
    createAuthenModel!.campusId = campusController.text;
    // createAuthenModel.studentFrontCard = _selectedFrontCard!.path;
    // createAuthenModel.studentBackCard = _selectedFrontCard!.path;
    String createAuthenString = jsonEncode(createAuthenModel);
    AuthenLocalDataSource.saveCreateAuthen(createAuthenString);
    Navigator.pushNamed(context, SignUp3Screen.routeName);
  } else {
    final verifyAuthenModel = await AuthenLocalDataSource.getVerifyAuthen();
    verifyAuthenModel!.campusId = campusController.text;
    String verifyString = jsonEncode(verifyAuthenModel);
    AuthenLocalDataSource.saveVerifyAuthen(verifyString);
    Navigator.pushNamed(context, SignUp3Screen.routeName);
  }
}
