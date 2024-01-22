import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/screens/student_features/campaign_detail/components/body.dart';

class CampaignDetailScreen extends StatelessWidget {
  static const String routeName = '/campaign-detail-student';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const CampaignDetailScreen(),
      settings: const RouteSettings(arguments: routeName),
    );
  }

  const CampaignDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background_splash.png'),
                    fit: BoxFit.cover)),
          ),
          toolbarHeight: 130 * hem,
          leading: Container(
            margin: EdgeInsets.only(left: 20 * fem),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50 * hem,
                ),
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
                Container(
                  margin: EdgeInsets.only(top: 10 * fem),
                  child: Text(
                    'Campaign Name Here',
                    style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                            fontSize: 20 * ffem,
                            fontWeight: FontWeight.w900,
                            height: 1.3625 * ffem / fem,
                            color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
          leadingWidth: double.infinity,
         
        ),
        body: Body(),
      ),
    );
  }
}
