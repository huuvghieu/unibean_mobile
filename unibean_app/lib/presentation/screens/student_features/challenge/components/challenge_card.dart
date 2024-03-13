import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../../data/models.dart';
import '../../../../config/constants.dart';
import 'in_process/in_process_button.dart';
import 'is_claimed/is_claimed_button.dart';
import 'is_completed/is_completed_button.dart';

class ChallengeCard extends StatelessWidget {
  const ChallengeCard(
      {super.key,
      required this.fem,
      required this.hem,
      required this.ffem,
      required this.challengeModel});

  final double fem;
  final double hem;
  final double ffem;
  final ChallengeModel challengeModel;

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('###,000');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          constraints:
              BoxConstraints(maxWidth: 330 * fem, maxHeight: double.infinity),
          margin:
              EdgeInsets.only(top: 15 * hem, left: 15 * fem, right: 15 * fem),
          padding: EdgeInsets.only(left: 20 * fem, right: 15 * fem),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15 * fem),
            border: Border.all(color: kPrimaryColor),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15 * hem,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    // borderRadius: BorderRadius.circular(10 * fem),
                    child: Container(
                      width: 30 * fem,
                      height: 30 * hem,
                      child: Image.network(
                        challengeModel.challengeImage,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.error_outlined,
                            size: 30 * fem,
                            color: kPrimaryColor,
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: 250 * fem,
                    padding: EdgeInsets.only(left: 10 * fem),
                    child: Text(
                      challengeModel.description,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.openSans(
                        fontSize: 16 * ffem,
                        height: 1.3625 * ffem / fem,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20 * hem,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tiến độ',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.openSans(
                      fontSize: 15 * ffem,
                      height: 1.3625 * ffem / fem,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10 * fem),
                    child: RichText(
                      text: TextSpan(
                          text: '${challengeModel.current.toStringAsFixed(0)}',
                          style: GoogleFonts.openSans(
                            fontSize: 17 * ffem,
                            height: 1.3625 * ffem / fem,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  '/${challengeModel.condition.toStringAsFixed(0)}',
                              style: GoogleFonts.openSans(
                                fontSize: 17 * ffem,
                                height: 1.3625 * ffem / fem,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ]),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5 * hem,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Phần thưởng',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.openSans(
                      fontSize: 15 * ffem,
                      height: 1.3625 * ffem / fem,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '+ ${formatter.format(challengeModel.amount)}',
                        style: GoogleFonts.openSans(
                          color: kPrimaryColor,
                          fontSize: 17 * ffem,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/green-bean-icon.svg',
                        width: 20 * fem,
                        height: 25 * fem,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5 * hem,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 190 * fem,
                  ),
                  _checkCondition(challengeModel.isCompleted,
                      challengeModel.isClaimed, fem, hem)
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

Widget _checkCondition(bool isComplete, bool isClaim, fem, hem) {
  if (isComplete && isClaim) {
    return IsClaimedButton(fem: fem, hem: hem);
  } else if (isComplete && isClaim == false) {
    return IsCompletedButton(fem: fem, hem: hem);
  }
  return InProcessButton(fem: fem, hem: hem);
}


 // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Container(
                  //       width: 180 * fem,
                  //       height: 50 * hem,
                  //       child: Text(
                  //         challengeModel.challengeName,
                  //         textAlign: TextAlign.center,
                  //         style: GoogleFonts.openSans(
                  //             textStyle: TextStyle(
                  //           color: kDarkPrimaryColor,
                  //           fontSize: 16 * ffem,
                  //           height: 1.3625 * ffem / fem,
                  //           fontWeight: FontWeight.w900,
                  //         )),
                  //       ),
                  //     ),
                  //     Container(
                  //       width: 100 * fem,
                  //       height: 35 * hem,
                  //       margin: EdgeInsets.only(bottom: 10 * hem),
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(5 * fem),
                  //           color: Color(0xff83f28f)),
                  //       child:
                  // Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Padding(
                  //             padding: EdgeInsets.only(left: 10 * fem),
                  //             child: Text(
                  //               '+ ${formatter.format(challengeModel.amount)}',
                  //               style: GoogleFonts.openSans(
                  //                 color: Colors.white,
                  //                 height: 1.3625 * ffem / fem,
                  //                 fontSize: 14 * ffem,
                  //                 fontWeight: FontWeight.w900,
                  //               ),
                  //             ),
                  //           ),
                  //           SvgPicture.asset(
                  //             'assets/icons/green-bean-icon.svg',
                  //             width: 25 * fem,
                  //             height: 30 * fem,
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),