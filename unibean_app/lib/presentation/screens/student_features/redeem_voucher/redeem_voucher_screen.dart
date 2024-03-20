import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';

import '../../../blocs/blocs.dart';
import '../../screens.dart';
import 'components/body.dart';

class RedeemVoucherScreen extends StatelessWidget {
  static const String routeName = '/redeem-voucher-student';

  static Route route(
      {required String campignId,
      required String campaignDetailId,
      required String studentId,
      required int quantity,
      required String description,
      required double total,
      required String voucherName,
      required String campaignName,
      required double priceVoucher}) {
    return MaterialPageRoute(
        builder: (_) => RedeemVoucherScreen(
              campignId: campignId,
              campaignDetailId: campaignDetailId,
              studentId: studentId,
              quantity: quantity,
              campaignName: campaignName,
              total: total,
              voucherName: voucherName,
              description: description,
              priceVoucher: priceVoucher,
            ),
        settings: const RouteSettings(name: routeName));
  }

  const RedeemVoucherScreen(
      {super.key,
      required this.campignId,
      required this.campaignDetailId,
      required this.studentId,
      required this.quantity,
      required this.description,
      required this.total,
      required this.campaignName,
      required this.voucherName,
      required this.priceVoucher});
  final String campignId;
  final String campaignDetailId;
  final String studentId;
  final int quantity;
  final String description;
  final double total;
  final String voucherName;
  final String campaignName;
  final double priceVoucher;
  // final

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double baseHeight = 812;
    double ffem = fem * 0.97;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return SafeArea(
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
            'Thanh toán an toàn',
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    fontSize: 20 * ffem,
                    fontWeight: FontWeight.w900,
                    height: 1.3625 * ffem / fem,
                    color: Colors.white)),
          ),
        ),
        body: BlocListener<CampaignBloc, CampaignState>(
          listener: (context, state) {
            if (state is RedeemVoucherSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context,
                  SuccessRedeemVoucherScreen.routeName,
                  (Route<dynamic> route) => false,
                  arguments: <dynamic>[voucherName, total]);
            }
          },
          child: Body(
            campignId: campignId,
            campaignDetailId: campaignDetailId,
            studentId: studentId,
            quantity: quantity,
            voucherName: voucherName,
            total: total,
            campaignName: campaignName,
            description: description,
            priceVoucher: priceVoucher,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            color: klighGreyColor,
            height: 80 * hem,
            elevation: 5,
            child: GestureDetector(
              onTap: () {
                context.read<CampaignBloc>().add(RedeemCampaignVoucher(
                    campaignId: campignId,
                    campaignDetailId: campaignDetailId,
                    studentId: studentId,
                    quantity: quantity,
                    description: 'string'));
              },
              child: BlocBuilder<CampaignBloc, CampaignState>(
                builder: (context, state) {
                  if (state is RedeemVoucherLoading) {
                    return Row(
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
                                child: CircularProgressIndicator(
                              color: Colors.white,
                            )),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Row(
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
                                'Thanh toán',
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
                    );
                  }
                },
              ),
            )),
      ),
    );
  }
}
