import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/presentation/config/constants.dart';

import '../../../../blocs/blocs.dart';
import '../../../screens.dart';
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
    final roleState = context.read<RoleAppBloc>().state;
    return Column(
      children: [
        SizedBox(
          height: 15 * hem,
        ),
        Expanded(
          flex: 8,
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                );
              } else if (state is CartLoaded) {
                if (state.cart.products.isEmpty) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 20 * hem,
                      ),
                      Container(
                        width: double.infinity,
                        margin:
                            EdgeInsets.only(left: 15 * fem, right: 15 * fem),
                        height: 220 * hem,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/empty-icon.svg',
                              width: 70 * fem,
                              colorFilter: ColorFilter.mode(
                                  kLowTextColor, BlendMode.srcIn),
                            ),
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  'Không có sản phẩm',
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  )),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10 * fem,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                );
                              },
                              child: Container(
                                  width: 180 * fem,
                                  height: 45 * hem,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: kPrimaryColor, width: 2),
                                      borderRadius:
                                          BorderRadius.circular(15 * fem)),
                                  child: Center(
                                    child: Text(
                                      'Đặt hàng ngay',
                                      style: GoogleFonts.openSans(
                                          textStyle: TextStyle(
                                              fontSize: 15 * ffem,
                                              fontWeight: FontWeight.bold,
                                              color: kPrimaryColor)),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  Map cart = state.cart.productQuantity(state.cart.products);

                  return ListView.builder(
                    itemCount: cart.keys.length,
                    itemBuilder: (context, index) {
                      var listProduct = cart.keys.toList();
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
                  if (state.cart.products.isEmpty) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/background_splash.png'),
                            fit: BoxFit.cover),
                      ),
                      padding: EdgeInsets.only(
                          left: 15 * fem,
                          right: 15 * fem,
                          top: 15 * hem,
                          bottom: 15 * hem),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Tổng đậu đỏ: ',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        fontSize: 15 * ffem,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${formatter.format(state.cart.total)}',
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                      fontSize: 20 * ffem,
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
                                      width: 20 * fem,
                                      height: 22 * fem,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          _buildButton(
                              roleState, fem, hem, ffem, context, Map(), 0)
                        ],
                      ),
                    );
                  } else {
                    Map cart = state.cart.productQuantity(state.cart.products);
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/background_splash.png'),
                            fit: BoxFit.cover),
                      ),
                      padding: EdgeInsets.only(
                          left: 15 * fem,
                          right: 15 * fem,
                          top: 15 * hem,
                          bottom: 15 * hem),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Tổng đậu đỏ: ',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        fontSize: 15 * ffem,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${formatter.format(state.cart.total)}',
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                      fontSize: 20 * ffem,
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
                                      width: 20 * fem,
                                      height: 22 * fem,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          _buildButton(roleState, fem, hem, ffem, context, cart, state.cart.total)
                        ],
                      ),
                    );
                  }
                }
                return Container();
              },
            )),
      ],
    );
  }
}

Widget _buildButton(roleState, double fem, double hem, double ffem,
    BuildContext context, cart, total) {
  if (roleState is Pending || roleState is Rejected) {
    return InkWell(
      onTap: () async {},
      child: Container(
        width: 120 * fem,
        height: 55 * hem,
        decoration: BoxDecoration(
            color: kLowTextColor,
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
      ),
    );
  } else if (roleState is Verified) {
    return InkWell(
      onTap: () async {
        final studentModel = await AuthenLocalDataSource.getStudent();
        if (cart.isEmpty) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              elevation: 0,
              duration: const Duration(milliseconds: 2000),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'Không có sản phẩm!',
                message: 'Giỏ hàng không có sản phẩm để đổi!',
                contentType: ContentType.failure,
              ),
            ));
        }else if(studentModel!.redWalletBalance < total){
   ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              elevation: 0,
              duration: const Duration(milliseconds: 2000),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'Đổi thất bại!',
                message: 'Số đậu đỏ của bạn không đủ!',
                contentType: ContentType.failure,
              ),
            ));
        } else {
          Navigator.pushNamed(
            context,
            StationScreen.routeName,
          );
        }
      },
      child: Container(
        width: 120 * fem,
        height: 55 * hem,
        decoration: BoxDecoration(
            color: klightPrimaryColor,
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
      ),
    );
  }
  return InkWell(
    onTap: () async {},
    child: Container(
      width: 220 * fem,
      height: 45 * hem,
      decoration: BoxDecoration(
          color: klighGreyColor, borderRadius: BorderRadius.circular(10 * fem)),
      child: Center(
        child: Text(
          'Đổi ngay',
          style: GoogleFonts.openSans(
              textStyle: TextStyle(
                  fontSize: 16 * ffem,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
      ),
    ),
  );
}
