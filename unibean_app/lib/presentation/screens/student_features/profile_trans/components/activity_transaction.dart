import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../blocs/blocs.dart';
import 'transaction_card.dart';

class ActivityTransaction extends StatelessWidget {
  const ActivityTransaction({
    super.key,
    required this.hem,
    required this.fem,
    required this.ffem,
    required this.studentId,
  });

  final double hem;
  final double fem;
  final double ffem;
  final String studentId;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            Column(
              children: [
                SizedBox(
                  height: 25 * hem,
                ),
                BlocBuilder<StudentBloc, StudentState>(
                  builder: (context, state) {
                    if (state is StudentTransactionLoading) {
                      return Center(
                        child: Lottie.asset(
                            'assets/animations/loading-screen.json'),
                      );
                    } else if (state is StudentTransactionsLoaded) {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.transactions.length,
                        itemBuilder: (context, index) {
                          var transaction = state.transactions[index];
                          return TransactionCard(
                            fem: fem,
                            hem: hem,
                            ffem: ffem,
                            transaction: transaction,
                          );
                        },
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ]),
        )
      ],
    );
  }
}
