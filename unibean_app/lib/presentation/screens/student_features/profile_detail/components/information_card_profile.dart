import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/data/models/student_features/student_model.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/student_features/profile/components/name_profile.dart';
import 'package:unibean_app/presentation/screens/student_features/profile/components/student_code_profile.dart';
import 'package:unibean_app/presentation/screens/student_features/profile/components/unitiversity_name_profile.dart';
import '../../../screens.dart';

class InformationCardProfile extends StatelessWidget {
  const InformationCardProfile({
    super.key,
    required this.hem,
    required this.fem,
    required this.ffem,
    required this.studentModel,
  });

  final double hem;
  final double fem;
  final double ffem;
  final StudentModel studentModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 324 * fem,
      height: 200 * hem,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15 * fem),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10 * hem,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 25 * fem,
              ),

              //avatar
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      '${studentModel.avatar}',
                      // 'assets/images/ava_signup.png',
                      width: 80 * fem,
                      height: 80 * hem,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/ava_signup.png',
                          width: 80 * fem,
                          height: 80 * hem,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 0 * hem,
                    right: 0 * fem,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: klighGreyColor),
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        weight: 1,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(
                width: 20 * fem,
              ),

              SizedBox(
                // color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Name
                    NameProfile(
                      fem: fem,
                      ffem: ffem,
                      hem: hem,
                      name: studentModel.fullName,
                    ),
                    //email
                    SizedBox(
                      width: 150 * fem,
                      child: Text(
                        '${studentModel.email}',
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                fontSize: 12 * ffem,
                                fontWeight: FontWeight.normal,
                                color: klowTextGrey)),
                      ),
                    ),
                    //student code
                    StudentCodeProfile(
                      hem: hem,
                      fem: fem,
                      ffem: ffem,
                      studentCode: studentModel.code,
                    ),
                    //university name
                    UniversityProfile(
                      fem: fem,
                      hem: hem,
                      ffem: ffem,
                      university: studentModel.universityName,
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10 * fem,
          ),
          SizedBox(
            width: 280 * fem,
            child: Divider(
              thickness: 1 * fem,
              color: const Color.fromARGB(255, 225, 223, 223),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10 * hem,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () async {
                    final student = await AuthenLocalDataSource.getStudent();
                    Navigator.pushNamed(
                        context, ProfileUpdateDetailScreen.routeName,
                        arguments: student);
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 5 * fem, right: 5 * fem),
                    width: 140 * fem,
                    height: 40 * hem,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[100],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: SvgPicture.asset(
                            'assets/icons/pen-icon.svg',
                            colorFilter: ColorFilter.mode(
                                kPrimaryColor, BlendMode.srcIn),
                            height: 18 * fem,
                            width: 18 * fem,
                          ),
                        ),
                        SizedBox(
                          width: 5 * fem,
                        ),
                        Text(
                          'Sửa thông tin',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  fontSize: 12 * fem,
                                  fontWeight: FontWeight.bold,
                                  height: 1.3625 * ffem / fem,
                                  color: kPrimaryColor)),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.only(left: 5 * fem, right: 5 * fem),
                    width: 140 * fem,
                    height: 40 * hem,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[100],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: SvgPicture.asset(
                            'assets/icons/following-icon.svg',
                            colorFilter: ColorFilter.mode(
                                kPrimaryColor, BlendMode.srcIn),
                            height: 25 * fem,
                            width: 25 * fem,
                          ),
                        ),
                        SizedBox(
                          width: 5 * fem,
                        ),
                        Text(
                          '${studentModel.following} theo dõi',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  fontSize: 12 * fem,
                                  fontWeight: FontWeight.bold,
                                  height: 1.3625 * ffem / fem,
                                  color: kPrimaryColor)),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
