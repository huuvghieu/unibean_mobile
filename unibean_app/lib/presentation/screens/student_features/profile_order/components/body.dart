import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/presentation/screens/screens.dart';
import '../../../../blocs/blocs.dart';
import '../../../../config/constants.dart';
import '../../../../widgets/shimmer_widget.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.id});
  final String id;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      context.read<StudentBloc>().add(LoadMoreOrders(scrollController));
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
          context.read<StudentBloc>().add(LoadStudentOrders(id: widget.id));
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: scrollController,
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                BlocBuilder<StudentBloc, StudentState>(
                  builder: (context, state) {
                    if (state is StudentOrdersLoaded) {
                      if (state.orderModels.isEmpty) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 20 * hem,
                            ),
                            Container(
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
                                    'assets/icons/empty-icon.svg',
                                    width: 70 * fem,
                                    colorFilter: ColorFilter.mode(
                                        kLowTextColor, BlendMode.srcIn),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        'Bạn chưa có đơn hàng nào',
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
                                      Navigator.pushNamed(
                                        context,
                                        ProductScreen.routeName,
                                      );
                                    },
                                    child: Container(
                                        width: 180 * fem,
                                        height: 45 * hem,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: kPrimaryColor, width: 2),
                                            borderRadius: BorderRadius.circular(
                                                15 * fem)),
                                        child: Center(
                                          child: Text(
                                            'Đặt hàng ngay',
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
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.hasReachedMax
                                  ? state.orderModels.length
                                  : state.orderModels.length + 1,
                              itemBuilder: (context, index) {
                                if (index >= state.orderModels.length) {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: kPrimaryColor,
                                    ),
                                  );
                                } else {
                                  var order = state.orderModels[index];

                                  return GestureDetector(
                                    onTap: () async {
                                      final studentId =
                                          await AuthenLocalDataSource
                                              .getStudentId();
                                      Navigator.pushNamed(
                                          context, OrderDetailScreen.routeName,
                                          arguments: <dynamic>[
                                            order.id,
                                            studentId
                                          ]);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: 15 * hem,
                                          left: 20 * fem,
                                          right: 20 * fem),
                                      padding: EdgeInsets.only(
                                          left: 15 * fem,
                                          right: 15 * fem,
                                          top: 10 * fem,
                                          bottom: 10 * fem),
                                      constraints: BoxConstraints(
                                          // maxHeight: 250 * hem,
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
                                                offset:
                                                    Offset(0 * fem, 0 * fem),
                                                blurRadius: 5 * fem)
                                          ]),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: Container(
                                                  width: 100 * fem,
                                                  height: 100 * hem,
                                                  child: Image.network(
                                                    order.orderImage,
                                                    fit: BoxFit.fill,
                                                    loadingBuilder: (context,
                                                        child,
                                                        loadingProgress) {
                                                      if (loadingProgress ==
                                                          null) {
                                                        return child;
                                                      }
                                                      return ShimmerWidget
                                                          .rectangular(
                                                              height: 80);
                                                    },
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                      return Image.asset(
                                                        'assets/images/image-404.jpg',
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                width: 200,
                                                child: Text(
                                                    'Mã đơn hàng: #${order.id}',
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.openSans(
                                                        textStyle: TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 15 * ffem,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ))),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Trạm nhận:',
                                                  style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                    fontSize: 15 * ffem,
                                                    color: kLowTextColor,
                                                    fontWeight: FontWeight.w500,
                                                  ))),
                                              Container(
                                                width: 150,
                                                child: Text(
                                                    '${order.stationName}',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.end,
                                                    style: GoogleFonts.openSans(
                                                        textStyle: TextStyle(
                                                      fontSize: 15 * ffem,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ))),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Thời gian đặt:',
                                                  style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                    fontSize: 15 * ffem,
                                                    color: kLowTextColor,
                                                    fontWeight: FontWeight.w500,
                                                  ))),
                                              Text(
                                                  '${_formatDatetime(order.dateCreated)}',
                                                  style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                    fontSize: 15 * ffem,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                  )))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Tổng đậu đỏ:',
                                                  style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                    fontSize: 15 * ffem,
                                                    color: kLowTextColor,
                                                    fontWeight: FontWeight.w500,
                                                  ))),
                                              Text(
                                                  '${formatter.format(order.amount)}',
                                                  style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                    fontSize: 15 * ffem,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                  )))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Tình trạng:',
                                                  style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                    fontSize: 15 * ffem,
                                                    color: kLowTextColor,
                                                    fontWeight: FontWeight.w500,
                                                  ))),
                                              Text('${order.currentStateName}',
                                                  style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                    fontSize: 15 * ffem,
                                                    color: colorOfState(
                                                        order.currentStateName),
                                                    fontWeight: FontWeight.w600,
                                                  )))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        );
                      }
                    } else if (state is StudentOrderLoading) {
                      return buildOrderShimmer(4, fem, hem);
                    }
                    return Center(
                        child: Lottie.asset(
                            'assets/animations/loading-screen.json',
                            width: 50 * fem,
                            height: 50 * hem));
                  },
                ),
                SizedBox(
                  height: 15 * hem,
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}

Color colorOfState(String stateName) {
  if (stateName == 'Đã hủy') {
    return Color(0xfffff4d4f);
  } else if (stateName == 'Đã nhận hàng' || stateName == "Hàng đã tới trạm") {
    return kPrimaryColor;
  } else {
    return kYellow;
  }
}

String _formatDatetime(String date) {
  DateTime dateTime = DateTime.parse(date).add(Duration(hours: 7));

  String formattedDatetime = DateFormat("HH:mm - dd/MM/yyyy").format(dateTime);
  return formattedDatetime;
}

Widget buildOrderShimmer(count, double fem, double hem) {
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
            margin:
                EdgeInsets.only(top: 15 * hem, left: 10 * fem, right: 10 * fem),
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
