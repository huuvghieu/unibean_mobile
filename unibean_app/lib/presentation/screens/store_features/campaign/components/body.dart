import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';
import 'package:unibean_app/presentation/blocs/store/store_bloc.dart';
import '../../../../../data/models.dart';
import '../../../../config/constants.dart';
import 'search_bar_custom.dart';
import 'voucher_card_list.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.storeModel});

  final StoreModel storeModel;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return BlocBuilder<StoreBloc, StoreState>(
      builder: (context, state) {
        if (state is StoreCampaignVoucherLoading) {
          return Center(
            child: Lottie.asset('assets/animations/loading-screen.json'),
          );
        } else if (state is StoreCampaignVoucherLoaded) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<StoreBloc>().add(LoadStoreCampaignVouchers());
            },
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(top: 15 * fem, bottom: 15 * fem),
                          color: kbgWhiteColor,
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  'Xin chào, ${storeModel.storeName}!',
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 21 * ffem,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Tham gia các hoạt động để tích lũy ưu đãi',
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.normal)),
                                ),
                              ),
                              SizedBox(
                                height: 10 * hem,
                              ),
                              SearchBarCustom()
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5 * hem,
                        ),
                        Container(
                          color: kbgWhiteColor,
                          // height: 500,
                          padding:
                              EdgeInsets.only(top: 15 * fem, bottom: 15 * fem),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlocBuilder<StoreBloc, StoreState>(
                                builder: (context, state) {
                                  if (state is StoreCampaignVoucherLoading) {
                                    return Center(
                                      child: Lottie.asset(
                                          'assets/animations/loading-screen.json'),
                                    );
                                  } else if (state
                                      is StoreCampaignVoucherLoaded) {
                                    Map campaign = state.campaignStoreCart
                                        .voucherCampaign(state.campaignStoreCart
                                            .campaignVouchers);
                                    return ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: campaign.keys.length,
                                      itemBuilder: (context, index) {
                                        var campaignName =
                                            campaign.keys.elementAt(index);
                                        List<CampaignVoucherStoreModel>
                                            campaignVouchers =
                                            campaign.values.elementAt(index);
                                        return Container(
                                          margin:
                                              EdgeInsets.only(bottom: 15 * hem),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 15 * fem),
                                                child: Text(
                                                  '${campaignName.toString().toUpperCase()}',
                                                  style: GoogleFonts.openSans(
                                                      textStyle: TextStyle(
                                                    fontSize: 15 * ffem,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  ListView.builder(
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemCount:
                                                        campaignVouchers.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      var voucher =
                                                          campaignVouchers[
                                                              index];
                                                      return VoucherCardList(
                                                          hem: hem,
                                                          fem: fem,
                                                          voucher: voucher,
                                                          ffem: ffem);
                                                    },
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 15 * hem,
                                              ),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      left: 25 * fem,
                                                      right: 25 * fem),
                                                  child: Divider())
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  }
                                  return Container();
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ]),
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
