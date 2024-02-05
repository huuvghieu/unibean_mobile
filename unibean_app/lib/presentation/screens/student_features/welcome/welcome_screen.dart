import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unibean_app/presentation/screens/student_features/welcome/components/body.dart';

import '../../../blocs/blocs.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = '/welcome';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const WelcomeScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RoleAppBloc, RoleAppState>(
      listener: (context, state) {
        if (state is RoleAppStudentVerified ||
            state is RoleAppStudentUnverified) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/landing-screen',(Route<dynamic> route) => false);
            }
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        body: const Body(),
      ),
    );
  }
}
