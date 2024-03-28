import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../../domain/repositories.dart';
import '../../../../blocs/blocs.dart';
import 'tab_scan_student.dart';
import 'tab_scan_voucher.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.id});
  final String id;
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    MobileScannerController cameraController = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
      facing: CameraFacing.back,
      torchEnabled: false,
    );
    MobileScannerController cameraController2 = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
      facing: CameraFacing.back,
      torchEnabled: false,
    );
    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            new SliverAppBar(
              pinned: true,
              floating: true,
              elevation: 0,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/images/background_splash.png'),
                        fit: BoxFit.cover)),
              ),
              toolbarHeight: 40 * hem,
              centerTitle: true,
              title: Padding(
                padding: EdgeInsets.only(top: 10 * hem),
                child: Text(
                  'UniBean',
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontSize: 22 * ffem,
                          fontWeight: FontWeight.w900,
                          color: Colors.white)),
                ),
              ),
              leading: Padding(
                padding: EdgeInsets.only(top: 10 * hem),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 30 * fem,
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(top: 10 * hem, right: 20 * fem),
                  child: IconButton(
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 25 * fem,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
              bottom: TabBar(
                automaticIndicatorColorAdjustment: false,
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3,
                indicatorPadding: EdgeInsets.only(bottom: 1 * fem),
                labelColor: Colors.white,
                labelStyle: GoogleFonts.openSans(
                    textStyle: TextStyle(
                  fontSize: 13 * ffem,
                  fontWeight: FontWeight.w700,
                )),
                unselectedLabelColor: Colors.white60,
                unselectedLabelStyle: GoogleFonts.openSans(
                    textStyle: TextStyle(
                  fontSize: 13 * ffem,
                  fontWeight: FontWeight.w700,
                )),
                tabs: [
                  Tab(
                    text: 'Quét ưu đãi',
                  ),
                  Tab(
                    text: 'Tặng đậu xanh',
                  ),
                ],
              ),
            )
          ];
        },
        body: TabBarView(
          children: [
            BlocProvider(
              create: (context) =>
                  StoreBloc(storeRepository: context.read<StoreRepository>()),
              child: TabScanVoucher(
                  cameraController: cameraController, widget: widget),
            ),

            //
            BlocProvider(
              create: (context) => StudentBloc(
                  studentRepository: context.read<StudentRepository>()),
              child: TabScanStudent(
                cameraController2: cameraController2,
                widget: widget,
              ),
            ),
          ],
        ));
  }
}
