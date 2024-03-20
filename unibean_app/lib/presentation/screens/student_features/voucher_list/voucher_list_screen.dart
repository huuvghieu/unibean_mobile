import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/screens/screens.dart';

import '../../../../data/models.dart';
import '../../../blocs/blocs.dart';
import 'components/body.dart';

class VoucherListScreen extends StatelessWidget {
  static const String routeName = '/voucher-list-student';
  static Route route({required List<VoucherModel> voucherModels}) {
    return MaterialPageRoute(
      builder: (_) => BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationFailed)
            Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName,
                (Route<dynamic> route) => false);
        },
        child: VoucherListScreen(voucherModels: voucherModels,),
      ),
      settings: const RouteSettings(name: routeName),
    );
  }

  const VoucherListScreen({super.key, required this.voucherModels});

  final List<VoucherModel> voucherModels;

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
              'Ưu đãi',
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w900,
                      height: 1.3625 * ffem / fem,
                      color: Colors.white)),
            ),
          ),
          toolbarHeight: 80 * hem,
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
          actions: [
            GestureDetector(
              onTap: () {
                // _filterModalBottomSheet(context);
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
        body: Body(vouchers: voucherModels,),
      ),
    );
  }

  // void _filterModalBottomSheet(context) {
  //   double baseWidth = 375;
  //   double fem = MediaQuery.of(context).size.width / baseWidth;
  //   double ffem = fem * 0.97;
  //   double baseHeight = 812;
  //   double hem = MediaQuery.of(context).size.height / baseHeight;

  //   showModalBottomSheet(
  //     context: context,
  //     builder: (context) {
  //       return FilterShowdalBottom(hem: hem, fem: fem, ffem: ffem);
  //     },
  //   );
  // }
}
