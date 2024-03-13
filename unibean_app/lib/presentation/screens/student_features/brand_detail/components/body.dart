import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../blocs/blocs.dart';
import '../../../../widgets/shimmer_widget.dart';
import 'brand_campaigns.dart';
import 'brand_detail_showdal.dart';
import 'brand_vouchers.dart';
import 'detail_shadow_bottom.dart';
import 'infor_card_brand_detail.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return BlocBuilder<BrandBloc, BrandState>(
      builder: (context, state) {
        if (state is BrandLoading) {
          return buildBrandDetailShimmer(fem, hem);
        } else if (state is BrandByIdLoaded) {
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    // color: Colors.black,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/background_splash.png'),
                            fit: BoxFit.cover)),
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 30 * hem,
                                // left: 10*fem,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 25 * fem),
                                    child: Icon(
                                      Icons.arrow_back_rounded,
                                      color: Colors.white,
                                      size: 35 * fem,
                                    ),
                                  ),
                                ),
                              ),
                              //background body
                              Positioned(
                                left: 0 * fem,
                                top: 120 * hem,
                                child: Align(
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      color: Color(0xfff8f6fb)),
                                ),
                              ),

                              //widget information of profile
                              InformationCardBrandDetail(
                                hem: hem,
                                fem: fem,
                                ffem: ffem,
                                brandModel: state.brand,
                              ),

                              Positioned(
                                left: 0 * fem,
                                top: 310 * hem,
                                child: Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BrandDetailShadow(
                                          fem: fem,
                                          hem: hem,
                                          ffem: ffem,
                                          onTap: () {
                                            _detailModelBottomSheet(
                                                context, state.brand);
                                          }),
                                      BrandVouchers(
                                        fem: fem,
                                        hem: hem,
                                        ffem: ffem,
                                        id: state.brand.id,
                                      ),
                                      BrandCampaigns(
                                          fem: fem,
                                          ffem: ffem,
                                          hem: hem,
                                          id: state.brand.id),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
              )
            ],
          );
        }
        return Container();
      },
    );
  }
}

Widget buildBrandDetailShimmer(double fem, double hem) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        height: 120 * fem,
      ),
      Container(
        margin: EdgeInsets.only(left: 15 * fem, right: 15 * fem),
        color: Colors.white,
        child: ShimmerWidget.rectangular(
          height: 150 * hem,
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 15 * fem, right: 15 * fem, top: 20 * hem),
        child: ShimmerWidget.rectangular(
          height: 100 * hem,
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 15 * fem, right: 15 * fem, top: 20 * hem),
        child: ShimmerWidget.rectangular(
          height: 20 * hem,
          width: 150 * fem,
        ),
      ),
      Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15 * fem, top: 20 * hem),
            child: ShimmerWidget.rectangular(
              height: 200 * hem,
              width: 170 * fem,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15 * fem, top: 20 * hem),
            child: ShimmerWidget.rectangular(
              height: 200 * hem,
              width: 170 * fem,
            ),
          ),
        ],
      )
    ],
  );
}

void _detailModelBottomSheet(context, brandModel) {
  double baseWidth = 375;
  double fem = MediaQuery.of(context).size.width / baseWidth;
  double ffem = fem * 0.97;
  double baseHeight = 812;
  double hem = MediaQuery.of(context).size.height / baseHeight;

  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: 500 * hem,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15 * fem), color: Colors.white),
        child: DetailShowdalBottom(
          hem: hem,
          fem: fem,
          ffem: ffem,
          brandModel: brandModel,
        ),
      );
    },
    isScrollControlled: true,
  );
}
