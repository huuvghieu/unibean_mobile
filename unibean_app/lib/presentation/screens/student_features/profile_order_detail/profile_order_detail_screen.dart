import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/domain/repositories/student_features/student_repository.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';
import 'package:unibean_app/presentation/config/constants.dart';

import 'components/body.dart';
// import 'components/body.dart';

class OrderDetailScreen extends StatelessWidget {
  static const String routeName = '/order-detail-student';

  static Route route({required String orderId, required String studentId}) {
    return MaterialPageRoute(
        builder: (_) => OrderDetailScreen(
              orderId: orderId,
              studentId: studentId,
            ),
        settings: const RouteSettings(arguments: routeName));
  }

  const OrderDetailScreen(
      {super.key, required this.orderId, required this.studentId});
  final String studentId;
  final String orderId;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double baseHeight = 812;
    double ffem = fem * 0.97;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return BlocListener<InternetBloc, InternetState>(
      listener: (context, state) {
        if (state is Connected) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              elevation: 0,
              duration: const Duration(milliseconds: 2000),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'Đã kết nối internet',
                message: 'Đã kết nối internet!',
                contentType: ContentType.success,
              ),
            ));
        } else if (state is NotConnected) {
          showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: const Text('Không kết nối Internet'),
                content: Text('Vui lòng kết nối Internet'),
                actions: [
                  TextButton(
                      onPressed: () {
                        final stateInternet =
                            context.read<InternetBloc>().state;
                        if (stateInternet is Connected) {
                          Navigator.pop(context);
                        } else {}
                      },
                      child: const Text('Đồng ý'))
                ],
              );
            },
          );
        }
      },
      child: SafeArea(
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
                size: 30 * fem,
              ),
            ),
            toolbarHeight: 50 * hem,
            centerTitle: true,
            title: Text(
              'Chi tiết đơn hàng',
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      fontSize: 22 * ffem,
                      fontWeight: FontWeight.w900,
                      color: Colors.white)),
            ),
          ),
          body: BlocProvider(
            create: (context) => StudentBloc(
                studentRepository: context.read<StudentRepository>())
              ..add(
                  LoadOrderDetailById(studentId: studentId, orderId: orderId)),
            child: Body(),
          ),
        ),
      ),
    );
  }
}
