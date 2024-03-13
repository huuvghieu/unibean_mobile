import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';
import 'package:unibean_app/presentation/screens/student_features/challenge/components/body.dart';
import 'package:unibean_app/presentation/widgets/app_bar_campaign.dart';

import '../../../config/constants.dart';
import '../../../widgets/card_for_unknow.dart';

class ChallengeScreen extends StatelessWidget {
  static const String routeName = '/challenge-student';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const ChallengeScreen(),
        settings: const RouteSettings(arguments: routeName));
  }

  const ChallengeScreen({super.key});

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
    return BlocBuilder<ChallengeBloc, ChallengeState>(
      builder: (context, state) {
        if (state is ChallengeLoading) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBarCampaign(hem: hem, ffem: ffem, fem: fem),
              body: Center(
                child: Lottie.asset('assets/animations/loading-screen.json'),
              ),
            ),
          );
        } else if (state is ChallengesLoaded) {
          return SafeArea(
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                backgroundColor: klighGreyColor,
                extendBody: true,
                body: Body(),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
