import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/screens/student_features/profile_trans/components/activity_transaction.dart';
import 'package:unibean_app/presentation/screens/student_features/profile_trans/components/order_transaction.dart';

import 'all_transaction.dart';
import 'bonus_transaction.dart';
import 'challenge_transaction.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.studentId});
  final String studentId;
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
                        image:
                            AssetImage('assets/images/background_splash.png'),
                        fit: BoxFit.cover)),
              ),
              toolbarHeight: 60 * hem,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 35 * fem,
                ),
              ),
              centerTitle: true,
              title: Padding(
                padding: EdgeInsets.only(top: 10 * hem),
                child: Text(
                  'UniBean',
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontSize: 25 * ffem,
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
                      size: 35 * fem,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
              bottom: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                automaticIndicatorColorAdjustment: false,
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3,
                indicatorPadding: EdgeInsets.only(bottom: 1 * fem),
                labelColor: Colors.white,
                labelStyle: GoogleFonts.openSans(
                    textStyle: TextStyle(
                  fontSize: 13 * ffem,
                  fontWeight: FontWeight.w700,
                )),
                unselectedLabelColor: Colors.white60,
                unselectedLabelStyle: GoogleFonts.openSans(
                    textStyle: TextStyle(
                  fontSize: 13 * ffem,
                  fontWeight: FontWeight.w700,
                )),
                tabs: [
                  Tab(
                    text: 'Tất cả',
                  ),
                  Tab(
                    text: 'Hoạt động',
                  ),
                  Tab(
                    text: 'Đổi quà',
                  ),
                  Tab(
                    text: 'Thử thách',
                  ),
                  Tab(
                    text: 'Điểm thưởng',
                  ),
                ],
              ),
            )
          ];
        },
        body: TabBarView(
          children: [
            AllTransaction(
              hem: hem,
              fem: fem,
              ffem: ffem,
              studentId: studentId,
            ),
            ActivityTransaction(
              hem: hem,
              fem: fem,
              ffem: ffem,
              studentId: studentId,
            ),
            OrderTransaction(
              hem: hem,
              fem: fem,
              ffem: ffem,
              studentId: studentId,
            ),
            ChallengeTransaction(
              hem: hem,
              fem: fem,
              ffem: ffem,
              studentId: studentId,
            ),
            BonusTransaction(
              hem: hem,
              fem: fem,
              ffem: ffem,
              studentId: studentId,
            ),
          ],
        ));
  }
}
