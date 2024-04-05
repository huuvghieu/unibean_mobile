import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../blocs/blocs.dart';
import '../../../../config/constants.dart';
import '../../../../widgets/shimmer_widget.dart';
import 'transaction_card.dart';

class ChallengeTransaction extends StatefulWidget {
  const ChallengeTransaction({
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
  State<ChallengeTransaction> createState() => _ChallengeTransactionState();
}

class _ChallengeTransactionState extends State<ChallengeTransaction> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      context
          .read<StudentBloc>()
          .add(LoadMoreChallengeTransactions(scrollController, typeIds: 3));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            Column(
              children: [
                SizedBox(
                  height: 25 * widget.hem,
                ),
                BlocBuilder<StudentBloc, StudentState>(
                  builder: (context, state) {
                    if (state is StudentTransactionLoading) {
                      return buildTransactionShimmer(5, widget.fem, widget.hem);
                    } else if (state is StudentTransactionsLoaded) {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.hasReachedMax
                            ? state.transactions.length
                            : state.transactions.length + 1,
                        itemBuilder: (context, index) {
                          if (index >= state.transactions.length) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: kPrimaryColor,
                              ),
                            );
                          } else {
                            return TransactionCard(
                              fem: widget.fem,
                              hem: widget.hem,
                              ffem: widget.ffem,
                              transaction: state.transactions[index],
                            );
                          }
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

Widget buildTransactionShimmer(count, double fem, double hem) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: count,
        itemBuilder: (context, index) {
          return Container(
            margin:
                EdgeInsets.only(top: 15 * hem, left: 10 * fem, right: 10 * fem),
            padding: EdgeInsets.only(left: 10 * fem),
            constraints:
                BoxConstraints(maxHeight: 100 * hem, minWidth: 340 * fem),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15 * fem),
                color: Colors.white,
                border: Border.all(color: klighGreyColor),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x0c000000),
                      offset: Offset(0 * fem, 0 * fem),
                      blurRadius: 5 * fem)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ShimmerWidget.rectangular(
                      height: 15 * hem,
                      width: 280 * fem,
                    ),
                    ShimmerWidget.rectangular(
                      height: 15 * hem,
                      width: 200 * fem,
                    ),
                    ShimmerWidget.rectangular(
                      height: 15 * hem,
                      width: 100 * fem,
                    ),
                  ],
                ),
                SizedBox(
                  width: 10 * fem,
                ),
              ],
            ),
          );
        },
      ),
    ],
  );
}
