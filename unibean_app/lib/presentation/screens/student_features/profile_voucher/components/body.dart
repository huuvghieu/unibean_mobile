import 'package:flutter/material.dart';

import '../../../../../data/models.dart';
import '../../voucher/components/card_voucher_new_item.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    // double heightText = 1.3625 * ffem / fem;

    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(
              height: 20 * fem,
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
                      assetName: VoucherModel.listCampaign[index].assetImage,
                      quality: 5,
                    );
                  },
                ),
              ],
            )
          ]),
        )
      ],
    );
  }
}
