import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';

import '../../voucher/components/voucher_list_card.dart';

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
            BlocBuilder<VoucherBloc, VoucherState>(
              builder: (context, state) {
                if (state is VouchersLoaded) {
                  return Column(
                    children: [
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.vouchers.length,
                        itemBuilder: (context, index) {
                          return VoucherListCard(
                            fem: fem,
                            hem: hem,
                            ffem: ffem,
                            voucherModel: state.vouchers[index],
                            onPressed: () {
                              
                            },
                          );
                        },
                      ),
                    ],
                  );
                }
                return Center(
                    child: Lottie.asset('assets/animations/loading-screen.json',
                        width: 50 * fem, height: 50 * hem));
              },
            )
          ]),
        )
      ],
    );
  }
}
