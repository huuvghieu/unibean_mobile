import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';

class FilterShowdalBottom extends StatelessWidget {
  const FilterShowdalBottom({
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
    return Container(
        height: MediaQuery.of(context).size.height * .50,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: 30 * hem, left: 25 * fem, right: 25 * fem),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10 * hem),
                    child: Text(
                      'Bộ lọc',
                      style: GoogleFonts.nunito(
                        fontSize: 24 * ffem,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        height: 1.3625 * ffem / fem,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.cancel_outlined,
                        size: 30 * fem,
                      ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 10 * hem, left: 25 * fem, right: 25 * fem),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10 * hem),
                    child: Text(
                      'Loại',
                      style: GoogleFonts.nunito(
                        fontSize: 16 * ffem,
                        color: kLowTextColor,
                        fontWeight: FontWeight.w600,
                        height: 1.3625 * ffem / fem,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10 * hem),
                    child: Text(
                      'Làm mới',
                      style: GoogleFonts.nunito(
                        fontSize: 10 * ffem,
                        color: kLowTextColor,
                        fontWeight: FontWeight.w600,
                        height: 1.3625 * ffem / fem,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 20 * hem, left: 25 * fem, right: 25 * fem),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 80 * fem,
                    height: 40 * hem,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5 * fem),
                      color: kPrimaryColor,
                    ),
                    child: Center(
                      child: Text(
                        'Nội bộ',
                        style: GoogleFonts.nunito(
                          fontSize: 14 * ffem,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.3625 * ffem / fem,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10 * fem,
                  ),
                  Container(
                    width: 80 * fem,
                    height: 40 * hem,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5 * fem),
                      color: klighGreyColor,
                    ),
                    child: Center(
                      child: Text(
                        'Ngoại bộ',
                        style: GoogleFonts.nunito(
                          fontSize: 14 * ffem,
                          color: kLowTextColor,
                          fontWeight: FontWeight.bold,
                          height: 1.3625 * ffem / fem,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 10 * hem, left: 25 * fem, right: 25 * fem),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10 * hem),
                    child: Text(
                      'Loại',
                      style: GoogleFonts.nunito(
                        fontSize: 16 * ffem,
                        color: kLowTextColor,
                        fontWeight: FontWeight.w600,
                        height: 1.3625 * ffem / fem,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10 * hem),
                    child: Text(
                      'Làm mới',
                      style: GoogleFonts.nunito(
                        fontSize: 10 * ffem,
                        color: kLowTextColor,
                        fontWeight: FontWeight.w600,
                        height: 1.3625 * ffem / fem,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 20 * hem, left: 25 * fem, right: 25 * fem),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 80 * fem,
                    height: 40 * hem,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5 * fem),
                      color: kPrimaryColor,
                    ),
                    child: Center(
                      child: Text(
                        'Tất cả',
                        style: GoogleFonts.nunito(
                          fontSize: 14 * ffem,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.3625 * ffem / fem,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10 * fem,
                  ),
                  Container(
                    width: 80 * fem,
                    height: 40 * hem,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5 * fem),
                      color: klighGreyColor,
                    ),
                    child: Center(
                      child: Text(
                        'Có sẵn',
                        style: GoogleFonts.nunito(
                          fontSize: 14 * ffem,
                          color: kLowTextColor,
                          fontWeight: FontWeight.bold,
                          height: 1.3625 * ffem / fem,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            TextButton(
              onPressed: () {
               
              },
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 40*hem),
                  width: 300 * fem,
                  height: 45 * hem,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(23 * fem)),
                  child: Center(
                    child: Text(
                      'Lọc',
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              fontSize: 17 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.3625 * ffem / fem,
                              color: Colors.white)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}