import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';

import '../../../../config/constants.dart';
import '../../../screens.dart';
import 'body.dart';
import 'qr_scanner_overlay.dart';

class TabScanStudent extends StatelessWidget {
  const TabScanStudent(
      {super.key, required this.cameraController2, required this.widget});

  final MobileScannerController cameraController2;
  final Body widget;

  @override
  Widget build(BuildContext context) {
    return BlocListener<StudentBloc, StudentState>(
      listener: (context, state) async {
        if (state is StudentByIdFailed) {
          Navigator.pushNamedAndRemoveUntil(
              context,
              FailedScanStudentScreen.routeName,
              (Route<dynamic> route) => false,
              arguments: state.error);
        } else if (state is StudentByIdLoading) {
          showDialog<String>(
              context: context,
              builder: (BuildContext context) {
                Future.delayed(Duration(seconds: 5), () {
                  Navigator.of(context).pop();
                });
                return AlertDialog(
                    content: Container(
                        width: 250,
                        height: 250,
                        child: Center(
                            child: CircularProgressIndicator(
                                color: kPrimaryColor))));
              });
        } else if (state is StudentByIdSuccess) {
              final storeModel = await AuthenLocalDataSource.getStore();

          Navigator.pushReplacementNamed(context, TransactScreen.routeName,
              arguments: <dynamic>[state.studentMode, storeModel!.brandId]);
        }
      },
      child: Stack(
        children: [
          MobileScanner(
            startDelay: true,
            overlay: Lottie.asset('assets/animations/scanning.json'),
            controller: cameraController2,
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                print('Barcode found! ${barcode.rawValue}');
                if (barcode.rawValue != null) {
                  context
                      .read<StudentBloc>()
                      .add(LoadStudentById(studentId: barcode.rawValue!));
                }
              }
            },
          ),
          Positioned.fill(
            child: Container(
              decoration: ShapeDecoration(
                shape: QrScannerOverlayShape(
                  borderColor: kPrimaryColor,
                  borderRadius: 10,
                  borderLength: 20,
                  borderWidth: 5,
                  // cutOutSize: scanArea,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
