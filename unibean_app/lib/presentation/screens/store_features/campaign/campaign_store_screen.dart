import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';

import 'components/body.dart';

class CampaignStoreScreen extends StatelessWidget {

  const CampaignStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final roleState = context.watch<RoleAppBloc>().state;
    if (roleState is StoreRole) {
      return Body(
        storeModel: roleState.storeModel,
      );
    } else {
      return Center(
        child: Lottie.asset('assets/animations/loading-screen.json'),
      );
    }
  }
}
