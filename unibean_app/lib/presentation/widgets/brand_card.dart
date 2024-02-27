import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/data/models.dart';
import 'package:unibean_app/presentation/screens/student_features/brand_detail/brand_detail_screen.dart';

class BrandCard extends StatelessWidget {
  const BrandCard(
      {super.key,
      required this.fem,
      required this.hem,
      required this.ffem,
      required this.brandModel});

  final double fem;
  final double hem;
  final double ffem;
  final BrandModel brandModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, BrandDetailScreen.routeName);
      },
      child: Container(
        margin: EdgeInsets.only(left: 5 * fem, right: 5 * fem),
        child: Column(
          children: [
            Container(
              width: 80 * fem,
              height: 80 * hem,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10 * fem),
                  image: DecorationImage(
                      image: NetworkImage(brandModel.logo),
                      fit: BoxFit.cover
                      )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5 * hem),
              child: Text(
                brandModel.brandName,
                style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                  fontSize: 13 * ffem,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
