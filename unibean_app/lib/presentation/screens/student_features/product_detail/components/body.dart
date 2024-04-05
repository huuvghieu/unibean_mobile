import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/cubits/counter/counter_cubit.dart';

import '../../../../blocs/blocs.dart';
import '../../../../config/constants.dart';
import '../../../../widgets/shimmer_widget.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductByIdLoading) {
          return buildProductDetailShimmer(fem, hem);
        } else if (state is ProductByIdLoaded) {
          var product = state.productDetail;
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 250 * hem,
                        width: MediaQuery.of(context).size.width,
                        child: AnotherCarousel(
                          images: [
                            for (var item in product.productImages)
                              Image.network(
                                item,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/images/image-404.jpg',
                                  );
                                },
                              ),
                          ],
                          dotSize: 5,
                          dotBgColor: Colors.transparent,
                          indicatorBgPadding: 5.0,
                          autoplay: false,
                          dotIncreasedColor: kPrimaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 5 * hem,
                      ),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(
                            top: 15 * hem, bottom: 15 * hem, left: 15 * fem),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          '${product.productName.toUpperCase()}',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  fontSize: 18 * ffem,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                      ),
                      SizedBox(
                        height: 2 * hem,
                      ),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(
                            top: 15 * hem,
                            bottom: 15 * hem,
                            left: 15 * fem,
                            right: 15 * fem),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${formatter.format(product.price).toString()}',
                                      style: GoogleFonts.openSans(
                                          textStyle: TextStyle(
                                        fontSize: 30 * ffem,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      )),
                                    ),
                                    SizedBox(
                                      width: 5 * fem,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 4 * hem, bottom: 2 * hem),
                                      child: SvgPicture.asset(
                                        'assets/icons/red-bean-icon.svg',
                                        width: 30 * fem,
                                        height: 25 * fem,
                                      ),
                                    )
                                  ],
                                ),
                                BlocBuilder<CounterCubit, CounterState>(
                                  builder: (context, state) {
                                    return Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 35 * fem,
                                          height: 35 * fem,
                                          child: FloatingActionButton(
                                              heroTag: 'remove',
                                              elevation: 0,
                                              backgroundColor:
                                                  klightPrimaryColor,
                                              child: const Icon(
                                                Icons.remove,
                                                size: 15,
                                              ),
                                              onPressed: () {
                                                if (state.counterValue <= 1) {
                                                } else {
                                                  context
                                                      .read<CounterCubit>()
                                                      .decrement();
                                                }
                                              }),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            right: 10 * fem,
                                            left: 10 * fem,
                                          ),
                                          width: 50 * fem,
                                          height: 40 * hem,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: kbgWhiteColor),
                                          child: Center(
                                              child: Text(
                                            '${state.counterValue}',
                                            style: GoogleFonts.openSans(
                                                textStyle: TextStyle(
                                                    fontSize: 14 * ffem,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black)),
                                          )),
                                        ),
                                        Container(
                                          width: 35 * fem,
                                          height: 35 * fem,
                                          child: FloatingActionButton(
                                              heroTag: 'Add',
                                              elevation: 0,
                                              backgroundColor: kPrimaryColor,
                                              child: const Icon(
                                                Icons.add,
                                                size: 15,
                                              ),
                                              onPressed: () {
                                                if (state.counterValue >=
                                                    product.quantity) {
                                                } else {
                                                  context
                                                      .read<CounterCubit>()
                                                      .increment();
                                                }
                                              }),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10 * hem,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5 * hem),
                              child: Text(
                                'Mô tả sản phẩm',
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
                            Padding(
                              padding: EdgeInsets.only(top: 5 * hem),
                              child: HtmlWidget(
                                '${product.description}',
                                textStyle: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                    fontSize: 14 * ffem,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Còn lại: ${product.quantity}',
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                    fontSize: 15 * ffem,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20 * hem,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'NHÀ PHÂN PHỐI',
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                    fontSize: 15 * ffem,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' UNIBEAN',
                                    style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                        fontSize: 15 * ffem,
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/images/bean_logo.jpg',
                              height: 100 * hem,
                            ),
                            SizedBox(
                              height: 15 * hem,
                            ),
                            Text(
                              'LIÊN HỆ',
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                fontSize: 15 * ffem,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              )),
                            ),
                            SizedBox(
                              height: 5 * hem,
                            ),
                            BlocBuilder<StationBloc, StationState>(
                              builder: (context, state) {
                                if (state is StationLoading) {
                                  return Container(
                                    child: CircularProgressIndicator(
                                      color: kPrimaryColor,
                                    ),
                                  );
                                } else if (state is StationsLoaded) {
                                  return ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: state.stations.length,
                                    itemBuilder: (context, index) {
                                      var station = state.stations[index];
                                      return Padding(
                                        padding:
                                            EdgeInsets.only(bottom: 3 * hem),
                                        child: RichText(
                                          text: TextSpan(
                                            text: '- Trạm:',
                                            style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                                fontSize: 13 * ffem,
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: ' ${station.stationName}',
                                                style: GoogleFonts.openSans(
                                                  textStyle: TextStyle(
                                                    fontSize: 13 * ffem,
                                                    fontStyle: FontStyle.italic,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                              TextSpan(
                                                text: ' - Địa chỉ:',
                                                style: GoogleFonts.openSans(
                                                  textStyle: TextStyle(
                                                    fontSize: 13 * ffem,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                              TextSpan(
                                                text: ' ${station.address}',
                                                style: GoogleFonts.openSans(
                                                  textStyle: TextStyle(
                                                    fontSize: 13 * ffem,
                                                    fontStyle: FontStyle.italic,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                                return Container();
                              },
                            ),
                            SizedBox(
                              height: 50 * hem,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
              )
            ],
          );
        }
        return Container();
      },
    );
  }
}

Widget buildProductDetailShimmer(double fem, double hem) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          color: Colors.white,
          child: ShimmerWidget.rectangular(
            height: 250 * hem,
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
            width: 170 * fem,
          ),
        ),
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: 15 * fem, top: 20 * hem, right: 15 * fem),
              child: ShimmerWidget.rectangular(
                height: 150 * hem,
                width: double.infinity,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
