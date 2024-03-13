import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import '../../../../domain/repositories.dart';
import '../../../blocs/blocs.dart';
import 'components/body.dart';

class ProfileTransactionHistoryScreen extends StatelessWidget {
  static const String routeName = '/profile-trans';

  static Route route({required String studentId}) {
    return MaterialPageRoute(
        builder: (_) => ProfileTransactionHistoryScreen(
              studentId: studentId,
            ),
        settings: const RouteSettings(name: routeName));
  }

  const ProfileTransactionHistoryScreen({super.key, required this.studentId});
  final String studentId;

  @override
  Widget build(BuildContext context) {
    // double baseWidth = 375;
    // double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    // double baseHeight = 812;
    // double hem = MediaQuery.of(context).size.height / baseHeight;

    return BlocProvider(
     create: (context) =>
          StudentBloc(studentRepository: context.read<StudentRepository>())
            ..add(LoadStudentTransactions(id: studentId)),
      child: SafeArea(
        child: DefaultTabController(
          length: 5,
          child: Scaffold(
            backgroundColor: klighGreyColor,
            body: Body(
              studentId: studentId,
            ),
          ),
        ),
      ),
    );
  }
}
