import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/presentation/widgets/empty_widget.dart';

import '../../../../../blocs/blocs.dart';
import '../challenge_card.dart';

class InProcessChallenge extends StatelessWidget {
  const InProcessChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return BlocListener<ChallengeBloc, ChallengeState>(
      listener: (context, state) {
        if (state is ChallengesLoaded) {
          if (state.isClaimed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  'Nhận thành công',
                  style: GoogleFonts.openSans(
                    fontSize: 16 * ffem,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )));
          }
        }
      },
      child: RefreshIndicator(
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
                    children: [
                      BlocBuilder<ChallengeBloc, ChallengeState>(
                        builder: (context, state) {
                          if (state is ChallengeLoading) {
                            return Center(
                              child: Lottie.asset(
                                  'assets/animations/loading-screen.dart'),
                            );
                          } else if (state is ChallengesLoaded) {
                            if (state.challenge.isEmpty) {
                              return EmptyWidget(text: 'Không có thử thách');
                            } else {
                              state.challenge
                                  .sort((a, b) => b.isCompleted ? 1 : -1);
                              state.challenge
                                  .sort((a, b) => a.isClaimed ? 1 : -1);
                              print(state.challenge);
                              return ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: state.challenge.length,
                                itemBuilder: (context, index) {
                                  return ChallengeCard(
                                    fem: fem,
                                    hem: hem,
                                    ffem: ffem,
                                    challengeModel: state.challenge[index],
                                  );
                                },
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
      ),
    );
  }
}
