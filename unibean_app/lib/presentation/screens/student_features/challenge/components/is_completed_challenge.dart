import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/presentation/screens/student_features/challenge/components/challenge_card.dart';

import '../../../../blocs/blocs.dart';

class IsCompletedChallenge extends StatelessWidget {
  const IsCompletedChallenge({super.key});

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
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        final challenges = state.challenge.where(
                            (c) => (c.isCompleted && c.isClaimed == false)).toList();
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
                      return Container();
                    },
                  ),
                ],
              ),
            )
          ]),
        )
      ],
    );
  }
}
