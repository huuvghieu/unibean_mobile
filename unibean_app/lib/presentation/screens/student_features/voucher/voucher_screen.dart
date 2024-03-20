import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';
import 'package:unibean_app/presentation/screens/student_features/voucher/components/body.dart';
import 'package:unibean_app/presentation/widgets/card_for_unknow.dart';

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
    if (roleState is Unknown) {
      return _buildUnKnown(fem, hem, ffem);
    } else if (roleState is Verified) {
      return _buildVerifiedStudent(fem, hem, ffem);
    }
    return _buildVerifiedStudent(fem, hem, ffem);
  }

  Widget _buildUnKnown(double fem, double hem, double ffem) {
    return CardForUnknow(fem: fem, hem: hem, ffem: ffem);
  }

  Widget _buildVerifiedStudent(double fem, double hem, double ffem) {
    return BlocBuilder<VoucherBloc, VoucherState>(
      builder: (context, state) {
        if (state is VouchersLoaded) {
          return Body();
        }
        return Center(
          child: Container(
              child: Lottie.asset('assets/animations/loading-screen.json')),
        );
      },
    );
  }
}
