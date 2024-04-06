import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../blocs/blocs.dart';
import '../../../../config/constants.dart';
import '../../../../widgets/shimmer_widget.dart';

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
          BlocBuilder<BonusBloc, BonusState>(
            builder: (context, state) {
              if (state is BonusLoading) {
                return buildBonusShimmer(5, fem, hem);
              } else if (state is BonusesLoaded) {
                var bonuses = state.bonuses;

                if (bonuses.isEmpty) {
                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 15 * fem, right: 15 * fem),
                    height: 220 * hem,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/bonus-bean-icon.svg',
                          width: 60 * fem,
                          colorFilter:
                              ColorFilter.mode(kLowTextColor, BlendMode.srcIn),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              'Không có tặng đậu',
                              textAlign: TextAlign.center,
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
                  );
                }
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: bonuses.length,
                  itemBuilder: (context, index) {
                    var bonus = bonuses[index];
                    // if (index >= state.transactions!.length) {
                    //   return Center(
                    //     child: CircularProgressIndicator(
                    //       color: kPrimaryColor,
                    //     ),
                    //   );
                    // } else {
                    //   return TransactionCard(
                    //     fem:  fem,
                    //     hem:  hem,
                    //     ffem:  ffem,
                    //     transaction: state.transactions![index],
                    //   );
                    // }
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(bottom: 15 * hem),
                        height: 90 * hem,
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 90 * hem,
                              margin: EdgeInsets.only(
                                  right: 15 * fem, left: 15 * fem),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10 * fem),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0x0c000000),
                                        offset: Offset(0 * fem, 10 * fem),
                                        blurRadius: 5 * fem)
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10 * fem),
                                    child: Container(
                                      width: 200 * fem,
                                      child: Text(
                                          'Bên gửi: ${bonus.storeName}',
                                          style: GoogleFonts.openSans(
                                              fontSize: 14 * ffem,
                                              fontWeight: FontWeight.w500,
                                              height: 1.3625 * ffem / fem,
                                              color: Colors.black)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10 * fem),
                                    child: Container(
                                      width: 200 * fem,
                                      child: Text(
                                          'Sinh viên nhận: ${bonus.studentName}',
                                          style: GoogleFonts.openSans(
                                              fontSize: 14 * ffem,
                                              fontWeight: FontWeight.w500,
                                              height: 1.3625 * ffem / fem,
                                              color: Colors.black)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Positioned(
                            //     right: 20 * fem,
                            //     top: 10 * hem,
                            //     child:
                            //         _buildAmount(fem, hem, ffem, transaction))
                          ],
                        ));
                  },
                );
              }
              return Container();
            },
          ),
        ]))
      ],
    );
  }
}

Widget buildBonusShimmer(count, double fem, double hem) {
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
            padding: EdgeInsets.only(left: 10 * fem),
            constraints:
                BoxConstraints(maxHeight: 100 * hem, minWidth: 340 * fem),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ShimmerWidget.rectangular(
                      height: 15 * hem,
                      width: 300 * fem,
                    ),
                    ShimmerWidget.rectangular(
                      height: 15 * hem,
                      width: 300 * fem,
                    ),
                    ShimmerWidget.rectangular(
                      height: 15 * hem,
                      width: 300 * fem,
                    ),
                  ],
                ),
                SizedBox(
                  width: 10 * fem,
                ),
              ],
            ),
          );
        },
      ),
    ],
  );
}
