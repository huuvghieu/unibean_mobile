import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../data/models.dart';
import '../../../../config/constants.dart';
import 'form_verification.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.studentModel});

  final StudentModel studentModel;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          Column(
            children: [
              SizedBox(
                height: 20 * hem,
              ),
              Text(
                'Thông tin xác minh',
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18 * ffem,
                        fontWeight: FontWeight.w700)),
              ),
              SizedBox(
                height: 5 * hem,
              ),
              FromVerification(
                  hem: hem, fem: fem, ffem: ffem, studentModel: studentModel),
            ],
          )
        ]))
      ],
    );
  }

  Widget checkVerification(
      StudentModel studentModel, double fem, double hem, double ffem) {
    if (studentModel.isVerify && studentModel.state == 'Active') {
      return Container(
        padding: EdgeInsets.only(right: 5 * fem, left: 5 * fem),
        height: 30 * hem,
        width: 100 * fem,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Color(0xfffb7eb8f)),
            color: Color(0xffff6ffed)),
        child: Center(
          child: Text(
            'Đã xác minh',
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    fontSize: 13 * ffem,
                    height: 1.3625 * ffem / fem,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor)),
          ),
        ),
      );
    } else if (studentModel.isVerify && studentModel.state == "Pending") {
      return Container(
        padding: EdgeInsets.only(right: 5 * fem, left: 5 * fem),
        height: 30 * hem,
        width: 120 * fem,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Color(0xfffffe58f)),
            color: kbgYellow),
        child: Center(
          child: Text(
            'Đang chờ duyệt',
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    fontSize: 13 * ffem,
                    height: 1.3625 * ffem / fem,
                    fontWeight: FontWeight.w600,
                    color: kYellow)),
          ),
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.only(right: 5 * fem, left: 5 * fem),
        height: 30 * hem,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Color(0xfffffe58f)),
            color: kbgYellow),
        child: Center(
          child: Text(
            'Xác minh thất bại',
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    fontSize: 13 * ffem,
                    height: 1.3625 * ffem / fem,
                    fontWeight: FontWeight.w600,
                    color: kYellow)),
          ),
        ),
      );
    }
  }
}
