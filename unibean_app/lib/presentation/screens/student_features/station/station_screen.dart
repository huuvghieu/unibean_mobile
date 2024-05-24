import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/domain/repositories.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/screens.dart';
import 'package:unibean_app/presentation/widgets/shimmer_widget.dart';
import '../../../blocs/blocs.dart';

class StationScreen extends StatelessWidget {
  static const String routeName = '/station-student';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => StationScreen(),
        settings: const RouteSettings(arguments: routeName));
  }

  const StationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double baseHeight = 812;
    double ffem = fem * 0.97;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return BlocProvider(
      create: (context) =>
          StationBloc(stationRepository: context.read<StationRepository>())
            ..add(LoadStations()),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: klighGreyColor,
          appBar: AppBar(
            elevation: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background_splash.png'),
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
              'Xác nhận thông tin',
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      fontSize: 18 * ffem,
                      fontWeight: FontWeight.w900,
                      height: 1.3625 * ffem / fem,
                      color: Colors.white)),
            ),
          ),
          body: BlocListener<InternetBloc, InternetState>(
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
            child: CustomScrollView(
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate([
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20 * hem,
                      ),
                      Text(
                        'CHỌN TRẠM ĐỂ NHẬN HÀNG',
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                      ),
                      SizedBox(
                        height: 20 * hem,
                      ),
                      BlocBuilder<StationBloc, StationState>(
                          builder: (context, state) {
                        if (state is StationLoading) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(
                                    bottom: 10, left: 15, right: 15),
                                child: ShimmerWidget.rectangular(
                                  height: 120,
                                ),
                              );
                            },
                          );
                        } else if (state is StationsLoaded) {
                          if (state.stations.isEmpty) {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                            'Không có trạm để đổi quà',
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
                                    ],
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: state.stations.length,
                              itemBuilder: (context, index) {
                                var station = state.stations[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, ProductConfirmScreen.routeName,
                                        arguments: station);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 15 * fem,
                                        right: 15 * fem,
                                        bottom: 15 * hem),
                                    width: double.infinity,
                                    height: 120 * hem,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(15 * fem),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 5 * hem,
                                              left: 5 * fem,
                                              bottom: 5 * hem),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10 * fem),
                                            child: Container(
                                              width: 110 * fem,
                                              height: 120 * hem,
                                              child: Image.network(
                                                station.image,
                                                fit: BoxFit.fill,
                                                loadingBuilder: (context, child,
                                                    loadingProgress) {
                                                  if (loadingProgress == null) {
                                                    return child;
                                                  }
                                                  return ShimmerWidget
                                                      .rectangular(
                                                          height: 160 * hem);
                                                },
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return Image.asset(
                                                    'assets/images/image-404.jpg',
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10 * fem,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: 200 * fem,
                                              // height: 45*hem,
                                              child: Text(
                                                  'Trạm: ${station.stationName}',
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
                                              height: 2 * hem,
                                            ),
                                            Container(
                                              width: 200 * fem,
                                              child: Text(
                                                  'Địa chỉ: ${station.address}',
                                                  softWrap: true,
                                                  style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                    fontSize: 13 * ffem,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ))),
                                            ),
                                            SizedBox(
                                              height: 2 * hem,
                                            ),
                                            Container(
                                              width: 200 * fem,
                                              child: Text(
                                                  'Số điện thoại: ${station.phone}',
                                                  softWrap: true,
                                                  style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                    fontSize: 13 * ffem,
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
                                );
                              },
                            );
                          }
                        }
                        return Container(
                            child: Text('Lỗi xử lí, vui lòng thử lại!',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        fontSize: 16 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.3625 * ffem / fem,
                                        color: Colors.black))));
                      })
                    ],
                  ),
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
