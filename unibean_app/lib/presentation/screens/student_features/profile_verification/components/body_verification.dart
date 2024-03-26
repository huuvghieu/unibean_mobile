import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/screens/screens.dart';
import 'package:unibean_app/presentation/screens/student_features/profile/components/button_profile.dart';

import '../../../../../data/models.dart';
import '../../../../config/constants.dart';

class BodyVerification extends StatelessWidget {
  const BodyVerification({super.key, required this.studentModel});

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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: 324 * fem,
                padding: EdgeInsets.only(top: 10 * hem, bottom: 10 * hem),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15 * fem),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color(0x0c000000),
                          offset: Offset(0 * fem, 10 * fem),
                          blurRadius: 5 * fem)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10 * hem,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15 * fem, right: 15 * fem),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //avatar
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100 * fem),
                            child: Container(
                              width: 80 * hem,
                              height: 80 * fem,
                              child: Image(
                                image: NetworkImage(
                                  '${studentModel.avatar}',
                                ),
                                fit: BoxFit.fill,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/images/ava_signup.png',
                                    width: 100 * fem,
                                    height: 100 * hem,
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20 * fem,
                          ),
                          //Name
                          Text(
                            '${studentModel.fullName}',
                            // softWrap: true,
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    fontSize: 17 * ffem,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),

                          //student code
                          Padding(
                            padding:
                                EdgeInsets.only(top: 10 * hem, bottom: 5 * hem),
                            child:
                                checkVerification(studentModel, fem, hem, ffem),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonProfile(
                  fem: fem,
                  hem: hem,
                  ffem: ffem,
                  svgIcon: 'assets/icons/verifi-icon.svg',
                  title: 'Thẻ sinh viên',
                  onPressed: () {
                    Navigator.pushNamed(
                        context, UpdateVerificationScreen.routeName,
                        arguments: studentModel);
                  })
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
