import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/domain/repositories.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/screens.dart';

import '../../../../data/models.dart';
import '../../../blocs/blocs.dart';
import '../../../widgets/shimmer_widget.dart';
import 'components/body.dart';

class VoucherDetailScreen extends StatelessWidget {
  static const String routeName = '/voucher-detail-student';

  static Route route({required String id}) {
    return MaterialPageRoute(
        builder: (_) => VoucherDetailScreen(
              id: id,
            ),
        settings: const RouteSettings(arguments: routeName));
  }

  const VoucherDetailScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double baseHeight = 812;
    double ffem = fem * 0.97;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return BlocProvider(
      create: (context) =>
          VoucherBloc(voucherRepository: context.read<VoucherRepository>())
            ..add(LoadVoucherById(voucherId: id)),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: klighGreyColor,
          appBar: AppBar(
            elevation: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background_splash.png'),
                      fit: BoxFit.cover)),
            ),
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 35 * fem,
              ),
            ),
            toolbarHeight: 80 * hem,
            centerTitle: true,
            title: Text(
              'Chi tiết ưu đãi',
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w900,
                      height: 1.3625 * ffem / fem,
                      color: Colors.white)),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            height: 80 * hem,
            elevation: 5,
            child: BlocBuilder<VoucherBloc, VoucherState>(
              builder: (context, state) {
                if (state is VoucherByIdLoading) {
                  return Center(
                    child: Container(
                      color: Colors.white,
                      child: ShimmerWidget.rectangular(
                        width: 320 * hem,
                        height: 45 * fem,
                      ),
                    ),
                  );
                } else if (state is VoucherByIdLoaded) {
                  var voucherModel = state.voucherDetailModel;
                  return GestureDetector(
                    onTap: () {
                      _detailModelBottomSheet(
                          context, voucherModel.campaigns, voucherModel);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            width: 320 * fem,
                            height: 45 * hem,
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(10 * fem)),
                            child: Center(
                              child: Text(
                                'Mua ngay',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        fontSize: 17 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.3625 * ffem / fem,
                                        color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
          body: Body(),
        ),
      ),
    );
  }
}

void _detailModelBottomSheet(
    context, List<CampaignModel> campaigns, VoucherDetailModel voucherModel) {
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
              color: Colors.white),
          child: DraggableScrollableSheet(
            initialChildSize: 1,
            minChildSize: 1,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                  controller: scrollController,
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
                            'Chọn chiến dịch để mua ưu đãi',
                            style: GoogleFonts.openSans(
                              fontSize: 16 * ffem,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: campaigns.length,
                        itemBuilder: (context, index) {
                          var campaignModel = campaigns[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, CampaignDetailScreen.routeName,
                                  arguments: campaignModel.id);
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 10 * fem,
                                  right: 10 * fem,
                                  bottom: 15 * hem),
                              width: 350 * fem,
                              height: 120 * hem,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15 * fem),
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 5 * hem,
                                        left: 5 * fem,
                                        bottom: 5 * hem),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(10 * fem),
                                      child: Container(
                                        width: 120 * fem,
                                        height: 120 * hem,
                                        child: Image.network(
                                          campaignModel.image,
                                          fit: BoxFit.fill,
                                          errorBuilder:
                                              (context, error, stackTrace) {
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
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 5 * hem, bottom: 5 * hem),
                                        child: Text(campaignModel.brandName,
                                            softWrap: true,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.openSans(
                                                textStyle: TextStyle(
                                              fontSize: 13 * ffem,
                                              color: kLowTextColor,
                                              fontWeight: FontWeight.normal,
                                            ))),
                                      ),
                                      Container(
                                        width: 200 * fem,
                                        // height: 45*hem,
                                        child: Text(campaignModel.campaignName,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.openSans(
                                                textStyle: TextStyle(
                                              fontSize: 14 * ffem,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
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
                                              fontWeight: FontWeight.normal,
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
                                              fontWeight: FontWeight.normal,
                                            ))),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ));
            },
          ));
    },
    isScrollControlled: true,
  );
}
