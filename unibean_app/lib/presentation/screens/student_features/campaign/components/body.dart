import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/data/models.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/student_features/campaign/components/brand_banner_item.dart';
import 'package:unibean_app/presentation/screens/student_features/campaign/components/campaign_carousel.dart';
import 'package:unibean_app/presentation/screens/student_features/campaign/components/membership_card.dart';
import 'package:unibean_app/presentation/screens/student_features/campaign_list/campaign_list_screen.dart';
import 'package:unibean_app/presentation/widgets/card_for_unknow.dart';
import 'package:unibean_app/presentation/widgets/card_for_unverified.dart';

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

    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20 * hem,
                ),
                BlocBuilder<RoleAppBloc, RoleAppState>(
                  builder: (context, state) {
                    if (state is RoleAppLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: kPrimaryColor,
                        ),
                      );
                    } else if (state is RoleAppStudentVerified) {
                      return MemberShipCard(
                          fem: fem,
                          hem: hem,
                          ffem: ffem,
                          heightText: heightText);
                    } else if (state is RoleAppStudentUnverified) {
                      return CardForUnVerified(fem: fem, hem: hem, ffem: ffem);
                    } else if (state is RoleAppUnknown) {
                      return CardForUnknow(fem: fem, hem: hem, ffem: ffem);
                    }
                    return CardForUnknow(fem: fem, hem: hem, ffem: ffem);
                  },
                ),
                SizedBox(
                  height: 20 * hem,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10 * fem),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hôm nay có gì?',
                        style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                          fontSize: 18 * ffem,
                          height: heightText,
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                        )),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, CampaignListScreen.routeName);
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 5 * hem, right: 10 * fem),
                          child: Text(
                            'Xem thêm',
                            style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                              fontSize: 12 * ffem,
                              height: heightText,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25 * hem,
                ),
                CampaignCarousel(),
                SizedBox(
                  height: 25 * hem,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10 * fem),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Thương hiệu',
                        style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                          fontSize: 18 * ffem,
                          height: heightText,
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                        )),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 5 * hem, right: 10 * fem),
                          child: Text(
                            'Xem thêm',
                            style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                              fontSize: 12 * ffem,
                              height: heightText,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20 * hem,
                ),
                SizedBox(
                    height: 120 * hem,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Brand.listBrand.length,
                      itemBuilder: (context, index) {
                        return BrandBannerItem(
                            fem: fem,
                            hem: hem,
                            ffem: ffem,
                            heightText: heightText,
                            index: index);
                      },
                    )),
                SizedBox(
                  height: 15 * hem,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10 * fem),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Chiến dịch mới',
                        style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                          fontSize: 18 * ffem,
                          height: heightText,
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                        )),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 5 * hem, right: 10 * fem),
                          child: Text(
                            'Xem tất cả',
                            style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                              fontSize: 12 * ffem,
                              height: heightText,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10 * hem,
                ),
                // CampaignPaged()
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 180 * fem,
                      height: 240 * hem,
                      margin: EdgeInsets.only(left: 5 * fem),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15 * fem),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x0c000000),
                                offset: Offset(0 * fem, 10 * fem),
                                blurRadius: 5 * fem)
                          ]),
                      child: Column(
                        children: [
                          Container(
                            width: 165 * fem,
                            height: 170 * hem,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15 * fem),
                                image: DecorationImage(
                                    image: AssetImage(CampaignModel
                                        .listCampaign[0].assetImage),
                                    fit: BoxFit.fill)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 12 * fem, right: 12 * fem, top: 10 * hem),
                            child: Text(
                              CampaignModel.listCampaign[0].name,
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                fontSize: 12 * ffem,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 180 * fem,
                      height: 240 * hem,
                      margin: EdgeInsets.only(left: 5 * fem),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15 * fem),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x0c000000),
                                offset: Offset(0 * fem, 10 * fem),
                                blurRadius: 5 * fem)
                          ]),
                      child: Column(
                        children: [
                          Container(
                            width: 165 * fem,
                            height: 170 * hem,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15 * fem),
                                image: DecorationImage(
                                    image: AssetImage(CampaignModel
                                        .listCampaign[1].assetImage),
                                    fit: BoxFit.fill)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 12 * fem, right: 12 * fem, top: 10 * hem),
                            child: Text(
                              CampaignModel.listCampaign[1].name,
                              style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                fontSize: 12 * ffem,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20 * hem,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 180 * fem,
                      height: 233 * hem,
                      margin: EdgeInsets.only(left: 5 * fem),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15 * fem),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x0c000000),
                                offset: Offset(0 * fem, 10 * fem),
                                blurRadius: 5 * fem)
                          ]),
                    ),
                    Container(
                      width: 180 * fem,
                      height: 233 * hem,
                      margin: EdgeInsets.only(left: 5 * fem),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15 * fem),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x0c000000),
                                offset: Offset(0 * fem, 10 * fem),
                                blurRadius: 5 * fem)
                          ]),
                    ),
                  ],
                ),
              ],
            )
          ]),
        )
      ],
    );
  }
}
