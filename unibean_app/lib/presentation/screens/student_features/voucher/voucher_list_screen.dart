import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/domain/repositories.dart';
import 'package:unibean_app/presentation/config/constants.dart';

import '../../../../data/models.dart';
import '../../../blocs/blocs.dart';
import '../../screens.dart';
import '../profile_voucher/components/is_used_button.dart';
import '../profile_voucher/components/not_use_butotn.dart';

class VoucherListScreen extends StatelessWidget {
  static const String routeName = '/voucher-list-student';

  static Route route({required String search, required String studentId}) {
    return MaterialPageRoute(
        builder: (_) => VoucherListScreen(
              search: search,
              studentId: studentId,
            ),
        settings: const RouteSettings(arguments: routeName));
  }

  const VoucherListScreen(
      {super.key, required this.search, required this.studentId});
  final String search;
  final String studentId;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double baseHeight = 812;
    double ffem = fem * 0.97;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return BlocProvider(
      create: (context) =>
          StudentBloc(studentRepository: context.read<StudentRepository>())
            ..add(LoadStudentVouchers(search: search, id: studentId)),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: klighGreyColor,
            appBar: AppBar(
              elevation: 0,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/images/background_splash.png'),
                        fit: BoxFit.cover)),
              ),
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 25 * fem,
                ),
              ),
              toolbarHeight: 50 * hem,
              centerTitle: true,
              title: Text(
                'Kết quả tìm kiếm',
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        fontSize: 18 * ffem,
                        fontWeight: FontWeight.w900,
                        height: 1.3625 * ffem / fem,
                        color: Colors.white)),
              ),
              actions: [
                // SvgPicture.asset('assets/icons/notification-icon.svg')
                Padding(
                  padding: EdgeInsets.only(right: 20 * fem),
                  child: IconButton(
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 25 * fem,
                    ),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context,
                          '/landing-screen', (Route<dynamic> route) => false);
                    },
                  ),
                ),
              ],
            ),
            body: BodyVoucherList(
              fem: fem,
              hem: hem,
              ffem: ffem,
              search: search,
              studentId: studentId,
            )),
      ),
    );
  }
}

class BodyVoucherList extends StatefulWidget {
  const BodyVoucherList({
    super.key,
    required this.fem,
    required this.hem,
    required this.ffem,
    required this.search,
    required this.studentId,
  });

  final double fem;
  final double hem;
  final double ffem;
  final String search;
  final String studentId;

  @override
  State<BodyVoucherList> createState() => _BodyVoucherListState();
}

class _BodyVoucherListState extends State<BodyVoucherList> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(() {
      context.read<StudentBloc>().add(LoadMoreStudentVouchers(scrollController,
          id: widget.studentId, search: widget.search));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          BlocBuilder<StudentBloc, StudentState>(
            builder: (context, state) {
              if (state is StudentVoucherLoading) {
                return buildVoucherShimmer(3, widget.fem, widget.hem);
              } else if (state is StudentVouchersLoaded) {
                if (state.voucherModels.isEmpty) {
                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(
                        left: 15 * widget.fem, right: 15 * widget.fem, top: 20),
                    height: 220 * widget.hem,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/empty.svg',
                          width: 60 * widget.fem,
                          colorFilter:
                              ColorFilter.mode(kLowTextColor, BlendMode.srcIn),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              'Không tìm thấy',
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  final vouchers = state.voucherModels;
                  vouchers.sort((a, b) => b.dateBought.compareTo(a.dateBought));
                  vouchers.sort((a, b) => a.isUsed ? 1 : -1);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                                          top: 15 * widget.hem,
                                          left: 10 * widget.fem,
                                          right: 10 * widget.fem),
                                      constraints: BoxConstraints(
                                          maxHeight: 150 * widget.hem,
                                          minWidth: 340 * widget.fem),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              15 * widget.fem),
                                          color: Colors.white,
                                          border:
                                              Border.all(color: klighGreyColor),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color(0x0c000000),
                                                offset: Offset(0 * widget.fem,
                                                    0 * widget.fem),
                                                blurRadius: 5 * widget.fem)
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
                                                width: 130 * widget.fem,
                                                height: 140 * widget.hem,
                                                child: Image.network(
                                                  studentVoucher.voucherImage,
                                                  fit: BoxFit.fill,
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return Icon(
                                                      Icons.error_outlined,
                                                      size: 50 * widget.fem,
                                                      color: kPrimaryColor,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8 * widget.fem,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5 * widget.hem,
                                                    bottom: 5 * widget.hem),
                                                child: Text(
                                                    studentVoucher.brandName,
                                                    textAlign: TextAlign.center,
                                                    softWrap: true,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.openSans(
                                                        textStyle: TextStyle(
                                                      fontSize:
                                                          12 * widget.ffem,
                                                      color: kDarkPrimaryColor,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ))),
                                              ),
                                              Container(
                                                width: 200 * widget.fem,
                                                child: Text(
                                                    studentVoucher.voucherName,
                                                    softWrap: true,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.openSans(
                                                        textStyle: TextStyle(
                                                      fontSize:
                                                          14 * widget.ffem,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ))),
                                              ),
                                              SizedBox(
                                                height: 5 * widget.hem,
                                              ),
                                              Container(
                                                child: Text(
                                                    'Thời gian sử dụng:',
                                                    style: GoogleFonts.openSans(
                                                        textStyle: TextStyle(
                                                      fontSize:
                                                          12 * widget.ffem,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ))),
                                              ),
                                              Container(
                                                width: 200 * widget.fem,
                                                child: Text(
                                                    '${changeFormateDate(studentVoucher.validOn)} - ${changeFormateDate(studentVoucher.expireOn)}',
                                                    style: GoogleFonts.openSans(
                                                        textStyle: TextStyle(
                                                      fontSize:
                                                          12 * widget.ffem,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ))),
                                              ),
                                              SizedBox(
                                                height: 5 * widget.hem,
                                              ),
                                              Container(
                                                child: Text(
                                                    'Ngày mua: ${changeFormateDate(studentVoucher.dateBought)}',
                                                    style: GoogleFonts.openSans(
                                                        textStyle: TextStyle(
                                                      fontSize:
                                                          12 * widget.ffem,
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
                                    buildButtonVoucher(
                                        widget.hem, widget.fem, studentVoucher)
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  );
                }
              }
              return buildVoucherStudentShimmer(3, widget.fem, widget.hem);
            },
          ),
        ]))
      ],
    );
  }

  Positioned buildButtonVoucher(
      double hem, double fem, VoucherStudentModel studentVoucher) {
    if (studentVoucher.isUsed) {
      return Positioned(
          bottom: 9 * hem,
          right: 25 * fem,
          child: IsUsedButton(fem: fem, hem: hem));
    } else if (DateTime.now()
        .isAfter(DateTime.parse(studentVoucher.expireOn))) {
      return Positioned(
          bottom: 9 * hem,
          right: 25 * fem,
          child: Text(
            'Đã quá hạn',
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey)),
          ));
    } else {
      return Positioned(
          bottom: 9 * hem,
          right: 25 * fem,
          child: NotUseButton(
            fem: fem,
            hem: hem,
            id: studentVoucher.id,
          ));
    }
  }
}

Widget buildVoucherStudentShimmer(count, double fem, double hem) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        width: 170 * fem,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15 * fem),
          color: Colors.white,
        ),
      ),
      Container(
        width: 170 * fem,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15 * fem),
          color: Colors.white,
        ),
      )
    ],
  );
}
