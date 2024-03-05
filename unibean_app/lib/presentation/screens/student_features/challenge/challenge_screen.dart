import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';
import 'package:unibean_app/presentation/screens/student_features/challenge/components/body.dart';
import 'package:unibean_app/presentation/widgets/app_bar_campaign.dart';

import '../../../config/constants.dart';
import '../../../widgets/card_for_unknow.dart';

class ChallengeScreen extends StatefulWidget {
  static const String routeName = '/challenge-student';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const ChallengeScreen(),
        settings: const RouteSettings(arguments: routeName));
  }

  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    final roleState = context.watch<RoleAppBloc>().state;
    return authenScreen(roleState, fem, hem, ffem, context);
  }

  @override
  void initState() {
    // tabController = TabController(length: 3, vsync: this);
    // tabController.addListener(() {
    //   if(tabController.index == 0){
    //     context.read<ChallengeBloc>().add()
    //   }
    // });
    super.initState();
  }

  Widget authenScreen(roleState, fem, hem, ffem, context) {
    if (roleState is RoleAppUnknown) {
      return _buildUnknown(fem, hem, ffem);
    } else if (roleState is RoleAppStudentVerified) {
      return _buildVerifiedStudent(fem, hem, ffem);
    }
    return _buildVerifiedStudent(fem, hem, ffem);
  }

  Widget _buildUnknown(double fem, double hem, double ffem) {
    return Scaffold(
        appBar: AppBarCampaign(hem: hem, ffem: ffem, fem: fem),
        body: Container(
            color: klighGreyColor,
            child:
                Center(child: CardForUnknow(fem: fem, hem: hem, ffem: ffem))));
  }

  Widget _buildVerifiedStudent(double fem, double hem, double ffem) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: klighGreyColor,
          appBar: AppBar(
            elevation: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background_splash.png'),
                      fit: BoxFit.cover)),
            ),
            toolbarHeight: 120 * hem,
            title: Padding(
              padding: EdgeInsets.only(left: 20 * fem, top: 20 * hem),
              child: Text(
                'UNI Student Bean',
                style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                        fontSize: 30 * ffem,
                        fontWeight: FontWeight.w900,
                        height: 1.3625 * ffem / fem,
                        color: Colors.white)),
              ),
            ),
            actions: [
              // SvgPicture.asset('assets/icons/notification-icon.svg')
              Padding(
                padding: EdgeInsets.only(right: 20 * fem),
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
              // controller: tabController,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3,
              indicatorPadding: EdgeInsets.only(bottom: 1 * fem),
              labelColor: Colors.white,
              labelStyle: GoogleFonts.nunito(
                  textStyle: TextStyle(
                fontSize: 14 * ffem,
                height: 1.3625 * ffem / fem,
                fontWeight: FontWeight.w700,
              )),
              unselectedLabelColor: Colors.white60,
              unselectedLabelStyle: GoogleFonts.nunito(
                  textStyle: TextStyle(
                fontSize: 14 * ffem,
                height: 1.3625 * ffem / fem,
                fontWeight: FontWeight.w700,
              )),
              onTap: (index) {},
              tabs: [
                Tab(
                  text: 'Đang thực hiện',
                ),
                Tab(text: 'Nhận thưởng'),
                Tab(text: 'Đã hoàn thành'),
              ],
            ),
          ),
          extendBody: true,
          body: BlocBuilder<ChallengeBloc, ChallengeState>(
            builder: (context, state) {
              if (state is ChallengeLoading) {
                return Center(
                  child: Lottie.asset('assets/animations/loading-screen.json'),
                );
              } else if (state is ChallengesLoaded) {
                return Body();
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
