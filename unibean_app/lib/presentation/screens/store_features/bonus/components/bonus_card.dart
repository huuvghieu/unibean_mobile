import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:unibean_app/presentation/screens/store_features/bonus_detail/bonus_detail_screen.dart';

import '../../../../../data/models.dart';
import '../../../../config/constants.dart';

class BonusCard extends StatelessWidget {
  const BonusCard({
    super.key,
    required this.hem,
    required this.fem,
    required this.bonus,
    required this.ffem,
  });

  final double hem;
  final double fem;
  final BonusModel bonus;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, BonusDetailScreen.routeName,
            arguments: bonus.id);
      },
      child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(bottom: 15 * hem),
          height: 90 * hem,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 90 * hem,
                margin: EdgeInsets.only(right: 15 * fem, left: 15 * fem),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10 * fem),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color(0x0c000000),
                          offset: Offset(0 * fem, 10 * fem),
                          blurRadius: 5 * fem)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10 * fem),
                      child: Container(
                        width: 200 * fem,
                        child: Text('Bên gửi: ${bonus.storeName}',
                            style: GoogleFonts.openSans(
                                fontSize: 15 * ffem,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10 * fem),
                      child: Container(
                        width: 200 * fem,
                        child: Text('Sinh viên nhận: ${bonus.studentName}',
                            style: GoogleFonts.openSans(
                                fontSize: 15 * ffem,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10 * fem, top: 5 * hem),
                      child: Text(_formatDatetime(bonus.dateCreated),
                          style: GoogleFonts.openSans(
                              fontSize: 12 * ffem,
                              fontWeight: FontWeight.w600,
                              color: kLowTextColor)),
                    ),
                  ],
                ),
              ),
              Positioned(
                  right: 20 * fem,
                  top: 10 * hem,
                  child: Container(
                    height: 32 * hem,
                    width: 100 * fem,
                    padding: EdgeInsets.only(left: 10 * fem, right: 10 * fem),
                    decoration: BoxDecoration(
                        border: Border.all(color: kPrimaryColor),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8 * fem)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${formatter.format(bonus.amount)}',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                            fontSize: 15 * ffem,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 2 * fem, top: 4 * hem, bottom: 2 * hem),
                          child: SvgPicture.asset(
                            'assets/icons/green-bean-icon.svg',
                            width: 24 * fem,
                            height: 22 * fem,
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}

String _formatDatetime(String date) {
  DateTime dateTime = DateTime.parse(date).add(Duration(hours: 7));

  String formattedDatetime = DateFormat("HH:mm - dd/MM/yyyy").format(dateTime);
  return formattedDatetime;
}
