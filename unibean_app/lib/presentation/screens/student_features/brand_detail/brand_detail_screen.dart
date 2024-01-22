import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/screens/student_features/brand_detail/components/body.dart';

class BrandDetailScreen extends StatelessWidget {
  static const String routeName = '/brand-detail-student';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const BrandDetailScreen(),
      settings: const RouteSettings(arguments: routeName),
    );
  }

  const BrandDetailScreen({super.key});

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
              padding: EdgeInsets.only(left: 25*fem),
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
        body: Body(),
      ),
    );
  }
}
