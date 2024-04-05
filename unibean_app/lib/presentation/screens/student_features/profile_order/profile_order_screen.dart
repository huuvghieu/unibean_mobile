import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import '../../../../domain/repositories.dart';
import '../../../blocs/blocs.dart';
import 'components/body.dart';

class ProfileOrderScreen extends StatelessWidget {
  static const String routeName = '/profile-order';

  static Route route({required String id}) {
    return MaterialPageRoute(
        builder: (_) => ProfileOrderScreen(
              studentId: id,
            ),
        settings: const RouteSettings(name: routeName));
  }

  const ProfileOrderScreen({super.key, required this.studentId});
  final String studentId;

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
            toolbarHeight: 50 * hem,
            title: Container(
              child: Text(
                'Đơn hàng của bạn',
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w900,
                        height: 1.3625 * ffem / fem,
                        color: Colors.white)),
              ),
            ),
            centerTitle: true,
            leading: Container(
              margin: EdgeInsets.only(left: 20 * fem),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 25 * fem,
                ),
              ),
            ),
            leadingWidth: 50 * fem,
          ),
          backgroundColor: klighGreyColor,
          body: BlocProvider(
               create: (context) =>
          StudentBloc(studentRepository: context.read<StudentRepository>())
            ..add(LoadStudentOrders(id: studentId)),
            child: Body(id: studentId),
          )),
    );
  }
}
