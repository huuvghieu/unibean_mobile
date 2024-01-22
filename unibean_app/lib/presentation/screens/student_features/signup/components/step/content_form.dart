import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/components/step/form_0.dart';
import 'package:unibean_app/presentation/widgets/text_form_field_default.dart';
import 'package:unibean_app/presentation/widgets/text_form_field_password.dart';

class ContentForm extends StatelessWidget {
  const ContentForm({
    super.key,
    required this.widget,
    required this.userNameController,
    required this.passController,
    required this.confirmPassController,
  });

  final FormBody widget;
  final TextEditingController userNameController;
  final TextEditingController passController;
  final TextEditingController confirmPassController;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              return 'Tài khoản phải chứa ký tự thường hoặc số,\ncó độ dài từ 5 đến 50 ký tự';
            }
            return null;
          },
          textController: userNameController,
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
}
