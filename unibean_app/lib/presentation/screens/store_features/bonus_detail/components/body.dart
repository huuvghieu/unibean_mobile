import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/presentation/config/constants.dart';

import '../../../../blocs/blocs.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return BlocBuilder<BonusBloc, BonusState>(
      builder: (context, state) {
        if (state is BonusByIdLoaded) {
          var bonusDetail = state.bonusDetailModel;
          return CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(
                          top: 15 * hem,
                          bottom: 15 * hem,
                          right: 10 * fem,
                          left: 10 * fem),
                      margin: EdgeInsets.only(
                        right: 30 * hem,
                        left: 30 * hem,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15 * fem),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Chi tiết',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    fontSize: 15 * ffem,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Nội dung:',
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
                                  '${bonusDetail.description}',
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
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Số lượng:',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                  fontSize: 15 * ffem,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                )),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${formatter.format(bonusDetail.amount)}',
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                      fontSize: 20 * ffem,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    )),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 2 * fem,
                                        top: 4 * hem,
                                        bottom: 2 * hem),
                                    child: SvgPicture.asset(
                                      'assets/icons/green-bean-icon.svg',
                                      width: 26 * fem,
                                      height: 26 * fem,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20 * hem,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(
                        top: 15 * hem,
                        bottom: 15 * hem,
                      ),
                      margin: EdgeInsets.only(
                        right: 30 * hem,
                        left: 30 * hem,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15 * fem),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Người nhận',
                              // softWrap: true,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      fontSize: 15 * ffem,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 25 * fem,
                              ),

                              //avatar
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  '${bonusDetail.studentAvatar}',
                                  // 'assets/images/ava_signup.png',
                                  width: 80 * fem,
                                  height: 80 * hem,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      'assets/images/ava_signup.png',
                                      width: 80 * fem,
                                      height: 80 * hem,
                                    );
                                  },
                                ),
                              ),

                              SizedBox(
                                width: 20 * fem,
                              ),

                              SizedBox(
                                // color: Colors.red,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //Name
                                    Container(
                                      width: 190 * fem,
                                      child: Row(
                                        children: [
                                          Flexible(
                                            child: Text(
                                              bonusDetail.studentName,
                                              // softWrap: true,
                                              maxLines: 2,
                                              textAlign: TextAlign.start,
                                              style: GoogleFonts.openSans(
                                                  textStyle: TextStyle(
                                                      fontSize: 15 * ffem,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15 * fem,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Bên gửi',
                              // softWrap: true,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      fontSize: 15 * ffem,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 25 * fem,
                              ),

                              //avatar
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  '${bonusDetail.storeImage}',
                                  // 'assets/images/ava_signup.png',
                                  width: 80 * fem,
                                  height: 80 * hem,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      'assets/images/ava_signup.png',
                                      width: 80 * fem,
                                      height: 80 * hem,
                                    );
                                  },
                                ),
                              ),

                              SizedBox(
                                width: 20 * fem,
                              ),

                              SizedBox(
                                // color: Colors.red,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //Name
                                    Container(
                                      width: 190 * fem,
                                      child: Row(
                                        children: [
                                          Flexible(
                                            child: Text(
                                              bonusDetail.storeName,
                                              // softWrap: true,
                                              maxLines: 2,
                                              textAlign: TextAlign.start,
                                              style: GoogleFonts.openSans(
                                                  textStyle: TextStyle(
                                                      fontSize: 15 * ffem,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ]))
            ],
          );
        }
        return Container(
          child: Center(
            child: Lottie.asset('assets/animations/loading-screen.json'),
          ),
        );
      },
    );
  }
}
