import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';
import 'package:unibean_app/presentation/blocs/role/role_app_bloc.dart';
import 'package:unibean_app/presentation/screens/screens.dart';
import '../../../../config/constants.dart';
import 'package:unibean_app/data/models.dart';

import '../../../../widgets/card_for_unknow.dart';
import '../../../../widgets/brand_card.dart';
import '../../../../widgets/voucher_list_card.dart';
import '../search_bar_custom.dart';
import 'voucher_card.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;

    final roleState = context.read<RoleAppBloc>().state;

    var roleWidget = (switch (roleState) {
      Unknown() =>
        Center(child: CardForUnknow(fem: fem, hem: hem, ffem: ffem)),

      Pending() => Container(),

      Rejected() => Container(),
      Unverified(
        // ignore: unused_local_variable
        authenModel: final authenModel,
      ) =>
        _buildVerified(fem, hem, ffem, null, authenModel, context),
      Verified(
        authenModel: final authenModel,
        studentModel: final studentModel
      ) =>
        _buildVerified(fem, hem, ffem, studentModel, authenModel, context),
      StoreRole() => Container(),
      RoleAppLoading() => Container(
          child: Center(
              child: Lottie.asset('assets/animations/loading-screen.json',
                  width: 50 * fem, height: 50 * hem)),
        )
    });

    return roleWidget;
  }

  Widget _buildVerified(double fem, double hem, double ffem,
      StudentModel? student, AuthenModel? authen, BuildContext context) {
    String studentName = '';
    if (student != null) {
      studentName = student.fullName;
    } else if (student == null && authen != null) {
      studentName = authen.userModel.email;
    }
    return CustomScrollView(
      controller: context.read<VoucherBloc>().scrollController,
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //header
                Container(
                  color: kbgWhiteColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20 * hem),
                        child: Center(
                          child: Text(
                            'Xin chào, ${studentName}!',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 21 * ffem,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Tham gia các hoạt động để tích lũy ưu đãi',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12 * ffem,
                                  fontWeight: FontWeight.normal)),
                        ),
                      ),
                      SizedBox(
                        height: 20 * hem,
                      ),
                      SearchBarCustom(),
                      SizedBox(
                        height: 15 * hem,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5 * hem,
                ),

                //Các thwung hiệu
                Container(
                  color: kbgWhiteColor,
                  padding: EdgeInsets.only(top: 15 * fem, bottom: 15 * fem),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10 * fem),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'THƯƠNG HIỆU',
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                fontSize: 15 * ffem,
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                              )),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, BrandListScreen.routeName);
                              },
                              child: Container(
                                height: 22 * hem,
                                width: 22 * fem,
                                margin: EdgeInsets.only(left: 8 * fem),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(80)),
                                child: Icon(
                                  Icons.arrow_forward_rounded,
                                  size: 18 * fem,
                                  color: kDarkPrimaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12 * hem,
                      ),
                      BlocBuilder<BrandBloc, BrandState>(
                          builder: (context, state) {
                        if (state is BrandsLoaded) {
                          return SizedBox(
                              height: 120 * hem,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.brands.length + 1,
                                itemBuilder: (context, index) {
                                  if (index == state.brands.length) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(context,
                                            BrandListScreen.routeName);
                                      },
                                      child: Container(
                                        width: 80 * fem,
                                        margin: EdgeInsets.only(
                                            left: 5 * fem, right: 5 * fem),
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      80 * fem),
                                              child: Container(
                                                width: 80 * fem,
                                                height: 80 * hem,
                                                color: Colors.white,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                  children: [
                                                    Icon(
                                                      Icons.arrow_forward,
                                                      size: 30,
                                                    ),
                                                    Text(
                                                      'Xem thêm',
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                      style: GoogleFonts
                                                          .openSans(
                                                              textStyle:
                                                                  TextStyle(
                                                        fontSize: 10 * ffem,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  } else {
                                    return BrandCard(
                                        fem: fem,
                                        hem: hem,
                                        ffem: ffem,
                                        brandModel: state.brands[index]);
                                  }
                                },
                              ));
                        }
                        return Container(
                            child: Center(
                                child: Lottie.asset(
                                    'assets/animations/loading-screen.json',
                                    width: 50 * fem,
                                    height: 50 * hem)));
                      }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5 * hem,
                ),

                //GỢi ý cho bạn
                Container(
                  color: kbgWhiteColor,
                  padding: EdgeInsets.only(top: 20 * hem, bottom: 20 * fem),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10 * fem),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'GỢI Ý CHO BẠN',
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                fontSize: 15 * ffem,
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                              )),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 20 * hem,
                                width: 20 * fem,
                                margin: EdgeInsets.only(
                                    left: 8 * fem, top: 2 * hem),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(80)),
                                child: Icon(
                                  Icons.arrow_forward_rounded,
                                  size: 16 * fem,
                                  color: kDarkPrimaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10 * fem,
                      ),
                      BlocBuilder<VoucherBloc, VoucherState>(
                        builder: (context, state) {
                          if (state is VouchersLoaded) {
                            return SizedBox(
                                height: 255 * hem,
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.vouchers.length,
                                  itemBuilder: (context, index) {
                                    return VoucherCard(
                                      fem: fem,
                                      hem: hem,
                                      ffem: ffem,
                                      voucherModel: state.vouchers[index],
                                    );
                                  },
                                ));
                          }
                          return Center(
                              child: Lottie.asset(
                                  'assets/animations/loading-screen.json',
                                  width: 50 * fem,
                                  height: 50 * hem));
                        },
                      ),
                      SizedBox(
                        height: 20 * hem,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 5 * hem,
                ),

                //Ưu đãi tốt
                Container(
                  padding: EdgeInsets.only(top: 15 * hem, bottom: 15 * hem),
                  color: kbgWhiteColor,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10 * fem),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ƯU ĐÃI TỐT',
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                fontSize: 15 * ffem,
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                              )),
                            ),
                          ],
                        ),
                      ),
                      BlocBuilder<VoucherBloc, VoucherState>(
                        builder: (context, state) {
                          if (state is VouchersLoaded) {
                            return Column(
                              children: [
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: state.hasReachedMax
                                      ? state.vouchers.length
                                      : state.vouchers.length + 1,
                                  itemBuilder: (context, index) {
                                    if (index >= state.vouchers.length) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: kPrimaryColor,
                                        ),
                                      );
                                    } else {
                                      return VoucherListCard(
                                        fem: fem,
                                        hem: hem,
                                        ffem: ffem,
                                        voucherModel: state.vouchers[index],
                                        onPressed: () {
                                          Navigator.pushNamed(context,
                                              VoucherDetailScreen.routeName,
                                              arguments:
                                                  state.vouchers[index].id);
                                        },
                                      );
                                    }
                                  },
                                ),
                              ],
                            );
                          }
                          return Center(
                              child: Lottie.asset(
                                  'assets/animations/loading-screen.json',
                                  width: 50 * fem,
                                  height: 50 * hem));
                        },
                      )
                    ],
                  ),
                ),
              ],
            )
          ]),
        )
      ],
    );
  }
}
