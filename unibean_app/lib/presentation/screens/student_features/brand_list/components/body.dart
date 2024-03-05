import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';

import '../../../../../data/models.dart';
import '../../../../config/constants.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    // double heightText = 1.3625 * ffem / fem;
    return BlocBuilder<BrandBloc, BrandState>(
      builder: (context, state) {
        if (state is BrandLoading) {
          return Center(
            child: Lottie.asset('assets/animations/loading-screen.json'),
          );
        } else if (state is BrandsLoaded) {
          return GridView.builder(
            controller: context.read<BrandBloc>().scrollController,
            padding: EdgeInsets.symmetric(
                horizontal: 8.0 * fem, vertical: 16.0 * hem),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1.15),
            shrinkWrap: true,
            itemCount: context.read<BrandBloc>().isLoadingMore
                ? state.brands.length + 1
                : state.brands.length,
            itemBuilder: (context, index) {
              if (index > state.brands.length) {
                return Lottie.asset('assets/animations/loading-screen.json',
                    width: 30 * fem, height: 30 * hem);
              } else if (index == state.brands.length) {
                return Container();
              }
              return BrandCard(
                  hem: hem,
                  fem: fem,
                  brandModel: state.brands[index],
                  ffem: ffem);
            },
          );
        }
        return Center(
          child: Lottie.asset('assets/animations/loading-screen.json'),
        );
      },
    );
  }
}

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.hem,
    required this.fem,
    required this.ffem,
    required this.brandModel,
  });

  final double hem;
  final double fem;
  final double ffem;
  final BrandModel brandModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        height: 150 * hem,
        // margin: EdgeInsets.only(bottom: 20*hem),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15 * fem),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Color(0x0c000000),
                  offset: Offset(0 * fem, 5 * fem),
                  blurRadius: 5 * fem)
            ]),
        child: InkWell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: 5 * hem, right: 5 * fem, left: 5 * fem),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10 * fem),
                  child: Container(
                    height: 100 * hem,
                    width: 120 * fem,
                    child: Image.network(
                      brandModel.logo,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          // child: Image.asset(
                          //   'assets/images/campaign-default.png',
                          //   width: 50 * fem,
                          //   height: 50 * hem,
                          // ),
                          child: Icon(
                            Icons.error,
                            size: 50 * fem,
                            color: kPrimaryColor,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150 * hem,
                    padding: EdgeInsets.only(top: 5 * hem),
                    child: Text(
                      brandModel.brandName,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                        fontSize: 13 * ffem,
                        color: kDarkPrimaryColor,
                        fontWeight: FontWeight.w900,
                      )),
                    ),
                  ),
                ],
              ),
              // Container(
              //   padding: EdgeInsets.only(
              //       left: 10 * fem, right: 10 * fem, top: 5 * hem),
              //   child: Text(
              //     campaignModel.campaignName,
              //     overflow: TextOverflow.ellipsis,
              //     maxLines: 2,
              //     style: GoogleFonts.nunito(
              //         textStyle: TextStyle(
              //       fontSize: 14 * ffem,
              //       color: Colors.black,
              //       fontWeight: FontWeight.bold,
              //     )),
              //   ),
              // ),
              // Row(
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.only(left: 12 * fem),
              //       child: Text(
              //         'Nhận:',
              //         style: GoogleFonts.nunito(
              //             textStyle: TextStyle(
              //           fontSize: 13 * ffem,
              //           color: Colors.black,
              //           fontWeight: FontWeight.normal,
              //         )),
              //       ),
              //     ),
              //     Padding(
              //       padding: EdgeInsets.only(left: 2 * fem),
              //       child: Text(
              //         '${formatter.format(campaignModel.totalIncome)}',
              //         style: GoogleFonts.nunito(
              //             textStyle: TextStyle(
              //           fontSize: 12 * ffem,
              //           color: Colors.red,
              //           fontWeight: FontWeight.normal,
              //         )),
              //       ),
              //     ),
              //     Padding(
              //       padding: EdgeInsets.only(
              //           left: 2 * fem,
              //           top: 2 * hem,
              //           bottom: 2 * hem),
              //       child: SvgPicture.asset(
              //         'assets/icons/red-bean-icon.svg',
              //         width: 20 * fem,
              //         height: 17 * fem,
              //       ),
              //     )
              //   ],
              // ),
              // Align(
              //   alignment: Alignment.center,
              //   child: TextButton(
              //     onPressed: () {},
              //     child: Container(
              //         width: 80 * fem,
              //         height: 30 * hem,
              //         decoration: BoxDecoration(
              //             color: kPrimaryColor,
              //             border: Border.all(color: kPrimaryColor),
              //             borderRadius: BorderRadius.circular(5)),
              //         child: Center(
              //           child: Text(
              //             'Chi tiết',
              //             style: GoogleFonts.nunito(
              //                 textStyle: TextStyle(
              //                     fontSize: 13,
              //                     fontWeight: FontWeight.w600,
              //                     color: Colors.white)),
              //           ),
              //         )),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
