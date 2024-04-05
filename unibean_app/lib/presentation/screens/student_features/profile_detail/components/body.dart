import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:unibean_app/domain/repositories/student_features/student_repository.dart';

import '../../../../../data/models.dart';
import '../../../../blocs/blocs.dart';
import 'information_card_profile.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.studentModel});

  final StudentModel studentModel;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              BlocProvider(
                create: (context) => StudentBloc(
                    studentRepository: context.read<StudentRepository>())
                  ..add(LoadStudentById(studentId: studentModel.id)),
                child: InformationCardProfile(
                    hem: hem, fem: fem, ffem: ffem, studentModel: studentModel),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Mã QR của bạn',
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            fontSize: 13 * ffem,
                            fontWeight: FontWeight.normal,
                            color: Colors.black)),
                  ),
                  Icon(
                    Icons.arrow_drop_down_sharp,
                    size: 30,
                  )
                ],
              ),
              SizedBox(
                height: 5 * hem,
              ),
              Container(
                // color: Colors.white,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image:
                            AssetImage('assets/images/background_splash.png'),
                        fit: BoxFit.cover)),
                padding: EdgeInsets.all(20 * fem),

                width: 300 * fem,
                height: 300 * hem,
                child: QrImageView(
                  data: studentModel.id,
                  padding: EdgeInsets.all(20 * fem),
                  version: QrVersions.auto,
                  backgroundColor: Colors.white,
                  eyeStyle: QrEyeStyle(
                    color: Colors.black,
                    eyeShape: QrEyeShape.square,
                  ),
                  dataModuleStyle: QrDataModuleStyle(
                    color: Colors.black,
                    dataModuleShape: QrDataModuleShape.square,
                  ),
                ),
              )
            ],
          )
        ]))
      ],
    );
  }
}
