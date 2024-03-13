import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/data/models.dart';
import 'package:unibean_app/data/repositories.dart';

import '../../../../blocs/blocs.dart';
import '../../../../config/constants.dart';
import '../../../../widgets/shimmer_widget.dart';

class DetailShowdalBottom extends StatelessWidget {
  const DetailShowdalBottom({
    super.key,
    required this.hem,
    required this.fem,
    required this.ffem,
    required this.campaignDetailModel,
  });

  final double hem;
  final double fem;
  final double ffem;
  final CampaignDetailModel campaignDetailModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CampaignBloc(campaignRepository: CampaignRepositoryImp())
            ..add(LoadCampaignStoreById(id: campaignDetailModel.id)),
      child: DraggableScrollableSheet(
        initialChildSize: 1,
        minChildSize: 1,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: BlocBuilder<CampaignBloc, CampaignState>(
              builder: (context, state) {
                if (state is CampaignStoreLoading) {
                  return buildShowdalShimmer(fem, hem);
                } else if (state is CampaignStoreByIdLoaded) {
                  return Column(
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
                        padding:
                            EdgeInsets.only(top: 15 * hem, bottom: 15 * hem),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 25 * fem),
                              child: Text(
                                'Áp dụng cho',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                  fontSize: 14 * ffem,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  right: 25 * fem, left: 25 * fem),
                              constraints:
                                  BoxConstraints(maxHeight: double.infinity),
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: state.campaignStores.length,
                                itemBuilder: (context, index) {
                                  if (index == 0 &&
                                      state.campaignStores.length == 1) {
                                    return Text(
                                      '${state.campaignStores[index].storeName}.',
                                      style: GoogleFonts.openSans(
                                          textStyle: TextStyle(
                                        fontSize: 14 * ffem,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                      )),
                                    );
                                  } else {
                                    return Text(
                                      '- ${state.campaignStores[index].storeName}.',
                                      style: GoogleFonts.openSans(
                                          textStyle: TextStyle(
                                        fontSize: 14 * ffem,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                      )),
                                    );
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: 15 * hem,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 25 * fem),
                              child: Text(
                                'Thời gian chiến dịch',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                  fontSize: 14 * ffem,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 5 * hem,
                                  left: 25 * fem,
                                  right: 25 * fem),
                              child: Text(
                                '${changeFormateDate(campaignDetailModel.startOn)} - ${changeFormateDate(campaignDetailModel.endOn)}',
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
                            Padding(
                              padding: EdgeInsets.only(left: 25 * fem),
                              child: Text(
                                'Thể lệ',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                  fontSize: 14 * ffem,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 5 * hem,
                                  left: 25 * fem,
                                  right: 25 * fem),
                              child: Text(
                                campaignDetailModel.condition,
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
                            Padding(
                              padding: EdgeInsets.only(left: 25 * fem),
                              child: Text(
                                'Thông tin về chiến dịch',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                  fontSize: 14 * ffem,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 5 * hem,
                                  left: 25 * fem,
                                  right: 25 * fem),
                              child: Text(
                                campaignDetailModel.description,
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
                    ],
                  );
                }
                return Container();
              },
            ),
          );
        },
      ),
    );
  }
}

Widget buildShowdalShimmer(double fem, double hem) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(left: 80 * fem, right: 80 * fem, top: 20 * hem),
        child: ShimmerWidget.rectangular(
          height: 20 * hem,
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 15 * fem, right: 15 * fem, top: 20 * hem),
        child: ShimmerWidget.rectangular(
          height: 20 * hem,
          width: 100 * fem,
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 15 * fem, right: 15 * fem, top: 5 * hem),
        child: ShimmerWidget.rectangular(
          height: 20 * hem,
          width: 150 * fem,
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 15 * fem, right: 15 * fem, top: 20 * hem),
        child: ShimmerWidget.rectangular(
          height: 20 * hem,
          width: 100 * fem,
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 15 * fem, right: 15 * fem, top: 5 * hem),
        child: ShimmerWidget.rectangular(
          height: 20 * hem,
          width: 200 * fem,
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 15 * fem, right: 15 * fem, top: 20 * hem),
        child: ShimmerWidget.rectangular(
          height: 20 * hem,
          width: 100 * fem,
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 15 * fem, right: 15 * fem, top: 5 * hem),
        child: ShimmerWidget.rectangular(
          height: 20 * hem,
          width: 200 * fem,
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 15 * fem, right: 15 * fem, top: 20 * hem),
        child: ShimmerWidget.rectangular(
          height: 20 * hem,
          width: 100 * fem,
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 15 * fem, right: 15 * fem, top: 5 * hem),
        child: ShimmerWidget.rectangular(
          height: 80 * hem,
          width: 340 * fem,
        ),
      ),
    ],
  );
}

