import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/components/step_6/form_6.dart';

import '../../../../../config/constants.dart';
import '../../../../../cubits/validation/validation_cubit.dart';

class ButtonSignUp6 extends StatelessWidget {
  const ButtonSignUp6(
      {super.key, required this.widget, required this.onPressed});

  final FormBody6 widget;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: 300 * widget.fem,
        height: 45 * widget.hem,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(23 * widget.fem)),
        child: BlocBuilder<ValidationCubit, ValidationState>(
          builder: (context, state) {
            if (state is ValidationInProcess) {
              return Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              );
            }
            return Center(
              child: Text(
                'Tiếp tục',
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        fontSize: 17 * widget.ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.3625 * widget.ffem / widget.fem,
                        color: Colors.white)),
              ),
            );
          },
        ),
      ),
    );
  }
}
