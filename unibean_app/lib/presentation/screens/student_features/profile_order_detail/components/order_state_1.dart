import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../../data/models.dart';
import '../../../../config/constants.dart';

class OrderState1 extends StatelessWidget {
  const OrderState1({
    super.key,
    required this.ffem,
    required this.orderDetail,
    required this.fem,
  });

  final double ffem;
  final OrderDetailModel orderDetail;
  final double fem;

  @override
  Widget build(BuildContext context) {
    return Container(
     width: double.infinity,
     color: Colors.white,
     padding: EdgeInsets.only(
         top: 5, bottom: 15, left: 10, right: 10),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(
           'TÌNH TRẠNG',
           textAlign: TextAlign.center,
           style: GoogleFonts.openSans(
               textStyle: TextStyle(
                   fontSize: 16 * ffem,
                   fontWeight: FontWeight.w600,
                   color: kPrimaryColor)),
         ),
         SizedBox(
           height: 5,
         ),
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             TimelineTile(
               endChild: Card(
                 margin: EdgeInsets.all(25),
                 child: Column(
                   children: [
                     SizedBox(
                       height: 10,
                     ),
                     Text(
                       '${orderDetail.stateDetails[0].stateName}',
                       style: GoogleFonts.openSans(
                           textStyle: TextStyle(
                               fontSize: 15 * ffem,
                               fontWeight: FontWeight.w500,
                               color: kPrimaryColor)),
                     ),
                     Text(
                       '${DateFormat('dd/MM/yyyy, hh:mm').format(DateTime.parse(orderDetail.stateDetails[0].dateCreated).add(Duration(hours: 7)))}',
                       style: GoogleFonts.openSans(
                           textStyle: TextStyle(
                               fontSize: 15 * ffem,
                               fontWeight:
                                   FontWeight.normal,
                               color: klowTextGrey)),
                     ),
                     SizedBox(
                       height: 10,
                     ),
                   ],
                 ),
               ),
               axis: TimelineAxis.vertical,
               isFirst: true,
               indicatorStyle: IndicatorStyle(
                   // color: kPrimaryColor,
                   // width: 30 * fem,
                   // height: 30 * hem,
                   width: 50,
                   height: 50,
                   indicator: Container(
                       decoration: BoxDecoration(
                           borderRadius:
                               BorderRadius.circular(
                                   100 * fem),
                           color: const Color.fromARGB(
                               255, 178, 247, 180)),
                       child: Icon(
                         Icons.check_rounded,
                         color: kPrimaryColor,
                         size: 25 * fem,
                       ))),
               afterLineStyle: LineStyle(
                 color: kPrimaryColor,
               ),
             ),
             TimelineTile(
               endChild: Card(
                 margin: EdgeInsets.all(25),
                 child: Column(
                   children: [
                     SizedBox(
                       height: 10,
                     ),
                     Text(
                       'Người bán đang xác nhận',
                       style: GoogleFonts.openSans(
                           textStyle: TextStyle(
                               fontSize: 15 * ffem,
                               fontWeight: FontWeight.w500,
                               color: klowTextGrey)),
                     ),
                     SizedBox(
                       height: 10,
                     ),
                   ],
                 ),
               ),
               axis: TimelineAxis.vertical,
               indicatorStyle: IndicatorStyle(
                   // color: kPrimaryColor,
                   width: 50,
                   height: 50,
                   indicator: Container(
                       decoration: BoxDecoration(
                         borderRadius:
                             BorderRadius.circular(
                                 100 * fem),
                         color: klighGreyColor,
                       ),
                       child: Center(
                         child: Text(
                           '2',
                           style: GoogleFonts.openSans(
                               textStyle: TextStyle(
                                   color: kLowTextColor,
                                   fontSize: 16 * ffem,
                                   fontWeight:
                                       FontWeight.w900)),
                         ),
                       ))),
               beforeLineStyle:
                   LineStyle(color: klighGreyColor),
             ),
             TimelineTile(
               endChild: Card(
                 margin: EdgeInsets.all(25),
                 child: Column(
                   children: [
                     SizedBox(
                       height: 10,
                     ),
                     Text(
                       'Chuẩn bị đơn hàng',
                       style: GoogleFonts.openSans(
                           textStyle: TextStyle(
                               fontSize: 15 * ffem,
                               fontWeight: FontWeight.w500,
                               color: klowTextGrey)),
                     ),
                     SizedBox(
                       height: 10,
                     ),
                   ],
                 ),
               ),
               axis: TimelineAxis.vertical,
               indicatorStyle: IndicatorStyle(
                   // color: kPrimaryColor,
                   width: 50,
                   height: 50,
                   indicator: Container(
                       decoration: BoxDecoration(
                           borderRadius:
                               BorderRadius.circular(
                                   100 * fem),
                           color: klighGreyColor),
                       child: Center(
                         child: Text(
                           '3',
                           style: GoogleFonts.openSans(
                               textStyle: TextStyle(
                                   color: kLowTextColor,
                                   fontSize: 16 * ffem,
                                   fontWeight:
                                       FontWeight.w900)),
                         ),
                       ))),
               afterLineStyle:
                   LineStyle(color: klighGreyColor),
               beforeLineStyle:
                   LineStyle(color: klighGreyColor),
             ),
             TimelineTile(
               endChild: Card(
                 margin: EdgeInsets.all(25),
                 child: Column(
                   children: [
                     SizedBox(
                       height: 10,
                     ),
                     Text(
                       'Hàng đã đến nơi',
                       style: GoogleFonts.openSans(
                           textStyle: TextStyle(
                               fontSize: 15 * ffem,
                               fontWeight: FontWeight.w500,
                               color: klowTextGrey)),
                     ),
                     SizedBox(
                       height: 10,
                     ),
                   ],
                 ),
               ),
               axis: TimelineAxis.vertical,
               indicatorStyle: IndicatorStyle(
                   // color: kPrimaryColor,
                   width: 50,
                   height: 50,
                   indicator: Container(
                       decoration: BoxDecoration(
                           borderRadius:
                               BorderRadius.circular(
                                   100 * fem),
                           color: klighGreyColor),
                       child: Center(
                         child: Text(
                           '4',
                           style: GoogleFonts.openSans(
                               textStyle: TextStyle(
                                   color: kLowTextColor,
                                   fontSize: 16 * ffem,
                                   fontWeight:
                                       FontWeight.w900)),
                         ),
                       ))),
               beforeLineStyle:
                   LineStyle(color: klighGreyColor),
               afterLineStyle:
                   LineStyle(color: klighGreyColor),
             ),
             TimelineTile(
               endChild:  Card(
                 margin: EdgeInsets.all(25),
                 child: Column(
                   children: [
                     SizedBox(
                       height: 10,
                     ),
                     Text(
                       'Đã nhận',
                       style: GoogleFonts.openSans(
                           textStyle: TextStyle(
                               fontSize: 15 * ffem,
                               fontWeight: FontWeight.w500,
                               color: klowTextGrey)),
                     ),
                     SizedBox(
                       height: 10,
                     ),
                   ],
                 ),
               ),
               axis: TimelineAxis.vertical,
               isLast: true,
               indicatorStyle: IndicatorStyle(
                   // color: kPrimaryColor,
                   width: 50,
                   height: 50,
                   indicator: Container(
                       decoration: BoxDecoration(
                           borderRadius:
                               BorderRadius.circular(
                                   100 * fem),
                           color: klighGreyColor),
                       child: Center(
                         child: Text(
                           '5',
                           style: GoogleFonts.openSans(
                               textStyle: TextStyle(
                                   color: kLowTextColor,
                                   fontSize: 16 * ffem,
                                   fontWeight:
                                       FontWeight.w900)),
                         ),
                       ))),
               beforeLineStyle:
                   LineStyle(color: klighGreyColor),
             )
           ],
         )
       ],
     ));
  }
}
