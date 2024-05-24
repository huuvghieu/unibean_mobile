import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../blocs/blocs.dart';
import '../../../../config/constants.dart';
import '../../../../widgets/shimmer_widget.dart';
import 'bonus_card.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return RefreshIndicator(
      onRefresh: () async {
        context.read<BonusBloc>().add(LoadBonus());
      },
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: context.read<BonusBloc>().scrollController,
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(
              height: 15 * fem,
            ),
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
                            colorFilter: ColorFilter.mode(
                                kLowTextColor, BlendMode.srcIn),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'Không có danh sách tặng đậu!',
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
                    itemCount: state.hasReachedMax
                        ? bonuses.length
                        : bonuses.length + 1,
                    itemBuilder: (context, index) {
                      if (index >= state.bonuses.length) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: kPrimaryColor,
                          ),
                        );
                      } else {
                        var bonus = bonuses[index];

                        return BonusCard(
                            hem: hem, fem: fem, bonus: bonus, ffem: ffem);
                      }
                    },
                  );
                }
                return Container();
              },
            ),
          ]))
        ],
      ),
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
                      width: 200 * fem,
                    ),
                    ShimmerWidget.rectangular(
                      height: 15 * hem,
                      width: 100 * fem,
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
