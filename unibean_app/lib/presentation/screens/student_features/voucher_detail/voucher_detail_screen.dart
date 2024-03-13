import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/student_features/voucher_detail/components/body.dart';

class VoucherDetailScreen extends StatelessWidget {
  static const String routeName = '/voucher-detail-student';

  static Route route({required String id}) {
    return MaterialPageRoute(
        builder: (_) =>  VoucherDetailScreen(id: id,),
        settings: const RouteSettings(arguments: routeName));
  }

  const VoucherDetailScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double baseHeight = 812;
    double ffem = fem * 0.97;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   toolbarHeight: 0 * hem,
        //   leading: InkWell(
        //     onTap: () {
        //       Navigator.pop(context);
        //     },
        //     child: Icon(
        //       Icons.arrow_back_rounded,
        //       color: Colors.white,
        //       size: 35 * fem,
        //     ),
        //   ),

        // ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          height: 80 * hem,
          elevation: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 320*fem,
                  height: 45 * hem,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10 * fem)),
                  child: Center(
                    child: Text(
                      '120 điểm',
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              fontSize: 17 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.3625 * ffem / fem,
                              color: Colors.white)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // extendBodyBehindAppBar: true,
        body: Body(id: id,),
      ),
    );
  }
}
