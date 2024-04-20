import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';

import '../../../../../../data/models.dart';
import '../../../../../widgets/shimmer_widget.dart';

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
              borderRadius: BorderRadius.circular(10 * fem),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF757575).withOpacity(0.3),
                  blurRadius: 10.0, // soften the shadow
                  spreadRadius: 1.0, //extend the shadow
                  offset: const Offset(
                    5.0, // Move to right 5  horizontally
                    5.0, // Move to bottom 5 Vertically
                  ),
                )
              ],
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
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return ShimmerWidget.rectangular(height: 150 * fem);
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 150 * hem,
                          width: 180 * fem,
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
                      fontSize: 14 * ffem,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    )),
                  ),
                ),
                Container(
                  width: 150 * fem,
                  padding: EdgeInsets.only(left: 10 * fem, right: 10 * fem),
                  child: Text(
                    product.categoryName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                      fontSize: 12 * ffem,
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
            bottom: 4 * hem,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '${formatter.format(product.price).toString()}',
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                        fontSize: 16 * ffem,
                        color: const Color.fromARGB(255, 238, 98, 88),
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 2 * fem, top: 4 * hem, bottom: 2 * hem),
                      child: SvgPicture.asset(
                        'assets/icons/red-bean-icon.svg',
                        width: 17 * fem,
                        height: 17 * fem,
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
