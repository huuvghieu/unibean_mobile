import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/screens/screens.dart';
import 'package:unibean_app/presentation/widgets/empty_widget.dart';

import '../../../../blocs/blocs.dart';
import '../../../../config/constants.dart';
import '../../../../widgets/shimmer_widget.dart';
import 'brand_infor_card.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return BlocBuilder<VoucherBloc, VoucherState>(
      builder: (context, state) {
        if (state is VoucherByIdLoading) {
          return buildVoucherDetailShimmer(fem, hem);
        } else if (state is VoucherByIdLoaded) {
          var voucherDetail = state.voucherDetailModel;
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 220 * hem,
                        child: Image.network(
                          voucherDetail.image,
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/image-404.jpg',
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5 * hem,
                      ),
                      Container(
                        color: Colors.white,
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            left: 15 * fem,
                            top: 15 * hem,
                            bottom: 15 * hem,
                            right: 15 * fem),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'THÔNG TIN CHI TIẾT',
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                fontSize: 15 * ffem,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2 * hem),
                              child: Text(
                                'Ưu đãi: ${voucherDetail.voucherName}',
                                textAlign: TextAlign.justify,
                                softWrap: true,
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                    fontSize: 14 * ffem,
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15 * hem,
                            ),
                            Text(
                              'THỂ LỆ',
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                fontSize: 15 * ffem,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2 * hem),
                              child: Text(
                                voucherDetail.condition,
                                softWrap: true,
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                    fontSize: 13 * ffem,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15 * hem,
                            ),
                            Text(
                              'MÔ TẢ',
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                fontSize: 15 * ffem,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5 * hem),
                              child: Text(
                                voucherDetail.description,
                                textAlign: TextAlign.justify,
                                softWrap: true,
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                    fontSize: 13 * ffem,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5 * hem,
                      ),
                      BrandInformationCard(
                          hem: hem,
                          fem: fem,
                          ffem: ffem,
                          voucherDetail: voucherDetail),
                      SizedBox(
                        height: 5 * hem,
                      ),
                      Container(
                        color: Colors.white,
                        width: double.infinity,
                        padding:
                            EdgeInsets.only(top: 15 * hem, bottom: 15 * hem),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15 * fem),
                              child: Text(
                                'TRONG CHIẾN DỊCH',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                  fontSize: 15 * ffem,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )),
                              ),
                            ),
                            SizedBox(
                              height: 5*hem,
                            ),
                            voucherDetail.campaigns.length == 0 
                            ? Center(child: EmptyWidget(text: 'Không có sẵn'),)
                            :
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: voucherDetail.campaigns.length,
                              itemBuilder: (context, index) {
                                var campaignModel =
                                    voucherDetail.campaigns[index];
                                return Stack(
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
                                          border:
                                              Border.all(color: kPrimaryColor)),
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
                                    Positioned(
                                      bottom: 25 * hem,
                                      right: 22 * fem,
                                      child: Container(
                                        width: 80 * fem,
                                        height: 32 * hem,
                                        decoration: BoxDecoration(
                                            color: kPrimaryColor,
                                            border: Border.all(
                                                color: kPrimaryColor),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(context,
                                                CampaignDetailScreen.routeName,
                                                arguments: voucherDetail
                                                    .campaigns[index].id);
                                          },
                                          child: Text(
                                            'Xem ngay',
                                            style: GoogleFonts.openSans(
                                                textStyle: TextStyle(
                                                    fontSize: 11 * ffem,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    ],
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

Widget buildVoucherDetailShimmer(double fem, double hem) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          color: Colors.white,
          child: ShimmerWidget.rectangular(
            height: 250 * hem,
          ),
        ),
        Container(
          color: Colors.white,
          margin:
              EdgeInsets.only(top: 20 * fem, left: 15 * fem, right: 15 * fem),
          child: ShimmerWidget.rectangular(
            height: 150 * hem,
          ),
        ),
        Container(
          margin:
              EdgeInsets.only(left: 15 * fem, right: 15 * fem, top: 20 * hem),
          child: ShimmerWidget.rectangular(
            height: 20 * hem,
            width: 170 * fem,
          ),
        ),
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: 15 * fem, top: 20 * hem, right: 15 * fem),
              child: ShimmerWidget.rectangular(
                height: 150 * hem,
                width: double.infinity,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
