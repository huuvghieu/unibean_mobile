import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';
import 'in_process/in_process_challenge.dart';
import 'is_claimed/is_claimed_challenge.dart';
import 'is_completed/is_completed_challenge.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          new SliverAppBar(
            pinned: true,
            floating: true,
            elevation: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background_splash.png'),
                      fit: BoxFit.cover)),
            ),
            toolbarHeight: 40 * hem,
            centerTitle: true,
            title: Padding(
              padding: EdgeInsets.only(top: 10 * hem),
              child: Text(
                'UniBean',
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        fontSize: 22 * ffem,
                        fontWeight: FontWeight.w900,
                        color: Colors.white)),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(top: 10 * hem, right: 20 * fem),
                child: IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 25 * fem,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
            bottom: TabBar(
              // controller: tabController,

              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3,
              // indicatorPadding: EdgeInsets.only(bottom: 1 * fem),
              labelColor: Colors.white,
              labelStyle: GoogleFonts.openSans(
                  textStyle: TextStyle(
                fontSize: 12 * ffem,
                height: 1.3625 * ffem / fem,
                fontWeight: FontWeight.w700,
              )),
              unselectedLabelColor: Colors.white60,
              unselectedLabelStyle: GoogleFonts.openSans(
                  textStyle: TextStyle(
                fontSize: 12 * ffem,
                fontWeight: FontWeight.w700,
              )),
              tabs: [
                Tab(
                  text: 'Đang thực hiện',
                ),
                BlocBuilder<ChallengeBloc, ChallengeState>(
                  builder: (context, state) {
                    if (state is ChallengesLoaded) {
                      final challenges = state.challenge
                          .where((c) => (c.isCompleted && !c.isClaimed))
                          .toList();
                      if (challenges.isNotEmpty) {
                        return Stack(
                          children: [
                            Tab(text: 'Nhận thưởng'),
                            Positioned(
                              top: 10,
                              right: 0,
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            )
                          ],
                        );
                      } else {
                        return Tab(text: 'Nhận thưởng');
                      }
                    }
                    return Tab(text: 'Nhận thưởng');
                  },
                ),
                Tab(text: 'Đã hoàn thành'),
              ],
            ),
          )
        ];
      },
      body: TabBarView(
        children: [
          //In process Challenge
          InProcessChallenge(),

          //complete Challenge
          IsCompletedChallenge(),

          //completed Challenge
          IsClaimedChallenge()
        ],
      ),
    );
  }
}
