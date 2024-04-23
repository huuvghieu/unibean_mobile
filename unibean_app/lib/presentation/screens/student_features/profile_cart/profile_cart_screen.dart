import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/domain/repositories.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/student_features/profile_cart/components/tab_cart.dart';

class ProfileCartScreen extends StatelessWidget {
  static const String routeName = '/profile-card-student';

  static Route route({required String studentId, required bool fromProductDetail}) {
    return MaterialPageRoute(
        builder: (_) => ProfileCartScreen(
              studentId: studentId,
              fromProductDetail: fromProductDetail,
            ),
        settings: const RouteSettings(arguments: routeName));
  }

  const ProfileCartScreen({super.key, required this.studentId, required this.fromProductDetail});
  final String studentId;
  final bool fromProductDetail;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double baseHeight = 812;
    double ffem = fem * 0.97;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return SafeArea(
      child: Scaffold(
          backgroundColor: klighGreyColor,
          appBar: AppBar(
            elevation: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background_splash.png'),
                      fit: BoxFit.cover)),
            ),
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 25 * fem,
              ),
            ),
            toolbarHeight: 50 * hem,
            centerTitle: true,
            title: Text(
              'Giỏ hàng',
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      fontSize: 18 * ffem,
                      fontWeight: FontWeight.w900,
                      height: 1.3625 * ffem / fem,
                      color: Colors.white)),
            ),
          ),
          body: BlocProvider(
            create: (context) => StudentBloc(
                studentRepository: context.read<StudentRepository>())
              ..add(LoadStudentById(studentId: studentId)),
            child: TabCart(fromProductDetail: fromProductDetail,),
          )),
    );
  }
}
