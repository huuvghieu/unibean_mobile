import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/student_features/signup/components/step_2/form_2.dart';
class Body2 extends StatelessWidget {
  const Body2({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        // height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/bg_signup_2.png'),
        )),
        child: Column(
          children: [
            SizedBox(
              height: 400 * hem,
            ),
            Text(
              'Trường bạn đang học',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w900,
                      height: 1.3625 * ffem / fem,
                      color: Colors.black)),
            ),
            SizedBox(
              height: 10 * hem,
            ),
            Text(
              'Để hiểu rõ và dễ dàng hơn khi hỗ trợ bạn,\n mong bạn hãy cung cấp thông tin chính xác.',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.3625 * ffem / fem,
                      color: kLowTextColor)),
            ),
            SizedBox(
              height: 18 * hem,
            ),
            FormBody2(fem: fem, hem: hem, ffem: ffem)
          ],
        ),
      ),
    );
  }
}


