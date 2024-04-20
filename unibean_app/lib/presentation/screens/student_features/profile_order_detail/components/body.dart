import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/data/models/student_features/order_detail_model.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/student_features/profile_order_detail/components/order_state_2.dart';
import 'package:unibean_app/presentation/screens/student_features/profile_order_detail/components/order_state_3.dart';
import 'package:unibean_app/presentation/screens/student_features/profile_order_detail/components/order_state_4.dart';

import '../../../../../data/models.dart';
import '../../../../blocs/blocs.dart';
import '../../../store_features/brand/components/detail_shadow_bottom.dart';
import 'order_state_1.dart';
import 'order_state_5.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return BlocBuilder<StudentBloc, StudentState>(
      builder: (context, state) {
        if (state is StudentOrderDetailLoading) {
          return Container(
            child: Center(
                child: Lottie.asset('assets/animations/loading-screen.json')),
          );
        } else if (state is StudentOrderDetailLoaded) {
          final orderDetail = state.orderDetailModel;
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildOrderStateWidget(ffem, fem, orderDetail),
                      SizedBox(
                        height: 5 * hem,
                      ),
                      Container(
                          width: double.infinity,
                          color: Colors.white,
                          padding: EdgeInsets.only(
                              top: 15, bottom: 15, left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'THÔNG TIN NGƯỜI NHẬN',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        fontSize: 16 * ffem,
                                        fontWeight: FontWeight.w600,
                                        color: kPrimaryColor)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${orderDetail.studentName} - MSSV: ${orderDetail.studentCode}',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        fontSize: 16 * ffem,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/calendar-icon.svg',
                                    width: 15 * fem,
                                  ),
                                  SizedBox(
                                    width: 5 * fem,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Ngày đặt: ',
                                        style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                          fontSize: 15 * ffem,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        )),
                                      ),
                                      Text(
                                        '${changeFormateDate(orderDetail.dateCreated)}',
                                        style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                          fontSize: 15 * ffem,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        )),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          )),
                      SizedBox(
                        height: 5 * hem,
                      ),
                      Container(
                          width: double.infinity,
                          color: Colors.white,
                          padding: EdgeInsets.only(
                              top: 15, bottom: 15, left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'THÔNG TIN TRẠM',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        fontSize: 16 * ffem,
                                        fontWeight: FontWeight.w600,
                                        color: kPrimaryColor)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${orderDetail.stationName}',
                                textAlign: TextAlign.start,
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        fontSize: 16 * ffem,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Số điện thoại: ',
                                        style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                          fontSize: 15 * ffem,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        )),
                                      ),
                                      Text(
                                        '${orderDetail.stationPhone}',
                                        style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                          fontSize: 15 * ffem,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Thời gian làm việc: ',
                                        style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                          fontSize: 15 * ffem,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        )),
                                      ),
                                      Text(
                                        '${formatTime(orderDetail.stationOpeningHours)} - ${formatTime(orderDetail.stationClosingHours)}',
                                        style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                          fontSize: 15 * ffem,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Địa chỉ: ',
                                        style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                          fontSize: 15 * ffem,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        )),
                                      ),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          '${orderDetail.stationAdress}',
                                          textAlign: TextAlign.end,
                                          style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                            fontSize: 15 * ffem,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 5 * hem,
                      ),
                      Container(
                          width: double.infinity,
                          color: Colors.white,
                          padding: EdgeInsets.only(
                              top: 5, bottom: 15, left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SẢN PHẨM',
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
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: orderDetail.orderDetails.length,
                                itemBuilder: (context, index) {
                                  final orderD =
                                      orderDetail.orderDetails[index];
                                  return Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(5 * fem),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                  orderD.productImage,
                                                  height: 80,
                                                  width: 80,
                                                  fit: BoxFit.fill,
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return Image.asset(
                                                      'assets/images/image-404.jpg',
                                                      height: 80,
                                                      width: 80,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              width: 50 * fem,
                                              height: 22,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: kPrimaryColor),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '${orderD.quantity}x',
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.openSans(
                                                        textStyle: TextStyle(
                                                            fontSize: 12 * ffem,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color:
                                                                kPrimaryColor)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Container(
                                              width: 90 * fem,
                                              child: Text(
                                                '${orderD.productName}',
                                                textAlign: TextAlign.start,
                                                maxLines: 2,
                                                style: GoogleFonts.openSans(
                                                    textStyle: TextStyle(
                                                        fontSize: 13 * ffem,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black)),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '${formatter.format(orderD.price).toString()}',
                                                  style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                    fontSize: 15 * ffem,
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                                ),
                                                SizedBox(
                                                  width: 5 * fem,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 4 * hem,
                                                      bottom: 2 * hem),
                                                  child: SvgPicture.asset(
                                                    'assets/icons/red-bean-icon.svg',
                                                    width: 18 * fem,
                                                    height: 16 * fem,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider()
                                    ],
                                  );
                                },
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Tổng đậu đỏ: ',
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            fontSize: 18 * ffem,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${formatter.format(orderDetail.amount)}',
                                        style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                          fontSize: 30 * ffem,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        )),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 5 * fem,
                                            top: 4 * hem,
                                            bottom: 0 * hem),
                                        child: SvgPicture.asset(
                                          'assets/icons/red-bean-icon.svg',
                                          width: 22 * fem,
                                          height: 24 * fem,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                ]),
              )
            ],
          );
        }
        return Container();
      },
    );
  }

  Widget _buildOrderStateWidget(ffem, fem, OrderDetailModel orderDetail) {
    if (orderDetail.stateDetails.length == 1) {
      return OrderState1(ffem: ffem, orderDetail: orderDetail, fem: fem);
    } else if (orderDetail.stateDetails.length == 2) {
      return OrderState2(ffem: ffem, orderDetail: orderDetail, fem: fem);
    } else if (orderDetail.stateDetails.length == 3) {
      return OrderState3(ffem: ffem, orderDetail: orderDetail, fem: fem);
    } else if (orderDetail.stateDetails.length == 4) {
      return OrderState4(ffem: ffem, orderDetail: orderDetail, fem: fem);
    } else if (orderDetail.stateDetails.length == 5){
       return OrderState5(ffem: ffem, orderDetail: orderDetail, fem: fem);
    } else {
      return Container();
    }
  }
}
