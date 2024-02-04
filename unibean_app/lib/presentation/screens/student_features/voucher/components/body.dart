import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/data/models/brand_model.dart';
import 'package:unibean_app/presentation/screens/student_features/voucher/search_bar_custom.dart';

import '../../../../config/constants.dart';
import '../../campaign/components/brand_banner_item.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;

    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20 * hem),
                  child: Center(
                    child: Text(
                      'Xin chào, Vương Hữu Hiếu!',
                      style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 21 * ffem,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Tham gia các hoạt động để tích lũy ưu đãi',
                    style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 12 * ffem,
                            fontWeight: FontWeight.normal)),
                  ),
                ),
                SizedBox(
                  height: 20*hem,
                ),
                SearchBarCustom(),
                SizedBox(
                  height: 20*hem,
                ),
                                Container(
                  margin: EdgeInsets.only(left: 10 * fem),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Thương hiệu',
                        style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                          fontSize: 18 * ffem,
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                        )),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 5 * hem, right: 10 * fem),
                          child: Text(
                            'Xem thêm',
                            style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 12 * ffem,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15 * hem,
                ),
                SizedBox(
                    height: 120 * hem,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Brand.listBrand.length,
                      itemBuilder: (context, index) {
                        return BrandBannerItem(
                            fem: fem,
                            hem: hem,
                            ffem: ffem,
                            heightText: 1.3625,
                            index: index);
                      },
                    )),
              ],
            )
          ]),
        )
      ],
    );
  }
}
