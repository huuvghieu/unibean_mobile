import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/components/step_1/form_1.dart';
import 'package:unibean_app/presentation/widgets/text_form_field_default.dart';

class ContentFrom1 extends StatelessWidget {
  const ContentFrom1({
    super.key,
    required this.widget,
    required this.emailController,
    required this.nameController,
  });

  final FormBody1 widget;
  final TextEditingController emailController;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        SizedBox(
          height: 40 * widget.hem,
        ),
        TextFormFieldDefault(
          hem: widget.hem,
          fem: widget.fem,
          ffem: widget.ffem,
          labelText: 'GMAIL *',
          hintText: 'Nhập gmail...',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Email không được bỏ trống';
            } else if (!emailValidationRegExp.hasMatch(value)) {
              return 'Email không hợp lệ';
            }
            return null;
          },
          textController: emailController,
        ),
        SizedBox(
          height: 25 * widget.hem,
        ),
        TextFormFieldDefault(
          hem: widget.hem,
          fem: widget.fem,
          ffem: widget.ffem,
          labelText: 'HỌ VÀ TÊN *',
          hintText: 'Nhập họ và tên...',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Họ và tên không được bỏ trống';
            } else if (!vietNameseTextOnlyPattern.hasMatch(value)) {
              return 'Họ và tên không hợp lệ';
            }
            return null;
          },
          textController: nameController,
        ),
        SizedBox(
          height: 40 * widget.hem,
        ),
      ],
    );
  }
}
