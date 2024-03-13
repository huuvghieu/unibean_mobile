import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unibean_app/domain/repositories.dart';
import 'package:unibean_app/presentation/screens/student_features/brand_detail/components/body.dart';

import '../../../blocs/blocs.dart';

class BrandDetailScreen extends StatelessWidget {
  static const String routeName = '/brand-detail-student';

  static Route route({required String id}) {
    return MaterialPageRoute(
      builder: (_) => BrandDetailScreen(
        id: id,
      ),
      settings: const RouteSettings(arguments: routeName),
    );
  }

  final String id;
  const BrandDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    // double baseWidth = 375;
    // double fem = MediaQuery.of(context).size.width / baseWidth;
    // // double ffem = fem * 0.97;
    // double baseHeight = 812;
    // double hem = MediaQuery.of(context).size.height / baseHeight;

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   leading: 
        //   toolbarHeight: 80 * hem,
        // ),
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: BlocProvider(
          create: (context) =>
              BrandBloc(brandRepository: context.read<BrandRepository>())
                ..add(LoadBrandById(id: id)),
          child: Body(),
        ),
      ),
    );
  }
}
