import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/widgets/voucher_list_card.dart';

import '../../../../../data/models.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.vouchers});
  final List<VoucherModel> vouchers;

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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: vouchers.length,
                  itemBuilder: (context, index) {
                    var voucher = vouchers[index];
                    return VoucherListCard(
                        fem: fem,
                        hem: hem,
                        ffem: ffem,
                        voucherModel: voucher,
                        onPressed: () {});
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
