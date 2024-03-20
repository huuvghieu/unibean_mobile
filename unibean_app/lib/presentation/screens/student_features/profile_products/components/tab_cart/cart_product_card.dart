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
      constraints: BoxConstraints(maxHeight: 100 * hem, minWidth: 340 * fem),
      margin: EdgeInsets.only(bottom: 5*hem),
      decoration: BoxDecoration(
          color: Colors.white,
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
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10 * fem),
                bottomLeft: Radius.circular(10 * fem)),
            child: Container(
              width: 100 * fem,
              height: 100 * hem,
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
          SizedBox(
            width: 8 * fem,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5 * hem, bottom: 5 * hem),
                child: Text(product.productName,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                      fontSize: 14 * ffem,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ))),
              ),
              Container(
                width: 150 * fem,
                child: Text(product.categoryName,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                      fontSize: 12 * ffem,
                      color: kDarkPrimaryColor,
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
                      width: 20 * fem,
                      height: 18 * fem,
                    ),
                  )
                ],
              ),
            ],
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Container(
                      padding: EdgeInsets.only(right: 15*fem,top: 5*hem),
                       child: InkWell(
                        onTap: () {
                          // context.read<CartBloc>().add(RemoveAllProduct(product));
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const Home(index: 1)));
                        },
                        child: Text(
                          'x',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.normal),
                        ),
                                           ),
                     ),
                    Container(
                      // width: 100,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              context
                                  .read<CartBloc>()
                                  .add(RemoveProduct(product: product));
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const Home(index: 1)));
                            },
                            icon: const Icon(
                              Icons.remove_circle_outline,
                              color: kPrimaryColor,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15 * fem),
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
                          IconButton(
                            onPressed: () {
                              context
                                  .read<CartBloc>()
                                  .add(AddProduct(product: product));
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const Home(index: 1)));
                            },
                            icon: const Icon(
                              Icons.add_circle,
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]);
            },
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
