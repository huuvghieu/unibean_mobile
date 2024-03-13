import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/student_features/campaign/components/campaign_carousel.dart';
import 'package:unibean_app/presentation/widgets/brand_card.dart';
import 'package:unibean_app/presentation/screens/student_features/campaign/components/campaign_card.dart';
import 'package:unibean_app/presentation/screens/student_features/campaign/components/campaign_list_card.dart';
import 'package:unibean_app/presentation/screens/student_features/campaign/components/membership_card.dart';
import 'package:unibean_app/presentation/widgets/card_for_unknow.dart';
import 'package:unibean_app/presentation/widgets/card_for_unverified.dart';

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
    double heightText = 1.3625 * ffem / fem;

    final roleState = context.read<RoleAppBloc>().state;

    var roleWidget = (switch (roleState) {
      RoleAppUnknown() => CardForUnknow(fem: fem, hem: hem, ffem: ffem),
      RoleAppStudentUnverified() =>
        CardForUnVerified(fem: fem, hem: hem, ffem: ffem),
      RoleAppStudentVerified(
        // ignore: unused_local_variable
        authenModel: final authenModel,
        studentModel: final studentModel
      ) =>
        MemberShipCard(
            fem: fem,
            hem: hem,
            ffem: ffem,
            heightText: heightText,
            studentModel: studentModel),
      RoleAppStore() => Container(),
      RoleAppLoading() => Container(
          child: Center(
              child: Lottie.asset('assets/animations/loading-screen.json',
                  width: 50 * fem, height: 50 * hem)),
        )
    });

    return RefreshIndicator(
      onRefresh: () async {
        context.read<CampaignBloc>().add(LoadCampaigns());
        context.read<BrandBloc>().add(LoadBrands());
      },
      child: CustomScrollView(
        controller: context.read<CampaignBloc>().scrollController,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //RoleWidget
                  Container(
                      padding: EdgeInsets.only(top: 15 * fem, bottom: 15 * fem),
                      color: kbgWhiteColor,
                      child: roleWidget),
                  SizedBox(
                    height: 5 * hem,
                  ),

                  //Hôm nay có gì
                  Container(
                    padding: EdgeInsets.only(top: 15 * fem, bottom: 15 * fem),
                    color: kbgWhiteColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10 * fem),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 0 * hem),
                            child: Text(
                              'HÔM NAY CÓ GÌ',
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                fontSize: 15 * ffem,
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10 * hem,
                        ),
                        BlocBuilder<CampaignBloc, CampaignState>(
                          builder: (context, state) {
                            if (state is CampaignsLoaded) {
                              return CampaignCarousel(
                                campaigns: state.campaigns,
                                roleState: roleState,
                              );
                            }
                            return Container(
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: kPrimaryColor,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5 * hem,
                  ),

                  //Đề xuất cho bạn
                  Container(
                    color: kbgWhiteColor,
                    padding: EdgeInsets.only(top: 15 * fem, bottom: 15 * fem),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10 * fem),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'ĐỀ XUẤT CHO BẠN',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                  fontSize: 15 * ffem,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                )),
                              ),
                              InkWell(
                                onTap: () {
                                  if (roleState is RoleAppUnknown) {
                                    Navigator.pushNamed(
                                        context, LoginScreen.routeName);
                                  } else {
                                    Navigator.pushNamed(
                                        context, CampaignListScreen.routeName);
                                  }
                                },
                                child: Container(
                                  height: 22 * hem,
                                  width: 22 * fem,
                                  margin: EdgeInsets.only(left: 8 * fem),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(80)),
                                  child: Icon(
                                    Icons.arrow_forward_rounded,
                                    size: 18 * fem,
                                    color: kDarkPrimaryColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10 * hem,
                        ),
                        BlocBuilder<CampaignBloc, CampaignState>(
                          builder: (context, state) {
                            if (state is CampaignsLoaded) {
                              return SizedBox(
                                  height: 250 * hem,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 3,
                                    itemBuilder: (context, index) {
                                      return CampaignCard(
                                        fem: fem,
                                        hem: hem,
                                        ffem: ffem,
                                        campaignModel: state.campaigns[index],
                                        onTap: () {
                                          if (roleState is RoleAppUnknown) {
                                            Navigator.pushNamed(
                                                context, LoginScreen.routeName);
                                          } else {
                                            Navigator.pushNamed(context,
                                                CampaignDetailScreen.routeName,
                                                arguments:
                                                    state.campaigns[index].id);
                                          }
                                        },
                                      );
                                    },
                                  ));
                            }
                            return Container(
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: kPrimaryColor,
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 10 * hem,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 5 * hem,
                  ),

                  //Các thwung hiệu
                  Container(
                    color: kbgWhiteColor,
                    padding: EdgeInsets.only(top: 15 * fem, bottom: 15 * fem),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10 * fem),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'THƯƠNG HIỆU',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                  fontSize: 15 * ffem,
                                  height: heightText,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                )),
                              ),
                              InkWell(
                                onTap: () {
                                  if (roleState is RoleAppUnknown) {
                                    Navigator.pushNamed(
                                        context, LoginScreen.routeName);
                                  } else {
                                    Navigator.pushNamed(
                                        context, BrandListScreen.routeName);
                                  }
                                },
                                child: Container(
                                  height: 22 * hem,
                                  width: 22 * fem,
                                  margin: EdgeInsets.only(left: 8 * fem),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(80)),
                                  child: Icon(
                                    Icons.arrow_forward_rounded,
                                    size: 18 * fem,
                                    color: kDarkPrimaryColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12 * hem,
                        ),
                        BlocBuilder<BrandBloc, BrandState>(
                            builder: (context, state) {
                          if (state is BrandsLoaded) {
                            return SizedBox(
                                height: 120 * hem,
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return BrandCard(
                                        fem: fem,
                                        hem: hem,
                                        ffem: ffem,
                                        brandModel: state.brands[index]);
                                  },
                                ));
                          }
                          return Container(
                              child: Center(
                                  child: Lottie.asset(
                                      'assets/animations/loading-screen.json',
                                      width: 50 * fem,
                                      height: 50 * hem)));
                        }),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5 * hem,
                  ),

                  //Chiến dịch ưu đãi
                  Container(
                    color: kbgWhiteColor,
                    padding: EdgeInsets.only(top: 15 * fem, bottom: 15 * fem),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10 * fem),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'CHIẾN DỊCH ƯU ĐÃI',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                  fontSize: 15 * ffem,
                                  height: heightText,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12 * hem,
                        ),
                        // CampaignPaged()
                        BlocBuilder<CampaignBloc, CampaignState>(
                          builder: (context, state) {
                            if (state is CampaignLoading) {
                              return shimmerLoading(1);
                            } else if (state is CampaignsLoaded) {
                              return ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: state.hasReachMax
                                    ? state.campaigns.length 
                                    : state.campaigns.length + 1,
                                itemBuilder: (context, index) {
                                  if (index >= state.campaigns.length) {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: kPrimaryColor,
                                      ),
                                    );
                                  } else {
                                    return CampaignListCard(
                                      fem: fem,
                                      hem: hem,
                                      ffem: ffem,
                                      campaignModel: state.campaigns[index],
                                      onTap: () {
                                        if (roleState is RoleAppUnknown) {
                                          Navigator.pushNamed(
                                              context, LoginScreen.routeName);
                                        } else {
                                          Navigator.pushNamed(context,
                                              CampaignDetailScreen.routeName,
                                              arguments:
                                                  state.campaigns[index].id);
                                        }
                                      },
                                    );
                                  }
                                },
                              );
                            }
                            return Container(
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: kPrimaryColor,
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 10 * hem,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}

Widget shimmerLoading(pageSize) {
  return ListView.builder(
    itemCount: pageSize,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          height: 160,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      );
    },
  );
}
