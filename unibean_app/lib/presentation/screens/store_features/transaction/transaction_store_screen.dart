import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unibean_app/domain/repositories.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';

import 'components/body.dart';

class TransactionStoreScreen extends StatelessWidget {
  static const String routeName = '/transation-store';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => TransactionStoreScreen(),
        settings: const RouteSettings(arguments: routeName));
  }

  const TransactionStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final roleState = context.watch<RoleAppBloc>().state;
    if (roleState is StoreRole) {
      return BlocProvider(
        create: (context) =>
            StoreBloc(storeRepository: context.read<StoreRepository>())
              ..add(LoadStoreTransactions(id: roleState.storeModel.id)),
        child: Body(storeId: roleState.storeModel.id)
      );
    } else {
      return Container();
    }
  }
}
