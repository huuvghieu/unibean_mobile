import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:unibean_app/domain/repositories.dart';

import '../../../../../data/models.dart';
import '../../../../blocs/blocs.dart';
import '../../../../config/constants.dart';
import '../../../../widgets/shimmer_widget.dart';
import 'campaign_formation_card.dart';
import 'campaign_voucher_list.dart';

class Body extends StatelessWidget {
  const Body(
      {super.key,
      required this.campaignVoucherModel,
      required this.campaignDetil});

  final CampaignVoucherModel campaignVoucherModel;
  final CampaignDetailModel campaignDetil;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return BlocProvider(
      create: (context) => CampaignVoucherBloc(
          campaignRepository: context.read<CampaignRepository>())
        ..add(LoadCampaignVoucherById(
            campaignId: campaignVoucherModel.campaignId,
            campaignVoucherId: campaignVoucherModel.id)),
      child: BlocBuilder<CampaignVoucherBloc, CampaignVoucherState>(
        builder: (context, state) {
          if (state is CampaignVoucherLoading) {
            return buildCampaignVoucherShimmer(fem, hem);
          } else if (state is CampaignVoucherByIdLoaded) {
            var campaignVoucherDetail = state.campaignVoucherDetail;
            var duration = getDuration(campaignDetil.endOn);
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
                            campaignVoucherDetail.voucherImage,
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/images/background_splash.png',
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                        Container(
                            height: 50 * hem,
                            width: double.infinity,
                            color: kbgWhiteColor,
                            padding: EdgeInsets.only(left: 15 * fem),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    'Kết thúc sau:',
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                      fontSize: 13 * ffem,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  width: 5 * fem,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      right: 10 * fem, left: 10 * fem),
                                  height: 30 * hem,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: klightPrimaryColor),
                                  child: TimerCountdown(
                                    spacerWidth: 5,
                                    colonsTextStyle: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                      fontSize: 13 * ffem,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                    )),
                                    timeTextStyle: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                      fontSize: 15 * ffem,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                    )),
                                    format: CountDownTimerFormat
                                        .daysHoursMinutesSeconds,
                                    enableDescriptions: false,
                                    endTime: DateTime.now().add(duration),
                                    onEnd: () {
                                      print("Timer finished");
                                    },
                                  ),
                                ),
                              ],
                            )),
                        Container(
                          color: Colors.white,
                          width: double.infinity,
                          padding: EdgeInsets.only(
                              left: 15 * fem,
                              top: 10 * hem,
                              bottom: 15 * hem,
                              right: 15 * fem),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${campaignDetil.brandName}',
                                textAlign: TextAlign.justify,
                                softWrap: true,
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                    fontSize: 15 * ffem,
                                    color: klowTextGrey,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2 * hem, bottom: 5*hem),
                                child: Text(
                                  '${campaignVoucherDetail.voucherName}',
                                  textAlign: TextAlign.justify,
                                  softWrap: true,
                                  style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                      fontSize: 15 * ffem,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '${formatter.format((campaignVoucherModel.price))}',
                                        style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                          fontSize: 22 * ffem,
                                          color: kPrimaryColor,
                                          fontWeight: FontWeight.bold,
                                        )),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 0 * fem,
                                            top: 4 * hem,
                                            bottom: 0 * hem),
                                        child: SvgPicture.asset(
                                          'assets/icons/green-bean-icon.svg',
                                          width: 32 * fem,
                                          height: 32 * fem,
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 10 * fem, right: 10 * fem),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.red,
                                        )
                                        ),
                                    child: Row(
                                      children: [
                                        Text(
                                          'x${campaignVoucherDetail.rate.toStringAsFixed(0)}',
                                          style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                            fontSize: 18 * ffem,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          )),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 5 * fem,
                                              top: 4 * hem,
                                              bottom: 0 * hem),
                                          child: SvgPicture.asset(
                                            'assets/icons/red-bean-icon.svg',
                                            width: 25 * fem,
                                            height: 25 * fem,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      'assets/icons/cart-icon.svg'),
                                  Text(
                                    '${campaignVoucherDetail.quantityInBought} | ${campaignVoucherDetail.quantity}',
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                      fontSize: 15 * ffem,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    )),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5 * hem,
                        ),
                        Container(
                          color: Colors.white,
                          width: double.infinity,
                          padding: EdgeInsets.only(
                              left: 15 * fem, top: 15 * hem, bottom: 15 * hem),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/calendar-icon.svg',
                                width: 25 * fem,
                              ),
                              SizedBox(
                                width: 10 * fem,
                              ),
                              Text(
                                'Hạn sử dụng: ${changeFormateDate(campaignDetil.endOn)}',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                  fontSize: 15 * ffem,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                )),
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
                            campaignDetil: campaignDetil),
                        SizedBox(
                          height: 5 * hem,
                        ),
                        GestureDetector(
                          onTap: () {
                            _detailModelBottomSheet(context,campaignVoucherDetail,campaignDetil);
                          },
                          // onTap: () {
                          //   checkLength(campaignDetailModel.condition);
                          // },
                          child: Container(
                            padding: EdgeInsets.only(
                                right: 10 * fem,
                                left: 10 * fem,
                                top: 15 * hem,
                                bottom: 15 * hem),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(color: Colors.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 0 * fem),
                                  child: Text(
                                    'THỂ LỆ ƯU ĐÃI',
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                      fontSize: 15 * ffem,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    )),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 5 * fem, top: 5 * hem),
                                  child: HtmlWidget(
                                    '${campaignVoucherDetail.voucherCondition}',
                                    textStyle: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                        fontSize: 14 * ffem,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10 * hem,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Xem thêm',
                                      style: GoogleFonts.openSans(
                                          textStyle: TextStyle(
                                        fontSize: 14 * ffem,
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w600,
                                      )),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 3 * fem, top: 2 * hem),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 15,
                                          color: kPrimaryColor,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
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
                                  'CÁC ƯU ĐÃI CÙNG CHIẾN DỊCH',
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                    fontSize: 15 * ffem,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  )),
                                ),
                              ),
                              CampaignVoucherList(
                                fem: fem,
                                hem: hem,
                                ffem: ffem,
                                campaignDetallModeil: campaignDetil,
                                id: campaignVoucherModel.id,
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
      ),
    );
  }
}

