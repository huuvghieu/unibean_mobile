import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:unibean_app/presentation/blocs/cart/cart_bloc.dart';
import 'package:unibean_app/presentation/config/constants.dart';

import '../../../../../../data/models.dart';
import '../../../../../blocs/blocs.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
    required this.fem,
    required this.hem,
    required this.ffem,
    required this.product,
    required this.quantity,
    // required this.quantity,
  });

  final double fem;
  final double ffem;
  final double hem;
  final ProductDetailModel product;
  final int quantity;
  // final int quantity;

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<CartBloc>(context).add(LoadCartEvent());
    return Container(
      constraints: BoxConstraints(maxHeight: 120 * hem),
      margin: EdgeInsets.only(bottom: 5 * hem, left: 10 * fem, right: 10 * fem),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10 * fem),
          border: Border.all(color: klighGreyColor),
          boxShadow: [
            BoxShadow(
                color: Color(0x0c000000),
                offset: Offset(0 * fem, 0 * fem),
                blurRadius: 5 * fem)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(5 * fem),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.productImages[0],
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/image-404.jpg',
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            width: 8 * fem,
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5 * hem),
                  child: Text(product.productName,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                        fontSize: 14 * ffem,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ))),
                ),
                Container(
                  child: Text(product.categoryName,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                        fontSize: 13 * ffem,
                        color: klowTextGrey,
                        fontWeight: FontWeight.normal,
                      ))),
                ),
                Row(
                  children: [
                    Text(
                      '${formatter.format(product.price).toString()}',
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                        fontSize: 15 * ffem,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                    SizedBox(
                      width: 5 * fem,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4 * hem, bottom: 2 * hem),
                      child: SvgPicture.asset(
                        'assets/icons/red-bean-icon.svg',
                        width: 18 * fem,
                        height: 16 * fem,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10 * hem,
                ),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return Container(
                      width: 100,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 20 * fem,
                            height: 20 * fem,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: kPrimaryColor)),
                            child: FloatingActionButton(
                                heroTag: 'remove',
                                elevation: 0,
                                backgroundColor: Colors.white,
                                foregroundColor: kPrimaryColor,
                                child: const Icon(
                                  Icons.remove,
                                  size: 15,
                                ),
                                onPressed: () {
                                  context
                                      .read<CartBloc>()
                                      .add(RemoveProduct(product: product));
                                }),
                          ),
                          SizedBox(
                            width: 5 * fem,
                          ),
                          Container(
                            width: 20 * fem,
                            child: Center(
                              child: Text(
                                '${quantity}',
                                style: TextStyle(
                                  fontFamily: 'Solway',
                                  fontSize: 13 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2 * ffem / fem,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5 * fem,
                          ),
                          Container(
                            width: 20 * fem,
                            height: 20 * fem,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: kPrimaryColor)),
                            child: FloatingActionButton(
                                heroTag: 'add',
                                elevation: 0,
                                foregroundColor: Colors.white,
                                backgroundColor: kPrimaryColor,
                                child: const Icon(
                                  Icons.add,
                                  size: 15,
                                ),
                                onPressed: () {
                                  context
                                      .read<CartBloc>()
                                      .add(AddProduct(product: product));
                                }),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2*hem,
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      ),
                  child: FloatingActionButton(
                    onPressed: (){},
                      heroTag: 'add',
                      elevation: 0,
                      backgroundColor: Colors.white,
                      foregroundColor: kPrimaryColor,
                      child: Center(child: Text('x',style: TextStyle(fontSize: 15),))
                      ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  String changeCurrency(double price) {
    return price.isNaN
        ? "0"
        : NumberFormat.currency(locale: 'vi').format(price);
  }
}
