import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/screens/student_features/challenge/components/in_process_button.dart';
import 'package:unibean_app/presentation/screens/student_features/challenge/components/is_claimed_button.dart';
import 'package:unibean_app/presentation/screens/student_features/challenge/components/is_completed_button.dart';

import '../../../../../data/models.dart';
import '../../../../config/constants.dart';

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
    return Container(
      width: 340 * fem,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 340 * fem,
            child: Stack(
              children: [
                Container(
                  width: 330 * fem,
                  height: 220 * hem,
                  margin: EdgeInsets.only(
                      top: 15 * hem, left: 10 * fem, right: 10 * fem),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15 * fem),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15 * hem,
                      ),
                      Container(
                        width: 180 * fem,
                        height: 50 * hem,
                        margin: EdgeInsets.only(left: 20 * fem),
                        child: Text(
                          challengeModel.challengeName,
                          style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                            color: kDarkPrimaryColor,
                            fontSize: 16 * ffem,
                            height: 1.3625 * ffem / fem,
                            fontWeight: FontWeight.w900,
                          )),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10 * fem),
                            child: Container(
                              width: 60 * fem,
                              height: 60 * hem,
                              child: Image.network(
                                challengeModel.challengeImage,
                                fit: BoxFit.fill,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(
                                    Icons.error_outlined,
                                    size: 50 * fem,
                                    color: kPrimaryColor,
                                  );
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: 200 * fem,
                            padding: EdgeInsets.only(left: 10 * fem),
                            child: Text(
                              challengeModel.description,
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.nunito(
                                fontSize: 14 * ffem,
                                height: 1.3625 * ffem / fem,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10 * hem,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 180 * fem,
                            child: LinearProgressIndicator(
                              color: kPrimaryColor,
                              minHeight: 15 * hem,
                              semanticsLabel: '40/60',
                              borderRadius: BorderRadius.circular(10),
                              value: (challengeModel.current /
                                  challengeModel.condition),
                            ),
                          ),
                          SizedBox(
                            width: 30 * fem,
                          ),
                          Text(
                            '${challengeModel.current.toStringAsFixed(0)}/${challengeModel.condition.toStringAsFixed(0)}',
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.nunito(
                              fontSize: 15 * ffem,
                              height: 1.3625 * ffem / fem,
                              fontWeight: FontWeight.normal,
                              color: kLowTextColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5 * hem,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _checkCondition(challengeModel.isCompleted,
                              challengeModel.isClaimed, fem, hem)
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 25 * hem,
                  left: 240 * fem,
                  child: Container(
                    width: 100 * fem,
                    height: 35 * hem,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5 * fem),
                        color: kPrimaryColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10 * fem),
                          child: Text(
                            '+ ${challengeModel.amount}',
                            style: GoogleFonts.nunito(
                              color: Colors.white,
                              height: 1.3625 * ffem / fem,
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/green-bean-icon.svg',
                          width: 25 * fem,
                          height: 30 * fem,
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

Widget _checkCondition(bool isComplete, bool isClaim, fem, hem) {
  if (isComplete && isClaim) {
    return IsClaimedButton(fem: fem, hem: hem);
  } else if (isComplete && isClaim == false) {
    return IsCompletedButton(fem: fem, hem: hem);
  }
  return InProcessButton(fem: fem, hem: hem);
}
