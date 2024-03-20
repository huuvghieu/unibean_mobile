import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/screens/login/components/button_login.dart';
import 'package:unibean_app/presentation/screens/login/components/button_login_gmail.dart';
import 'package:unibean_app/presentation/widgets/text_form_field_default.dart';
import 'package:unibean_app/presentation/widgets/text_form_field_password.dart';

import '../../../blocs/blocs.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({
    super.key,
    required this.fem,
    required this.hem,
    required this.ffem,
  });

  final double fem;
  final double hem;
  final double ffem;

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthenticationBloc>().state;
    var loginWidget = (switch (authState) {
      AuthenticationInitial() => _buildAuthIntial(userNameController,
          passwordController, widget.fem, widget.hem, widget.ffem),
      AuthenticationFailed(error: final error) => _buildAuthFailed(
          userNameController,
          passwordController,
          error,
          widget.fem,
          widget.hem,
          widget.ffem),
      AuthenticationSuccess() => _buildAuthIntial(userNameController,
          passwordController, widget.fem, widget.hem, widget.ffem),
      AuthenticationInProcess() => _buildAuthIntial(userNameController,
          passwordController, widget.fem, widget.hem, widget.ffem),
      AuthenticationInProcessByGmail() => _buildAuthIntial(userNameController,
          passwordController, widget.fem, widget.hem, widget.ffem),
    });

    loginWidget = BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationSuccess) {
          context.read<RoleAppBloc>().add(RoleAppStart());
          Navigator.pushNamedAndRemoveUntil(
              context, '/landing-screen', (Route<dynamic> route) => false);
        }
      },
      child: loginWidget,
    );

    return Form(
      key: _formKey,
      child: Column(
        children: [
          loginWidget,
          SizedBox(
            height: 25 * widget.hem,
          ),
          ButtonLogin(
            widget: widget,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<AuthenticationBloc>().add(LoginAccount(
                    userName: userNameController.text.trim(),
                    password: passwordController.text.toString()));
              }
            },
          ),
          ButtonLoginByGmail(
            widget: widget,
            onPressed: () {
              context.read<AuthenticationBloc>().add(LoginGmail());
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

Widget _buildAuthIntial(
    TextEditingController userNameController,
    TextEditingController passwordController,
    double fem,
    double hem,
    double ffem) {
  return Container(
    width: 318 * fem,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15 * fem),
        boxShadow: [
          BoxShadow(
            color: Color(0x0c000000),
            offset: Offset(0 * fem, 4 * fem),
            blurRadius: 2.5 * fem,
          )
        ]),
    child: Column(
      children: [
        SizedBox(
          height: 30 * hem,
        ),
        TextFormFieldDefault(
          hem: hem,
          fem: fem,
          ffem: ffem,
          labelText: 'TÀI KHOẢN',
          hintText: 'Nhập tài khoản của bạn',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Tài khoản không được bỏ trống';
            }
            return null;
          },
          textController: userNameController,
        ),
        SizedBox(
          height: 25 * hem,
        ),
        TextFormFieldPassword(
          hem: hem,
          fem: fem,
          ffem: ffem,
          labelText: 'MẬT KHẨU *',
          hintText: '******',
          isPassword: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Mật khẩu không được bỏ trống';
            }
            return null;
          },
          textController: passwordController,
        ),
        SizedBox(
          height: 30 * hem,
        ),
      ],
    ),
  );
}

Widget _buildAuthFailed(
    TextEditingController userNameController,
    TextEditingController passwordController,
    String error,
    double fem,
    double hem,
    double ffem) {
  return Container(
    width: 318 * fem,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15 * fem),
        boxShadow: [
          BoxShadow(
            color: Color(0x0c000000),
            offset: Offset(0 * fem, 4 * fem),
            blurRadius: 2.5 * fem,
          )
        ]),
    child: Column(
      children: [
        SizedBox(
          height: 30 * hem,
        ),
        TextFormFieldDefault(
          hem: hem,
          fem: fem,
          ffem: ffem,
          labelText: 'TÀI KHOẢN',
          hintText: 'Nhập tài khoản của bạn',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Tài khoản không được bỏ trống';
            }
            return null;
          },
          textController: userNameController,
        ),
        SizedBox(
          height: 25 * hem,
        ),
        TextFormFieldPassword(
          hem: hem,
          fem: fem,
          ffem: ffem,
          labelText: 'MẬT KHẨU *',
          hintText: '******',
          isPassword: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Mật khẩu không được bỏ trống';
            }
            return null;
          },
          textController: passwordController,
        ),
        Padding(
          padding: EdgeInsets.only(top: 5 * hem),
          child: Text(
            error,
            style: GoogleFonts.openSans(
              color: Colors.red,
              fontSize: 12 * ffem,
            ),
          ),
        ),
        SizedBox(
          height: 20 * hem,
        ),
      ],
    ),
  );
}
