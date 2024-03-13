import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/config/constants.dart';

import 'components/body.dart';

class CampaignDetailScreen extends StatelessWidget {
  static const String routeName = '/campaign-detail-student';

  static Route route({required String id}) {
    return MaterialPageRoute(
      builder: (_) =>  CampaignDetailScreen(id: id,),
      settings: const RouteSettings(arguments: routeName),
    );
  }

  const CampaignDetailScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    // double baseWidth = 375;
    // double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    // double baseHeight = 812;
    // double hem = MediaQuery.of(context).size.height / baseHeight;

    return SafeArea(
      child: Scaffold(
        backgroundColor: klighGreyColor,
        body: Body(
          id: id,
        ),
      ),
    );
  }
}
