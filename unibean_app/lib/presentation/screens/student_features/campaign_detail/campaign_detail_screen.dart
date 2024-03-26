import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/config/constants.dart';

import '../../../../data/models.dart';
import 'components/body.dart';

class CampaignDetailScreen extends StatelessWidget {
  static const String routeName = '/campaign-detail-student';

  static Route route({required CampaignModel campaignModel}) {
    return MaterialPageRoute(
      builder: (_) => CampaignDetailScreen(
       campaignModel: campaignModel,
      ),
      settings: const RouteSettings(arguments: routeName),
    );
  }

  const CampaignDetailScreen({super.key, required this.campaignModel});

  final CampaignModel campaignModel;

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
           
              toolbarHeight: 80 * hem,
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
            body: Body(
              id: campaignModel.id,
            ),
          ),
    );
  }
}
