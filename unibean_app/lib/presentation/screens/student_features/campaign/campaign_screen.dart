import 'package:flutter/material.dart';
import 'package:unibean_app/presentation/screens/student_features/campaign/components/body.dart';

class CampaignScreen extends StatelessWidget {
  static const String routeName = '/campaign-student';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const CampaignScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const CampaignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Body();
  }
}
