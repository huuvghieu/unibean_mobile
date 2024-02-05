import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/screens/student_features/voucher/components/card_voucher_hot_item.dart';
import 'package:unibean_app/presentation/screens/student_features/voucher/components/card_voucher_new_item.dart';
import 'package:unibean_app/presentation/screens/student_features/voucher/search_bar_custom.dart';

import '../../../../config/constants.dart';
import '../../campaign/components/brand_banner_item.dart';
import 'package:unibean_app/data/models.dart';

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
                  height: 20 * hem,
                ),
                SearchBarCustom(),
                SizedBox(
                  height: 20 * hem,
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
                Container(
                    margin: EdgeInsets.only(left: 5 * fem),
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
                SizedBox(
                  height: 10 * hem,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10 * fem),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Gợi ý cho bạn',
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
                  height: 10 * fem,
                ),
                SizedBox(
                    height: 260 * hem,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: VoucherModel.listCampaign.length,
                      itemBuilder: (context, index) {
                        return CardVoucherHotItem(
                          fem: fem,
                          hem: hem,
                          ffem: ffem,
                          nameVoucher: VoucherModel.listCampaign[index].name,
                          rate: '5',
                          price: 120,
                          assetName:
                              VoucherModel.listCampaign[index].assetImage,
                        );
                      },
                    )),
                SizedBox(
                  height: 15 * hem,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10 * fem),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ưu đãi mới',
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
                Column(
                  children: [
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: VoucherModel.listCampaign.length,
                      itemBuilder: (context, index) {
                        return CardVoucherNewItem(
                            fem: fem,
                            hem: hem,
                            ffem: ffem,
                            name: VoucherModel.listCampaign[index].name,
                            assetName:
                                VoucherModel.listCampaign[index].assetImage,
                            quality: 5,);
                      },
                    ),
                  ],
                )
              ],
            )
          ]),
        )
      ],
    );
  }
}
