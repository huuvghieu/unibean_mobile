import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/domain/repositories/student_features/student_repository.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';
import 'package:unibean_app/presentation/screens/student_features/voucher/components/body.dart';
import 'package:unibean_app/presentation/widgets/card_for_unverified.dart';

import '../../../config/constants.dart';
import '../../../widgets/app_bar_campaign.dart';

class VoucherScreen extends StatelessWidget {
  static const String routeName = '/voucher-student';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const VoucherScreen(),
        settings: const RouteSettings(arguments: routeName));
  }

  const VoucherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    final roleState = context.watch<RoleAppBloc>().state;

    return RefreshIndicator(
        onRefresh: () async {
          context.read<VoucherBloc>().add(LoadVouchers());
        },
        child: authenScreen(roleState, fem, hem, ffem, context));
  }

  Widget authenScreen(roleState, fem, hem, ffem, context) {
    if (roleState is Unverified) {
      return _buildUnverified(fem, hem, ffem);
    }
    return BlocProvider(
      create: (context) =>
          StudentBloc(studentRepository: context.read<StudentRepository>())
            ..add(LoadStudentVouchers(id: roleState.studentModel.id)),
      child: _buildVerifiedStudent(fem, hem, ffem),
    );
  }

  Widget _buildUnverified(double fem, double hem, double ffem) {
    return Scaffold(
        appBar: AppBarCampaign(hem: hem, ffem: ffem, fem: fem),
        body: Container(
            color: klighGreyColor,
            child: Center(
                child: CardForUnVerified(fem: fem, hem: hem, ffem: ffem))));
  }

  Widget _buildVerifiedStudent(double fem, double hem, double ffem) {
    return BlocBuilder<StudentBloc, StudentState>(
      builder: (context, state) {
        if (state is StudentVouchersLoaded) {
          return Body();
        } else if (state is StudentVoucherLoading) {
          return Center(
            child: Container(
                child: Lottie.asset('assets/animations/loading-screen.json')),
          );
        }
        return Container();
      },
    );
  }
}
