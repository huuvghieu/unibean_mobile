import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/profile/components/item_icon_card_profile.dart';
import 'package:unibean_app/presentation/screens/profile/components/name_profile.dart';
import 'package:unibean_app/presentation/screens/profile/components/student_code_profile.dart';
import 'package:unibean_app/presentation/screens/profile/components/unitiversity_name_profile.dart';

class InformationCardProfile extends StatelessWidget {
  const InformationCardProfile({
    super.key,
    required this.hem,
    required this.fem,
    required this.ffem,
  });

  final double hem;
  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 120 * hem,
      left: 25 * fem,
      child: Container(
        width: 324 * fem,
        height: 200 * hem,
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(100 * fem),
                  child: Container(
                    width: 80 * hem,
                    height: 80 * fem,
                    child: FittedBox(
                      child: Image(
                          image: AssetImage(
                        'assets/images/bulldog.png',
                      )),
                      fit: BoxFit.cover,
                    ),
                  ),
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
                      NameProfile(fem: fem, ffem: ffem, hem: hem),
                      //email
                      Text(
                        'hieuvhse161967@fpt.edu.vn',
                        style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                                fontSize: 10 * ffem,
                                height: 1.3625 * ffem / fem,
                                fontWeight: FontWeight.w600,
                                color: kLowTextColor)),
                      ),
                      //student code
                      StudentCodeProfile(hem: hem, fem: fem, ffem: ffem),
                      //university name
                      UniversityProfile(fem: fem, hem: hem, ffem: ffem)
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
                  ItemIconCardProfile(
                    fem: fem,
                    hem: hem,
                    ffem: ffem,
                    svgAssetName: 'assets/icons/post-icon-profile.svg',
                    title: '10 Posts',
                  ),
                  ItemIconCardProfile(
                    fem: fem,
                    hem: hem,
                    ffem: ffem,
                    svgAssetName: 'assets/icons/friends-icon-profile.svg',
                    title: '15 Friends',
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 40 * fem,
                          height: 40 * hem,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[100],
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/qr-unbean-icon.svg',
                              colorFilter: ColorFilter.mode(
                                  kPrimaryColor, BlendMode.srcIn),
                              height: 18 * fem,
                              width: 18 * fem,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Show QR',
                        style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                                fontSize: 10 * fem,
                                fontWeight: FontWeight.w600,
                                height: 1.3625 * ffem / fem,
                                color: kLowTextColor)),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
