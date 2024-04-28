import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/data/models/student_features/voucher_student_model.dart';
import 'package:unibean_app/presentation/screens/screens.dart';

import '../../../../blocs/blocs.dart';
import '../../../../config/constants.dart';
import '../../../../widgets/paint_voucher_card.dart';
import '../search_bar_custom.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.studentId});
  final String studentId;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(() {
      context
          .read<StudentBloc>()
          .add(LoadMoreStudentVouchers(scrollController, id: widget.studentId));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return BlocListener<InternetBloc, InternetState>(
      listener: (context, state) {
        if (state is Connected) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              elevation: 0,
              duration: const Duration(milliseconds: 2000),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'Đã kết nối internet',
                message: 'Đã kết nối internet!',
                contentType: ContentType.success,
              ),
            ));
        } else if (state is NotConnected) {
          showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: const Text('Không kết nối Internet'),
                content: Text('Vui lòng kết nối Internet'),
                actions: [
                  TextButton(
                      onPressed: () {
                        final stateInternet =
                            context.read<InternetBloc>().state;
                        if (stateInternet is Connected) {
                          Navigator.pop(context);
                        } else {}
                      },
                      child: const Text('Đồng ý'))
                ],
              );
            },
          );
        }
      },
      child: RefreshIndicator(
        onRefresh: () async {
          context
              .read<StudentBloc>()
              .add(LoadStudentVouchers(id: widget.studentId));
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: scrollController,
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // InkWell(
                  //   onTap: () {
                  //     context.read<StudentBloc>().add(HideUsedVouchers());
                  //   },
                  //   child: Text(
                  //     'Ẩn đã sử dụng',
                  //     style: GoogleFonts.openSans(
                  //         textStyle: TextStyle(
                  //       color: Colors.black,
                  //       fontWeight: FontWeight.w600,
                  //       fontSize: 16,
                  //     )),
                  //   ),
                  // ),
                  SizedBox(
                    height: 15 * fem,
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
                            margin: EdgeInsets.only(
                                left: 15 * fem, right: 15 * fem),
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

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 15 * hem),
                              Container(
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: state.hasReachedMax
                                      ? vouchers.length
                                      : vouchers.length + 1,
                                  itemBuilder: (context, index) {
                                    if (index >= state.voucherModels.length) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: kPrimaryColor,
                                        ),
                                      );
                                    } else {
                                      var studentVoucher = vouchers[index];
                                      return Container(
                                        decoration: BoxDecoration(boxShadow: [
                                          BoxShadow(
                                              color: Color(0x0c000000),
                                              offset: Offset(3 * fem, 2 * fem),
                                              blurRadius: 5 * fem)
                                        ]),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.18,
                                        margin: EdgeInsets.only(
                                            bottom: 15, left: 15, right: 15),
                                        width: double.infinity,
                                        child: VoucherCard(
                                            studentVoucher: studentVoucher,
                                            fem: fem,
                                            hem: hem),
                                      );
                                    }
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
        ),
      ),
    );
  }
}

class VoucherCard extends StatelessWidget {
  const VoucherCard({
    super.key,
    required this.studentVoucher,
    required this.fem,
    required this.hem,
  });

  final VoucherStudentModel studentVoucher;
  final double fem;
  final double hem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, VoucherItemDetailScreen.routeName,
            arguments: studentVoucher);
      },
      child: Stack(children: [
        Row(
          children: [
            Expanded(
              child: Container(
                color: kPrimaryColor,
                child: Center(
                    child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    '${studentVoucher.brandName}',
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                )),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${studentVoucher.voucherName}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: Row(children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Column(children: [
                              Expanded(
                                flex: 2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    width: 130 * fem,
                                    height: 140 * hem,
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
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                            ]),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Ngày mua: ',
                                        style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black)),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '${changeFormateDate(studentVoucher.dateBought)}',
                                          style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Hạn sử dụng: ',
                                        style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black)),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '${changeFormateDate(studentVoucher.expireOn)}',
                                          style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black)),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  buildButtonVoucher(
                                      hem, fem, studentVoucher, context)
                                ]),
                          ),
                        ]),
                      ),
                    ]),
              ),
            ),
          ],
        ),
        CustomPaint(
          painter: SideCutsDesign(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
          ),
        ),
        CustomPaint(
          painter: DottedInitialPath(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
          ),
        ),
        CustomPaint(
          painter: DottedMiddlePath(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
          ),
        ),
      ]),
    );
  }

  Widget buildButtonVoucher(
      double hem, double fem, VoucherStudentModel studentVoucher, context) {
    if (studentVoucher.isUsed) {
      return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, QRVoucherScreen.routeName,
              arguments: studentVoucher.voucherCode);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: klighGreyColor,
            shape: const StadiumBorder(
              side: BorderSide(width: 1, color: klowTextGrey),
            )),
        child: Text(
          'Đã sử dụng',
          style: GoogleFonts.openSans(
              textStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: klowTextGrey)),
        ),
      );
    } else if (DateTime.now()
        .isAfter(DateTime.parse(studentVoucher.expireOn))) {
      return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, QRVoucherScreen.routeName,
              arguments: studentVoucher.voucherCode);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: klighGreyColor,
            shape: const StadiumBorder(
              side: BorderSide(width: 1, color: klowTextGrey),
            )),
        child: Text(
          'Đã quá hạn',
          style: GoogleFonts.openSans(
              textStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: klowTextGrey)),
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, QRVoucherScreen.routeName,
              arguments: studentVoucher.voucherCode);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: const StadiumBorder(
              side: BorderSide(width: 1, color: klightPrimaryColor),
            )),
        child: Text(
          'Mã QR',
          style: GoogleFonts.openSans(
              textStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor)),
        ),
      );
    }
  }
}
