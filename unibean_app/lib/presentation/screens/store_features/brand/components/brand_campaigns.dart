import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/screens/screens.dart';
import 'package:unibean_app/presentation/widgets/empty_widget.dart';

import '../../../../blocs/blocs.dart';
import '../../../../config/constants.dart';
import '../../../../widgets/shimmer_widget.dart';

class BrandCampaigns extends StatelessWidget {
  const BrandCampaigns(
      {super.key,
      required this.fem,
      required this.ffem,
      required this.hem,
      required this.id});

  final double fem;
  final double ffem;
  final double hem;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 5 * fem, left: 25 * fem, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<BrandBloc, BrandState>(
                builder: (context, state) {
                  if (state is BrandCampaignsByIdLoaded) {
                    return Text(
                      'Chiến dịch đang diễn ra (${state.campaignModels.length})',
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                        fontSize: 16 * ffem,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                    );
                  }
                  return Text(
                    'Chiến dịch đang diễn ra',
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                      fontSize: 16 * ffem,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10 * hem,
        ),
        BlocBuilder<BrandBloc, BrandState>(
          builder: (context, state) {
            if (state is BrandCampaignsByIdLoaded) {
              if (state.campaignModels.isEmpty) {
                return EmptyWidget(text: 'Không có chiến dịch');
              } else {
                return Container(
                    height: 250 * hem,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.campaignModels.length,
                      itemBuilder: (context, index) {
                        final campaignModel = state.campaignModels[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, CampaignDetailScreen.routeName,
                                arguments: campaignModel.id);
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: 172 * fem,
                                margin: EdgeInsets.only(left: 15 * fem),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15 * fem),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          right: 5 * fem,
                                          left: 5 * fem,
                                          top: 5 * hem),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10 * fem),
                                            topRight:
                                                Radius.circular(10 * fem)),
                                        child: Container(
                                          height: 150 * hem,
                                          width: 180 * fem,
                                          child: Image.network(
                                            campaignModel.image,
                                            fit: BoxFit.fill,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Container(
                                                width: 170 * fem,
                                                height: 180 * hem,
                                                child: Image.asset(
                                                  'assets/images/campaign-default.png',
                                                  width: 40 * fem,
                                                  height: 40 * hem,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 10 * fem,
                                          right: 10 * fem,
                                          top: 5 * hem),
                                      child: Text(
                                        campaignModel.campaignName,
                                        maxLines: 2,
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                          fontSize: 14 * ffem,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        )),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 10 * fem,
                                          right: 10 * fem,
                                          top: 5 * hem),
                                      child: Text(
                                          '${changeFormateDate(campaignModel.startOn)} - ${changeFormateDate(campaignModel.endOn)}',
                                          softWrap: true,
                                          style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                            fontSize: 12 * ffem,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                          ))),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ));
              }
            }
            return buildBrandVouchersShimmer(fem, hem);
          },
        ),
      ],
    );
  }
}

Widget buildBrandVouchersShimmer(double fem, double hem) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
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
