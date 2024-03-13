import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/domain/repositories.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';

import '../../../../config/constants.dart';
import '../../../../widgets/shimmer_widget.dart';
import 'is_used_button.dart';
import 'not_use_butotn.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    // double heightText = 1.3625 * ffem / fem;

    return BlocProvider(
      create: (context) =>
          StudentBloc(studentRepository: context.read<StudentRepository>())
            ..add(LoadStudentVouchers(id: id)),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 20 * fem,
              ),
              BlocBuilder<StudentBloc, StudentState>(
                builder: (context, state) {
                  if (state is StudentVouchersLoaded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.voucherModels.length,
                          itemBuilder: (context, index) {
                            var studentVoucher = state.voucherModels[index];
                            return GestureDetector(
                              onTap: () {
                                // Navigator.pushNamed(
                                //     context, CampaignDetailScreen.routeName);
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
                                        border:
                                            Border.all(color: klighGreyColor),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(0x0c000000),
                                              offset: Offset(0 * fem, 0 * fem),
                                              blurRadius: 5 * fem)
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft:
                                                  Radius.circular(10 * fem),
                                              bottomLeft:
                                                  Radius.circular(10 * fem)),
                                          child: Container(
                                            width: 140 * fem,
                                            height: 160 * hem,
                                            child: Image.network(
                                              studentVoucher.voucherImage,
                                              fit: BoxFit.fill,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Icon(
                                                  Icons.error_outlined,
                                                  size: 50 * fem,
                                                  color: kPrimaryColor,
                                                );
                                              },
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
                                                  textAlign: TextAlign.center,
                                                  softWrap: true,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                    fontSize: 12 * ffem,
                                                    color: kDarkPrimaryColor,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ))),
                                            ),
                                            Container(
                                              width: 200 * fem,
                                              child: Text(
                                                  studentVoucher.voucherName,
                                                  softWrap: true,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                    fontSize: 14 * ffem,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                  ))),
                                            ),
                                            SizedBox(
                                              height: 5 * hem,
                                            ),
                                            Container(
                                              child: Text('Thời gian sử dụng:',
                                                  style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
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
                                                  style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
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
                                              id: studentVoucher.voucherCode)),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  } else if (state is StudentVoucherLoading) {
                    return buildVoucherShimmer(10, fem, hem);
                  }
                  return Center(
                      child: Lottie.asset(
                          'assets/animations/loading-screen.json',
                          width: 50 * fem,
                          height: 50 * hem));
                },
              )
            ]),
          )
        ],
      ),
    );
  }
}

Widget buildVoucherShimmer(count, double fem, double hem) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: count,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(
                top: 15 * hem, left: 10 * fem, right: 10 * fem),
            constraints:
                BoxConstraints(maxHeight: 150 * hem, minWidth: 340 * fem),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15 * fem),
                color: Colors.white,
                border: Border.all(color: klighGreyColor),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x0c000000),
                      offset: Offset(0 * fem, 0 * fem),
                      blurRadius: 5 * fem)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerWidget.rectangular(
                  height: 150 * hem,
                  width: 140 * fem,
                ),
                SizedBox(
                  width: 8 * fem,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ShimmerWidget.rectangular(
                      height: 15 * hem,
                      width: 150 * fem,
                    ),
                    ShimmerWidget.rectangular(
                      height: 15 * hem,
                      width: 200 * fem,
                    ),
                  
                    ShimmerWidget.rectangular(
                      height: 15 * hem,
                      width: 200 * fem,
                    ),
                  
                  ],
                )
              ],
            ),
          );
        },
      ),
    ],
  );
}