Duration getDuration(String endOn) {
  DateTime dateStartOn = DateTime.parse(endOn);
  Duration duration = dateStartOn.difference(DateTime.now());
  print(DateTime.now());
  print(duration);
  print(dateStartOn);
  return duration;
}

void _detailModelBottomSheet(context,CampaignVoucherDetailModel campaignVoucherDetail, campaignModel) {
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
            borderRadius: BorderRadius.circular(15 * fem),
            color: klighGreyColor),
        child: DraggableScrollableSheet(
            initialChildSize: 1,
            minChildSize: 1,
            builder: (context, scrollController) {
      return SingleChildScrollView(
          controller: scrollController,
          child: Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: 15 * hem,
                      left: 25 * fem,
                      right: 25 * fem,
                      bottom: 15 * hem),
                  child: Center(
                    child: Text(
                      'Thông tin chi tiết',
                      style: GoogleFonts.openSans(
                        fontSize: 16 * ffem,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(
                    left: 10 * fem,
                    right: 10 * fem,
                  ),
                  padding: EdgeInsets.only(top: 15 * hem, bottom: 15 * hem),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10 * hem,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15 * fem),
                        child: Text(
                          'Thời gian ưu đãi',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                            fontSize: 16 * ffem,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 5 * hem, left: 15 * fem, right: 15 * fem),
                        child: Text(
                          '${changeFormateDate(campaignModel.startOn)} - ${changeFormateDate(campaignModel.endOn)}',
                          textAlign: TextAlign.justify,
                          softWrap: true,
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              fontSize: 15 * ffem,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15 * hem,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15 * fem),
                        child: Text(
                          'Thể lệ ưu đãi',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                            fontSize: 16 * ffem,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 5 * hem, left: 15 * fem, right: 15 * fem),
                        child: HtmlWidget(
                          '${campaignVoucherDetail.voucherCondition}',
                          textStyle: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              fontSize: 15 * ffem,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15 * hem,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15 * fem),
                        child: Text(
                          'Nội dung ưu đãi',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                            fontSize: 16 * ffem,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 5 * hem, left: 15 * fem, right: 15 * fem),
                        child: HtmlWidget(
                          '${campaignVoucherDetail.description}',
                          textStyle: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              fontSize: 15 * ffem,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
            },
          )
      );
    },
    isScrollControlled: true,
  );
}

Widget buildCampaignVoucherShimmer(double fem, double hem) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          color: Colors.white,
          child: ShimmerWidget.rectangular(
            height: 200 * hem,
          ),
        ),
        Container(
          margin:
              EdgeInsets.only(left: 15 * fem, right: 15 * fem, top: 20 * hem),
          child: ShimmerWidget.rectangular(
            height: 50 * hem,
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
    ),
  );
}
