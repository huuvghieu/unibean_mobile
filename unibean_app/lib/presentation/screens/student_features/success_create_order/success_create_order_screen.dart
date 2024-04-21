import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';
import 'package:unibean_app/presentation/screens/screens.dart';

import '../../../../data/models.dart';
import '../../../config/constants.dart';
// import 'components/body.dart';

class SuccessCreateOrderScreen extends StatelessWidget {
  static const String routeName = '/success-create-order';

  static Route route({required OrderModel orderModel}) {
    return PageRouteBuilder(
        pageBuilder: (_, __, ___) => SuccessCreateOrderScreen(
              orderModel: orderModel,
            ),
        transitionDuration: Duration(milliseconds: 400),
        transitionsBuilder: (_, animation, __, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          var tween = Tween(begin: begin, end: end);
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
        settings: const RouteSettings(name: routeName));
  }

  const SuccessCreateOrderScreen({super.key, required this.orderModel});

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double baseHeight = 812;
    double ffem = fem * 0.97;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background_splash.png'),
                      fit: BoxFit.cover)),
            ),
            toolbarHeight: 50 * hem,
            centerTitle: true,
            title: Text(
              'Kết quả đặt hàng',
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      fontSize: 20 * ffem,
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
                    size: 30 * fem,
                  ),
                  onPressed: () {
                    context.read<CampaignBloc>().add(LoadCampaigns());
                    Navigator.pushNamedAndRemoveUntil(context,
                        '/landing-screen', (Route<dynamic> route) => false);
                  },
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
              color: klighGreyColor,
              height: 80 * hem,
              elevation: 5,
              child: GestureDetector(
                  onTap: () async {
                    final studentId =
                        await AuthenLocalDataSource.getStudentId();
                    context.read<CampaignBloc>().add(LoadCampaigns());
                    Navigator.pushNamed(context, OrderDetailScreen.routeName,
                        arguments: <dynamic>[orderModel.id, studentId]);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Container(
                          width: 165 * fem,
                          height: 45 * hem,
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(10 * fem)),
                          child: Center(
                            child: Text(
                              'Chi tiết đơn hàng',
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      fontSize: 15 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.3625 * ffem / fem,
                                      color: Colors.white)),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 165 * fem,
                          height: 45 * hem,
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(10 * fem)),
                          child: Center(
                            child: Text(
                              'Trang chủ',
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      fontSize: 15 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.3625 * ffem / fem,
                                      color: Colors.white)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))),
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        color: klighGreyColor,
                        height: 150 * hem,
                        // width: ,
                        child: Lottie.asset(
                            'assets/animations/success-animation.json',
                            repeat: false),
                      ),
                      Container(
                        child: Text(
                          'Đặt hàng thành công',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  fontSize: 18 * ffem,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25 * hem,
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 15 * fem, right: 15 * fem),
                    padding: EdgeInsets.only(
                        left: 15 * fem,
                        right: 15 * fem,
                        top: 5 * hem,
                        bottom: 5 * hem),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kPrimaryColor)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50 * hem,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Thời gian đặt hàng',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        fontSize: 15 * ffem,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey)),
                              ),
                              Text(
                                '${_formatDateTime(DateTime.now())}',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        fontSize: 16 * ffem,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 50 * hem,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Trạm',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        fontSize: 15 * ffem,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey)),
                              ),
                              Container(
                                width: 120 * fem,
                                child: Text(
                                  '${orderModel.stationName}',
                                  maxLines: 2,
                                  softWrap: true,
                                  textAlign: TextAlign.end,
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          fontSize: 16 * ffem,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 50 * hem,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tổng đậu đỏ',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        fontSize: 15 * ffem,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey)),
                              ),
                              Text(
                                '${formatter.format(orderModel.amount)}',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        fontSize: 22 * ffem,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

String _formatDateTime(DateTime datetime) {
  String formattedDatetime = DateFormat("HH:mm - dd/MM/yyyy").format(datetime);
  return formattedDatetime;
}
