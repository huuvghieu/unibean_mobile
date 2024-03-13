import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../../../domain/repositories.dart';
import '../../../../blocs/blocs.dart';
import '../../../../config/constants.dart';
import '../../../../widgets/shimmer_widget.dart';
import '../../../screens.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    // double heightText = 1.3625 * ffem / fem;

    return BlocProvider(
      create: (context) =>
          CampaignBloc(campaignRepository: context.read<CampaignRepository>())
            ..add(LoadCampaigns(limit: 10)),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 20 * fem,
              ),
              BlocBuilder<CampaignBloc, CampaignState>(
                builder: (context, state) {
                  if (state is CampaignsLoaded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.campaigns.length,
                          itemBuilder: (context, index) {
                            var campaignModel = state.campaigns[index];
                            return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, CampaignDetailScreen.routeName, arguments: campaignModel.id);
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 10 * fem,
                                          right: 10 * fem,
                                          bottom: 15 * hem),
                                      width: 350 * fem,
                                      height: 150 * hem,
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
                                                  BorderRadius.circular(
                                                      10 * fem),
                                              child: Container(
                                                width: 130 * fem,
                                                height: 160 * hem,
                                                child: Image.network(
                                                  campaignModel.image,
                                                  fit: BoxFit.fill,
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
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5 * hem,
                                                    bottom: 5 * hem),
                                                child: Text(
                                                    campaignModel.brandName,
                                                    softWrap: true,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.openSans(
                                                        textStyle: TextStyle(
                                                      fontSize: 13 * ffem,
                                                      color: kLowTextColor,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ))),
                                              ),
                                              Container(
                                                width: 200 * fem,
                                                // height: 45*hem,
                                                child: Text(
                                                    campaignModel.campaignName,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.openSans(
                                                        textStyle: TextStyle(
                                                      fontSize: 14 * ffem,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ))),
                                              ),
                                              SizedBox(
                                                height: 2 * hem,
                                              ),
                                              Container(
                                                width: 200 * fem,
                                                child: Text(
                                                    'Thời gian tham gia chiến dịch:',
                                                    softWrap: true,
                                                    style: GoogleFonts.openSans(
                                                        textStyle: TextStyle(
                                                      fontSize: 13 * ffem,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ))),
                                              ),
                                              Container(
                                                width: 200 * fem,
                                                child: Text(
                                                    '${changeFormateDate(campaignModel.startOn)} - ${changeFormateDate(campaignModel.endOn)}',
                                                    softWrap: true,
                                                    style: GoogleFonts.openSans(
                                                        textStyle: TextStyle(
                                                      fontSize: 12 * ffem,
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
                                    // Positioned(
                                    //   bottom: 25 * hem,
                                    //   right: 22 * fem,
                                    //   child: Container(
                                    //     width: 80 * fem,
                                    //     height: 32 * hem,
                                    //     decoration: BoxDecoration(
                                    //         color: kPrimaryColor,
                                    //         border: Border.all(
                                    //             color: kPrimaryColor),
                                    //         borderRadius:
                                    //             BorderRadius.circular(5)),
                                    //     child: TextButton(
                                    //       onPressed: onTap,
                                    //       child: Text(
                                    //         'Xem ngay',
                                    //         style: GoogleFonts.openSans(
                                    //             textStyle: TextStyle(
                                    //                 fontSize: 11 * ffem,
                                    //                 fontWeight: FontWeight.w600,
                                    //                 color: Colors.white)),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ));
                          },
                        ),
                      ],
                    );
                  } else if (state is CampaignLoading) {
                    return buildCampaignShimmer(10, fem, hem);
                  }
                  return Center(
                      child: Lottie.asset(
                          'assets/animations/loading-screen.json',
                          width: 50 * fem,
                          height: 50 * hem));
                },
              )
            ]),
          )
        ],
      ),
    );
  }
}

Widget buildCampaignShimmer(count, double fem, double hem) {
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
