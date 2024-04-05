import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/presentation/blocs/student/student_bloc.dart';
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

    return CustomScrollView(
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
                                        borderRadius:
                                            BorderRadius.circular(15 * fem)),
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
                                onTap: () {
                                  // Navigator.pushNamed(
                                  //     context, CampaignDetailScreen.routeName);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: 15 * hem,
                                      left: 20 * fem,
                                      right: 20 * fem),
                                  padding: EdgeInsets.only(
                                      left: 15 * fem, right: 15 * fem),
                                  constraints: BoxConstraints(
                                      maxHeight: 150 * hem,
                                      minWidth: 340 * fem),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(15 * fem),
                                      color: Colors.white,
                                      border: Border.all(color: klighGreyColor),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0x0c000000),
                                            offset: Offset(0 * fem, 0 * fem),
                                            blurRadius: 5 * fem)
                                      ]),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: ClipRRect(
                                              child: Container(
                                                width: 100 * fem,
                                                height: 80 * hem,
                                                child: Image.asset(
                                                  'assets/images/bean_logo.jpg',
                                                  fit: BoxFit.fill,
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
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
                                          Expanded(
                                            flex: 3,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 5 * hem,
                                                  ),
                                                  child: Text('Trạm',
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
                                                        fontSize: 15 * ffem,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ))),
                                                ),
                                                Container(
                                                  // width: 300*fem,
                                                  child: Text(order.stationName,
                                                      textAlign: TextAlign.left,
                                                      softWrap: true,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style:
                                                          GoogleFonts.openSans(
                                                              textStyle:
                                                                  TextStyle(
                                                        fontSize: 15 * ffem,
                                                        color: kPrimaryColor,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ))),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
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
                                                fontWeight: FontWeight.w600,
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
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Tình trạng:',
                                              style: GoogleFonts.openSans(
                                                  textStyle: TextStyle(
                                                fontSize: 15 * ffem,
                                                color: kLowTextColor,
                                                fontWeight: FontWeight.w600,
                                              ))),
                                          Text('${order.currentStateName}',
                                              style: GoogleFonts.openSans(
                                                  textStyle: TextStyle(
                                                fontSize: 15 * ffem,
                                                color: Colors.black,
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
                    child: Lottie.asset('assets/animations/loading-screen.json',
                        width: 50 * fem, height: 50 * hem));
              },
            ),
            SizedBox(
              height: 15 * hem,
            )
          ]),
        )
      ],
    );
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
