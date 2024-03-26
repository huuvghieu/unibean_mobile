import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';

import '../../../../../../data/models.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key,
      required this.fem,
      required this.hem,
      required this.ffem,
      required this.product,
      required this.onTap});

  final double fem;
  final double hem;
  final double ffem;
  final ProductModel product;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: 170 * fem,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15 * fem),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10 * fem),
                      topRight: Radius.circular(10 * fem)),
                  child: Container(
                    height: 150 * hem,
                    width: 180 * fem,
                    child: Image.network(
                      product.productImage,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 170 * fem,
                          height: 180 * hem,
                          child: Image.asset(
                            'assets/images/image-404.jpg',
                            width: 40 * fem,
                            height: 40 * hem,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 10 * fem, right: 10 * fem, top: 5 * hem),
                  child: Text(
                    product.productName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                      fontSize: 15 * ffem,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    )),
                  ),
                ),
                Container(
                  width: 150 * fem,
                 padding: EdgeInsets.only(
                      left: 10 * fem, right: 10 * fem),
                  child: Text(
                    product.categoryName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                      fontSize: 13 * ffem,
                      color: klowTextGrey,
                      fontWeight: FontWeight.normal,
                    )),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 10 * fem,
            bottom: 5 * hem,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '${formatter.format(product.price).toString()}',
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                        fontSize: 20 * ffem,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 2 * fem, top: 4 * hem, bottom: 2 * hem),
                      child: SvgPicture.asset(
                        'assets/icons/red-bean-icon.svg',
                        width: 20 * fem,
                        height: 20 * fem,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
