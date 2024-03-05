import 'package:flutter/material.dart';
import 'package:unibean_app/data/models.dart';
import 'package:unibean_app/presentation/screens/student_features/brand_detail/components/body.dart';

class BrandDetailScreen extends StatelessWidget {
  static const String routeName = '/brand-detail-student';

  static Route route({required BrandModel brandModel}) {
    return MaterialPageRoute(
      builder: (_) =>  BrandDetailScreen(brandModel: brandModel,),
      settings: const RouteSettings(arguments: routeName),
    );
  }

  final BrandModel brandModel;
  const BrandDetailScreen({super.key, required this.brandModel});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.only(left: 25 * fem),
              child: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 35 * fem,
              ),
            ),
          ),
          toolbarHeight: 160 * hem,
        ),
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Body(brandModel: brandModel,),
      ),
    );
  }
}
