import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
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
                                    'Kết thúc bán sau:',
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                      fontSize: 13 * ffem,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
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
                                      color: kPrimaryColor),
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
                              left: 15 * fem, top: 15 * hem, bottom: 15 * hem),
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
                                padding: EdgeInsets.only(
                                    top: 2 * hem, left: 5 * fem),
                                child: Text(
                                  'Ưu đãi: ${state.campaignVoucherDetail.voucherName}',
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
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 0 * hem, left: 5 * fem),
                                child: Text(
                                  'Đã bán: ${state.campaignVoucherDetail.quantityInBought}',
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
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 0 * hem, left: 5 * fem),
                                child: Text(
                                  'Còn: ${state.campaignVoucherDetail.quantityInStock}',
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
                                padding: EdgeInsets.only(
                                    top: 2 * hem, left: 5 * fem),
                                child: Text(
                                  campaignVoucherDetail.voucherCondition,
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
                                padding: EdgeInsets.only(
                                    top: 5 * hem, left: 5 * fem),
                                child: Text(
                                  campaignVoucherDetail.description,
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
                                'Ngày bắt đầu: ${changeFormateDate(campaignDetil.startOn)}',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                  fontSize: 15 * ffem,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )),
                              ),
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
                                  fontWeight: FontWeight.bold,
                                )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5 * hem,
                        ),
                        CampaignInformationCard(
                            hem: hem,
                            fem: fem,
                            ffem: ffem,
                            campaignDetil: campaignDetil),
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
                                    fontWeight: FontWeight.bold,
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
