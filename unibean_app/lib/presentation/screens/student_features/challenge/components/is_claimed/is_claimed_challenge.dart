import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/presentation/screens/student_features/challenge/components/challenge_card.dart';
import 'package:unibean_app/presentation/widgets/empty_widget.dart';

import '../../../../../blocs/blocs.dart';

class IsClaimedChallenge extends StatelessWidget {
  const IsClaimedChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ChallengeBloc>().add(LoadChallenge());
      },
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15 * hem,
                    ),
                    BlocBuilder<ChallengeBloc, ChallengeState>(
                      builder: (context, state) {
                        if (state is ChallengeLoading) {
                          return Center(
                            child: Lottie.asset(
                                'assets/animations/loading-screen.dart'),
                          );
                        } else if (state is ChallengesLoaded) {
                          final challenges = state.challenge
                              .where((c) => (c.isCompleted && c.isClaimed))
                              .toList();
                          if (challenges.isEmpty) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 150 * hem,
                                ),
                                EmptyWidget(
                                    text: "Không có nhiệm vụ đã hoàn thành!"),
                              ],
                            );
                          } else {
                            return Column(
                              children: [
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: challenges.length,
                                  itemBuilder: (context, index) {
                                    return ChallengeCard(
                                      fem: fem,
                                      hem: hem,
                                      ffem: ffem,
                                      challengeModel: challenges[index],
                                    );
                                  },
                                ),
                              ],
                            );
                          }
                        }
                        return Container();
                      },
                    ),
                  ],
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
