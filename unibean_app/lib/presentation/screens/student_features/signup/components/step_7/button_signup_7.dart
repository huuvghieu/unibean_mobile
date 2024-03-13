import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/cubits/verification/verification_cubit.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/components/step_7/otp_form.dart';

class ButtonSignUp7 extends StatelessWidget {
  const ButtonSignUp7(
      {super.key, required this.widget, required this.onPressed});

  final OTPForm widget;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      // onPressed: () async {
      //   // Navigator.pushReplacementNamed(context, SignUp7Screen.routeName);

      // },
      onPressed: onPressed,
      child: Container(
        width: 300 * widget.fem,
        height: 45 * widget.hem,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(23 * widget.fem)),
        child: BlocBuilder<VerificationCubit, VerificationState>(
          builder: (context, state) {
            if (state is VerificationInProcess) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
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
