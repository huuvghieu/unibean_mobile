import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/components/step_4/drop_down_major.dart';
import 'package:unibean_app/presentation/widgets/text_form_field_default.dart';

import 'form_4.dart';

class Content4 extends StatelessWidget {
  const Content4(
      {super.key, required this.widget, required this.studentCodeController});

  final FormBody4 widget;
  final TextEditingController studentCodeController;

  @override
  Widget build(BuildContext context) {
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
            height: 25 * widget.hem,
          ),
          DropDownMajor(
              hem: widget.hem,
              fem: widget.fem,
              ffem: widget.ffem,
              labelText: 'CHUYÊN NGÀNH',
              hintText: 'Chọn chuyên ngành'),
          SizedBox(
            height: 40 * widget.hem,
          ),
        ],
      ),
    );
  }
}
