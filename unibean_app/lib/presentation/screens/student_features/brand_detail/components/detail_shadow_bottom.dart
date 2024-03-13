import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:unibean_app/data/models.dart';

import '../../../../widgets/shimmer_widget.dart';

class DetailShowdalBottom extends StatelessWidget {
  const DetailShowdalBottom({
    super.key,
    required this.hem,
    required this.fem,
    required this.ffem,
    required this.brandModel,
  });

  final double hem;
  final double fem;
  final double ffem;
  final BrandModel brandModel;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1,
      minChildSize: 1,
      builder: (context, scrollController) {
        return SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: 15 * hem,
                      left: 25 * fem,
                      right: 25 * fem,
                      bottom: 15 * hem),
                  child: Center(
                    child: Text(
                      'Thông tin chi tiết',
                      style: GoogleFonts.openSans(
                        fontSize: 16 * ffem,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 15 * hem, bottom: 15 * hem),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 25 * fem),
                        child: Text(
                          'Thông tin liên lạc',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                            fontSize: 14 * ffem,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 5 * hem, left: 25 * fem, right: 25 * fem),
                        child: Text(
                          'Địa chỉ email: ${brandModel.email}.',
                          // textAlign: TextAlign.justify,
                          softWrap: true,
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              fontSize: 13 * ffem,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 5 * hem, left: 25 * fem, right: 25 * fem),
                        child: Text(
                          'Số điện thoại: ${brandModel.phone}.',
                          // textAlign: TextAlign.justify,
                          softWrap: true,
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              fontSize: 13 * ffem,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15 * hem,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25 * fem),
                        child: Text(
                          'Thời gian làm việc',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                            fontSize: 14 * ffem,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 5 * hem, left: 25 * fem, right: 25 * fem),
                        child: Text(
                          ' ${formatTime(brandModel.openingHours)} - ${formatTime(brandModel.closingHours)}.',
                          textAlign: TextAlign.justify,
                          softWrap: true,
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              fontSize: 13 * ffem,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15 * hem,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25 * fem),
                        child: Text(
                          'Thông tin về chiến dịch',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                            fontSize: 14 * ffem,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 5 * hem, left: 25 * fem, right: 25 * fem),
                        child: Text(
                          brandModel.description,
                          textAlign: TextAlign.justify,
                          softWrap: true,
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              fontSize: 13 * ffem,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ));
      },
    );
  }
}

Widget buildShowdalShimmer(double fem, double hem) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(left: 80 * fem, right: 80 * fem, top: 20 * hem),
        child: ShimmerWidget.rectangular(
          height: 20 * hem,
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 15 * fem, right: 15 * fem, top: 20 * hem),
        child: ShimmerWidget.rectangular(
          height: 20 * hem,
          width: 100 * fem,
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 15 * fem, right: 15 * fem, top: 5 * hem),
        child: ShimmerWidget.rectangular(
          height: 20 * hem,
          width: 150 * fem,
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 15 * fem, right: 15 * fem, top: 20 * hem),
        child: ShimmerWidget.rectangular(
          height: 20 * hem,
          width: 100 * fem,
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 15 * fem, right: 15 * fem, top: 5 * hem),
        child: ShimmerWidget.rectangular(
          height: 20 * hem,
          width: 200 * fem,
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 15 * fem, right: 15 * fem, top: 20 * hem),
        child: ShimmerWidget.rectangular(
          height: 20 * hem,
          width: 100 * fem,
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 15 * fem, right: 15 * fem, top: 5 * hem),
        child: ShimmerWidget.rectangular(
          height: 20 * hem,
          width: 200 * fem,
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 15 * fem, right: 15 * fem, top: 20 * hem),
        child: ShimmerWidget.rectangular(
          height: 20 * hem,
          width: 100 * fem,
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 15 * fem, right: 15 * fem, top: 5 * hem),
        child: ShimmerWidget.rectangular(
          height: 80 * hem,
          width: 340 * fem,
        ),
      ),
    ],
  );
}

String changeFormateDate(String dateTime) {
  DateTime formatDate = DateTime.parse(dateTime);
  String formattedDate = DateFormat('dd/MM/yyyy').format(formatDate);
  return formattedDate;
}

String formatTime(String inputTimeString) {
  // Parse the input time string
  DateTime parsedTime = DateTime.parse("2022-01-01 $inputTimeString");

  // Format the DateTime object to a string with "h:mm" format
  String formattedTime =
      "${parsedTime.hour.toString().padLeft(2, '0')}:${parsedTime.minute.toString().padLeft(2, '0')}";

  return formattedTime;
}
