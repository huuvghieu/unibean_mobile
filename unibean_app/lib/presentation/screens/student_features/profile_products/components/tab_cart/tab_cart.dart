import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/widgets/empty_widget.dart';

import '../../../../../blocs/blocs.dart';
import 'cart_product_card.dart';

class TabCart extends StatelessWidget {
  const TabCart({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double baseHeight = 812;
    double ffem = fem * 0.97;
    double hem = MediaQuery.of(context).size.height / baseHeight;

    return Column(
      children: [
        SizedBox(
          height: 15 * hem,
        ),
        Expanded(
          flex: 4,
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                );
              } else if (state is CartLoaded) {
                Map cart = state.cart.productQuantity(state.cart.products);
                if (state.cart.products.isEmpty) {
                  return EmptyWidget(text: 'Không có sản phẩm');
                } else {
                  return ListView.builder(
                    itemCount: cart.keys.length,
                    itemBuilder: (context, index) {
                      var listProduct = cart.keys.toList();
                      print(listProduct);
                      return Column(
                        children: [
                          CartProductCard(
                            fem: fem,
                            hem: hem,
                            ffem: ffem,
                            product: listProduct[index],
                            quantity: cart.values.elementAt(index),
                          ),
                        ],
                      );
                    },
                  );
                }
              }
              return Container();
            },
          ),
        ),
        Expanded(
            flex: 1,
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  );
                } else if (state is CartLoaded) {
                  return Container(
                    color: kbgWhiteColor,
                    padding: EdgeInsets.only(
                        left: 15 * fem,
                        right: 15 * fem,
                        top: 15 * hem,
                        bottom: 15 * hem),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tổng đậu đỏ',
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      fontSize: 20 * ffem,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                            ),
                            Row(
                              children: [
                                Text(
                                  '${formatter.format(state.cart.total)}',
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                    fontSize: 30 * ffem,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 5 * fem,
                                      top: 4 * hem,
                                      bottom: 0 * hem),
                                  child: SvgPicture.asset(
                                    'assets/icons/red-bean-icon.svg',
                                    width: 23 * fem,
                                    height: 26 * fem,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Container(
                          width: 200 * fem,
                          height: 40 * hem,
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(10 * fem)),
                          child: Center(
                            child: Text(
                              'Đổi ngay',
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      fontSize: 15 * ffem,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }
                return Container();
              },
            )),
      ],
    );
  }
}
