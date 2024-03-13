import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/data/models.dart';
import 'package:unibean_app/domain/repositories.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/cubits/counter/counter_cubit.dart';

import '../../../blocs/blocs.dart';
import 'components/body.dart';

class CampaignVoucherScreen extends StatelessWidget {
  static const String routeName = '/voucher-detail-student';

  static Route route(
      {required CampaignVoucherModel campaignVoucher,
      required CampaignDetailModel campaignDetail}) {
    return MaterialPageRoute(
        builder: (_) => CampaignVoucherScreen(
              campaignDetailModel: campaignDetail,
              campaignVoucherModel: campaignVoucher,
            ),
        settings: const RouteSettings(arguments: routeName));
  }

  const CampaignVoucherScreen(
      {super.key,
      required this.campaignVoucherModel,
      required this.campaignDetailModel});

  final CampaignVoucherModel campaignVoucherModel;
  final CampaignDetailModel campaignDetailModel;

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
            'Chi tiết ưu đãi',
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    fontSize: 20 * ffem,
                    fontWeight: FontWeight.w900,
                    height: 1.3625 * ffem / fem,
                    color: Colors.white)),
          ),
          actions: [
            // SvgPicture.asset('assets/icons/notification-icon.svg')
            Padding(
              padding: EdgeInsets.only(right: 20 * fem),
              child: IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 35 * fem,
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/landing-screen',
                      (Route<dynamic> route) => false);
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => CounterCubit(),
            ),
            BlocProvider(
              create: (_) => CampaignBloc(
                  campaignRepository: context.read<CampaignRepository>()),
            ),
          ],
          child: BottomAppBar(
            color: Colors.white,
            height: 110 * hem,
            elevation: 50,
            child: BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tổng đậu xanh',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                        ),
                        Row(
                          children: [
                            Text(
                              '${formatter.format((campaignVoucherModel.price) * state.counterValue)}',
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                fontSize: 20 * ffem,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 2 * fem, top: 4 * hem, bottom: 0 * hem),
                              child: SvgPicture.asset(
                                'assets/icons/green-bean-icon.svg',
                                width: 26 * fem,
                                height: 26 * fem,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 25 * fem,
                              height: 25 * fem,
                              child: FloatingActionButton(
                                  elevation: 0,
                                  backgroundColor: klightPrimaryColor,
                                  child: const Icon(
                                    Icons.remove,
                                    size: 15,
                                  ),
                                  onPressed: () {
                                    if (state.counterValue <= 1) {
                                    } else {
                                      context.read<CounterCubit>().decrement();
                                    }
                                  }),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                right: 10 * fem,
                                left: 10 * fem,
                              ),
                              width: 40 * fem,
                              height: 30 * hem,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: kbgWhiteColor),
                              child: Center(
                                  child: Text(
                                '${state.counterValue}',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black)),
                              )),
                            ),
                            Container(
                              width: 25 * fem,
                              height: 25 * fem,
                              child: FloatingActionButton(
                                  elevation: 0,
                                  backgroundColor: klightPrimaryColor,
                                  child: const Icon(
                                    Icons.add,
                                    size: 15,
                                  ),
                                  onPressed: () {
                                    if (state.counterValue >=
                                        campaignVoucherModel.quantityInStock) {
                                    } else {
                                      context.read<CounterCubit>().increment();
                                    }
                                  }),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () async {
                            final studentId =
                                await AuthenLocalDataSource.getStudentId();
                            context.read<CampaignBloc>().add(
                                RedeemCampaignVoucher(
                                    campaignId: campaignDetailModel.id,
                                    campaignDetailId: campaignVoucherModel.id,
                                    studentId: studentId!,
                                    quantity: state.counterValue,
                                    description: 'string'));
                          },
                          child: BlocConsumer<CampaignBloc, CampaignState>(
                            listener: (_, state) {
                              if (state is RedeemVoucherFailed) {
                                ScaffoldMessenger.of(_)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(SnackBar(
                                    elevation: 0,
                                    duration:
                                        const Duration(milliseconds: 2000),
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.transparent,
                                    content: AwesomeSnackbarContent(
                                      title: 'Mua thất bại!',
                                      message: '${state.error}',
                                      contentType: ContentType.failure,
                                    ),
                                  ));
                              }
                            },
                            builder: (_, state) {
                              if (state is RedeemVoucherLoading) {
                                return Container(
                                  width: 200 * fem,
                                  height: 35 * hem,
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius:
                                          BorderRadius.circular(10 * fem)),
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    color: Colors.white,
                                    
                                  )),
                                );
                              } else {
                                return Container(
                                  width: 200 * fem,
                                  height: 35 * hem,
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius:
                                          BorderRadius.circular(10 * fem)),
                                  child: Center(
                                    child: Text(
                                      'Mua ngay',
                                      style: GoogleFonts.openSans(
                                          textStyle: TextStyle(
                                              fontSize: 15 * ffem,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        body: Body(
          campaignVoucherModel: campaignVoucherModel,
          campaignDetil: campaignDetailModel,
        ),
      ),
    );
  }
}
