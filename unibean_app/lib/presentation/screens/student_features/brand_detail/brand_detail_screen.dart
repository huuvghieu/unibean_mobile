import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unibean_app/domain/repositories.dart';
import 'package:unibean_app/presentation/config/constants.dart';
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
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
              forceMaterialTransparency: true,
              elevation: 0,
           
              toolbarHeight: 50 * hem,
              leading: Container(
                margin: EdgeInsets.only(left: 20 * fem),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 35 * fem,
                      ),
                    ),
                  ],
                ),
              ),
              leadingWidth: double.infinity,
              backgroundColor: Colors.transparent,
            ),
            backgroundColor: klighGreyColor,
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
