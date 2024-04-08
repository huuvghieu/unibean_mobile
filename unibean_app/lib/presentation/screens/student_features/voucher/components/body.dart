import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/presentation/screens/screens.dart';

import '../../../../blocs/blocs.dart';
import '../../../../config/constants.dart';
import '../../profile_voucher/components/is_used_button.dart';
import '../../profile_voucher/components/not_use_butotn.dart';
import '../search_bar_custom.dart';

class Body extends StatelessWidget {
  const Body({super.key});

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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10 * fem,
              ),
              SearchBarCustom(),
              SizedBox(
                height: 10 * fem,
              ),
              BlocBuilder<StudentBloc, StudentState>(
                builder: (context, state) {
                  if (state is StudentVouchersLoaded) {
                    if (state.voucherModels.isEmpty) {
                      return Container(
                        width: double.infinity,
                        margin:
                            EdgeInsets.only(left: 15 * fem, right: 15 * fem),
                        height: 220 * hem,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/voucher-navbar-icon.svg',
                              width: 60 * fem,
                              colorFilter: ColorFilter.mode(
                                  kLowTextColor, BlendMode.srcIn),
                            ),
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  'Bạn chưa có ưu đãi nào',
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  )),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10 * fem,
                            ),
                            TextButton(
                              onPressed: () {
                                context
                                    .read<LandingScreenBloc>()
                                    .add(TabChange(tabIndex: 0));
                              },
                              child: Container(
                                  width: 180 * fem,
                                  height: 45 * hem,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: kPrimaryColor, width: 2),
                                      borderRadius:
                                          BorderRadius.circular(15 * fem)),
                                  child: Center(
                                    child: Text(
                                      'Khám phá ngay',
                                      style: GoogleFonts.openSans(
                                          textStyle: TextStyle(
                                              fontSize: 15 * ffem,
                                              fontWeight: FontWeight.bold,
                                              color: kPrimaryColor)),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      );
                    } else {
                      final vouchers = state.voucherModels;
                      vouchers.sort((a, b) => a.isUsed ? 1 : -1);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: vouchers.length,
                              itemBuilder: (context, index) {
                                var studentVoucher = vouchers[index];
                                return GestureDetector(
                                  onTap: () async {
                                    Navigator.pushNamed(context,
                                        VoucherItemDetailScreen.routeName,
                                        arguments: studentVoucher);
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 15 * hem,
                                            left: 10 * fem,
                                            right: 10 * fem),
                                        constraints: BoxConstraints(
                                            maxHeight: 150 * hem,
                                            minWidth: 340 * fem),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15 * fem),
                                            color: Colors.white,
                                            border: Border.all(
                                                color: klighGreyColor),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color(0x0c000000),
                                                  offset:
                                                      Offset(0 * fem, 0 * fem),
                                                  blurRadius: 5 * fem)
                                            ]),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.all(5),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Container(
                                                  width: 130 * fem,
                                                  height: 140 * hem,
                                                  child: Image.network(
                                                    studentVoucher.voucherImage,
                                                    fit: BoxFit.fill,
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                      return Icon(
                                                        Icons.error_outlined,
                                                        size: 50 * fem,
                                                        color: kPrimaryColor,
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8 * fem,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 5 * hem,
                                                      bottom: 5 * hem),
                                                  child: Text(
                                                      studentVoucher.brandName,
                                                      textAlign:
                                                          TextAlign.center,
                                                      softWrap: true,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style:
                                                          GoogleFonts.openSans(
                                                              textStyle:
                                                                  TextStyle(
                                                        fontSize: 12 * ffem,
                                                        color:
                                                            kDarkPrimaryColor,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ))),
                                                ),
                                                Container(
                                                  width: 200 * fem,
                                                  child: Text(
                                                      studentVoucher
                                                          .voucherName,
                                                      softWrap: true,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style:
                                                          GoogleFonts.openSans(
                                                              textStyle:
                                                                  TextStyle(
                                                        fontSize: 14 * ffem,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ))),
                                                ),
                                                SizedBox(
                                                  height: 5 * hem,
                                                ),
                                                Container(
                                                  child: Text(
                                                      'Thời gian sử dụng:',
                                                      style:
                                                          GoogleFonts.openSans(
                                                              textStyle:
                                                                  TextStyle(
                                                        fontSize: 12 * ffem,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ))),
                                                ),
                                                Container(
                                                  width: 200 * fem,
                                                  child: Text(
                                                      '${changeFormateDate(studentVoucher.validOn)} - ${changeFormateDate(studentVoucher.expireOn)}',
                                                      style:
                                                          GoogleFonts.openSans(
                                                              textStyle:
                                                                  TextStyle(
                                                        fontSize: 12 * ffem,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ))),
                                                ),
                                                SizedBox(
                                                  height: 5 * hem,
                                                ),
                                                Container(
                                                  child: Text(
                                                      'Ngày mua: ${changeFormateDate(studentVoucher.dateBought)}',
                                                      style:
                                                          GoogleFonts.openSans(
                                                              textStyle:
                                                                  TextStyle(
                                                        fontSize: 12 * ffem,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ))),
                                                ),
                                               ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 10 * hem,
                                          right: 25 * fem,
                                          child: studentVoucher.isUsed
                                              ? IsUsedButton(fem: fem, hem: hem)
                                              : NotUseButton(
                                                  fem: fem,
                                                  hem: hem,
                                                  id: studentVoucher
                                                      .voucherCode)),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    }
                  } else if (state is StudentVoucherLoading) {
                    return Center(
                        child: Lottie.asset(
                            'assets/animations/loading-screen.json',
                            width: 50 * fem,
                            height: 50 * hem));
                  }
                  return Center(
                      child: Lottie.asset(
                          'assets/animations/loading-screen.json',
                          width: 50 * fem,
                          height: 50 * hem));
                },
              )
            ],
          )
        ]))
      ],
    );
  }
}
