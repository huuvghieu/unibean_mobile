import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/data/models.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/student_features/brand_detail/components/others_infor_brand_detail.dart';

class InformationCardBrandDetail extends StatelessWidget {
  const InformationCardBrandDetail({
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
    return Positioned(
      top: 90 * hem,
      left: 25 * fem,
      right: 25*fem,
      child: Container(
        width: double.infinity,
        height: 200 * hem,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15 * fem),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Color(0x0c000000),
                  offset: Offset(0 * fem, 10 * fem),
                  blurRadius: 5 * fem)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10 * hem,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 25 * fem,
                ),

                //avatar
                ClipRRect(
                  borderRadius: BorderRadius.circular(10 * fem),
                  child: Container(
                    height: 80 * hem,
                    width: 80 * fem,
                    child: Image.network(
                      brandModel.logo,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
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

                SizedBox(
                  width: 20 * fem,
                ),

                SizedBox(
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Name
                      SizedBox(
                        width: 150 * fem,
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                brandModel.brandName,
                                // softWrap: true,
                                maxLines: 2,
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        fontSize: 16 * ffem,
                                        fontWeight: FontWeight.w800,
                                        height: 1.3625 * ffem / fem,
                                        color: Colors.black)),
                              ),
                            ),
                          ],
                        ),
                      ),
                   
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 100 * fem,
                          height: 30 * hem,
                          margin: EdgeInsets.only(top: 10 * hem),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5 * fem),
                            color: kPrimaryColor,
                          ),
                          child: Center(
                            child: Text(
                              'Theo dõi',
                              style: GoogleFonts.openSans(
                                fontSize: 14 * ffem,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                height: 1.3625 * ffem / fem,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10 * fem,
            ),
            SizedBox(
              width: 280 * fem,
              child: Divider(
                thickness: 1 * fem,
                color: const Color.fromARGB(255, 225, 223, 223),
              ),
            ),
            OthersInforBrandDetail(
              hem: hem,
              fem: fem,
              ffem: ffem,
              brandModel: brandModel,
            )
          ],
        ),
      ),
    );
  }


}
