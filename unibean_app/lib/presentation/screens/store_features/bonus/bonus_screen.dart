import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/domain/repositories.dart';
import 'package:unibean_app/presentation/config/constants.dart';

import '../../../../data/models.dart';
import '../../../blocs/blocs.dart';
import 'components/body.dart';

class BonusScreen extends StatelessWidget {
  static const String routeName = '/bonus-store';
  static Route route({required StoreModel storeModel}) {
    return MaterialPageRoute(
      builder: (_) => BonusScreen(
        storeModel: storeModel,
      ),
      settings: const RouteSettings(name: routeName),
    );
  }

  const BonusScreen({super.key, required this.storeModel});
  final StoreModel storeModel;

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
          centerTitle: true,
          title: Container(
            child: Text(
              'Danh sách tặng đậu',
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w900,
                      color: Colors.white)),
            ),
          ),
          toolbarHeight: 60 * hem,
          leading: Container(
            margin: EdgeInsets.only(left: 20 * fem),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 35 * fem,
              ),
            ),
          ),
          leadingWidth: 60 * fem,
        ),
        backgroundColor: klighGreyColor,
        body: BlocProvider(
          create: (context) =>
              BonusBloc(context.read<BonusRepository>())..add(LoadBonus()),
          child: Body(),
        ),
      ),
    );
  }
}
