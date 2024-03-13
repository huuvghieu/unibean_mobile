import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:unibean_app/data/repositories.dart';
import 'package:unibean_app/domain/repositories.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/student_features/campaign_detail/components/campaign_voucher_list.dart';

import '../../../../widgets/shimmer_widget.dart';
import 'campaign_detail_showdal.dart';
import 'detail_showdal_bottom.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;

    return BlocProvider(
      create: (context) =>
          CampaignBloc(campaignRepository: context.read<CampaignRepository>())
            ..add(LoadCampaignById(id: id)),
      child: BlocBuilder<CampaignBloc, CampaignState>(
        builder: (context, state) {
          if (state is CampaignLoading) {
            return buildCampaignDetailShimmer(fem, hem);
          } else if (state is CampaignByIdLoaded) {
            return Stack(
              children: [
                Positioned(
                  top: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    height: 200 * hem,
                    child: Image.network(
                      state.campaignDetailModel.image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/background_splash.png',
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: AppBar(
                    forceMaterialTransparency: true,
                    elevation: 0,
                    toolbarHeight: 80 * hem,
                    leading: Container(
                      margin: EdgeInsets.only(left: 20 * fem),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.white,
                              size: 35 * fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                    leadingWidth: double.infinity,
                  ),
                ),
                Positioned(
                  top: 160 * hem,
                  left: 0 * fem,
                  right: 0 * fem,
                  child: Container(
                    height: 150 * hem,
                    margin: EdgeInsets.only(right: 15 * fem, left: 15 * fem),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: kPrimaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x0c000000),
                              offset: Offset(0 * fem, 10 * fem),
                              blurRadius: 5 * fem)
                        ]),
                    width: MediaQuery.of(context).size.width,
                    constraints: BoxConstraints(maxHeight: double.infinity),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 300 * fem,
                          child: Text(
                            '${state.campaignDetailModel.campaignName}',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                              fontSize: 18 * ffem,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 10 * hem,
                        ),
                        SizedBox(
                          width: 240 * fem,
                          child: Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                        ),
                        SizedBox(
                          height: 10 * hem,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10 * fem),
                              child: Container(
                                height: 35 * hem,
                                width: 35 * fem,
                                child: Image.network(
                                  state.campaignDetailModel.brandLogo,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      'assets/images/image-404.jpg',
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5 * fem,
                            ),
                            Text(
                              '${state.campaignDetailModel.brandName}',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                fontSize: 16 * ffem,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 320 * hem,
                  left: 0,
                  right: 0,
                  child: CampaignDetailShowdal(
                    fem: fem,
                    hem: hem,
                    ffem: ffem,
                    onTap: () {
                      _detailModelBottomSheet(
                          context, state.campaignDetailModel);
                    },
                  ),
                ),
                Positioned(
                  top: 440 * hem,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16 * fem),
                    child: Text(
                      'ƯU ĐÃI TRONG CHIẾN DỊCH',
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                        fontSize: 16 * ffem,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                  ),
                ),
                Positioned(
                    top: 470 * hem,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width,
                        maxHeight: MediaQuery.of(context).size.height,
                      ),
                      child: CustomScrollView(
                        slivers: [
                          SliverList(
                            delegate: SliverChildListDelegate([
                              CampaignVoucherList(
                                  fem: fem,
                                  hem: hem,
                                  ffem: ffem,
                                  campaignDetallModeil:
                                      state.campaignDetailModel)
                            ]),
                          )
                        ],
                      ),
                    ))
              ],
            );
          }
          return Container(
            child: Center(
              child: Text('Error'),
            ),
          );
        },
      ),
    );
  }
}

void _detailModelBottomSheet(context, campaignModel) {
  double baseWidth = 375;
  double fem = MediaQuery.of(context).size.width / baseWidth;
  double ffem = fem * 0.97;
  double baseHeight = 812;
  double hem = MediaQuery.of(context).size.height / baseHeight;

  showModalBottomSheet(
    context: context,
    builder: (context) {
      return RepositoryProvider<CampaignRepository>(
        create: (context) => CampaignRepositoryImp(),
        child: Container(
          height: 500 * hem,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15 * fem),
              color: Colors.white),
          child: DetailShowdalBottom(
            hem: hem,
            fem: fem,
            ffem: ffem,
            campaignDetailModel: campaignModel,
          ),
        ),
      );
    },
    isScrollControlled: true,
  );
}

Widget buildCampaignDetailShimmer(double fem, double hem) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        height: 100 * fem,
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
          height: 120 * hem,
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

String changeFormateDate(String dateTime) {
  DateTime formatDate = DateTime.parse(dateTime);
  String formattedDate = DateFormat('dd/MM/yyyy').format(formatDate);
  return formattedDate;
}
