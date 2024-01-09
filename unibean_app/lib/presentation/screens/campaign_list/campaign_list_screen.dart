import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/screens/campaign_list/components/body.dart';
import 'package:unibean_app/presentation/screens/campaign_list/components/filter_showdal_bottom.dart';

class CampaignListScreen extends StatelessWidget {
  static const String routeName = '/campaign-list';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const CampaignListScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const CampaignListScreen({super.key});

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
                    'Có gì hôm nay?',
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
          leadingWidth: 200 * fem,
          actions: [
            InkWell(
              onTap: () {
                _filterModalBottomSheet(context);
              },
              child: Container(
                margin: EdgeInsets.only(right: 20 * fem),
                width: 25 * fem,
                height: 25 * fem,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/filter-icon.png'),
                  fit: BoxFit.cover,
                )),
              ),
            )
          ],
        ),
        body: Body(),
      ),
    );
  }

  void _filterModalBottomSheet(context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return FilterShowdalBottom(hem: hem, fem: fem, ffem: ffem);
      },
    );
  }
}


