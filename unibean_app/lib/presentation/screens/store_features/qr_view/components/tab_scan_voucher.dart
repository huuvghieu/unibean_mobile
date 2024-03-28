import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../blocs/blocs.dart';
import '../../../../config/constants.dart';
import '../../../screens.dart';
import 'body.dart';
import 'qr_scanner_overlay.dart';

class TabScanVoucher extends StatelessWidget {
  const TabScanVoucher({
    super.key,
    required this.cameraController,
    required this.widget,
  });

  final MobileScannerController cameraController;
  final Body widget;

  @override
  Widget build(BuildContext context) {
    return BlocListener<StoreBloc, StoreState>(
      listener: (context, state) {
        if (state is ScanVoucherFailed) {
          Navigator.pushNamedAndRemoveUntil(
              context,
              FailedScanVoucherScreen.routeName,
              (Route<dynamic> route) => false,
              arguments: state.error);
        } else if (state is ScanVoucherLoading) {
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
        } else if (state is ScanVoucherSuccess) {
          Navigator.pushNamedAndRemoveUntil(
              context,
              SuccessScanVoucherScreen.routeName,
              (Route<dynamic> route) => false,
              arguments: state.result);
        }
      },
      child: Stack(
        children: [
          MobileScanner(
            startDelay: true,
            overlay: Lottie.asset('assets/animations/scanning.json'),
            controller: cameraController,
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              String? value = null;
              for (final barcode in barcodes) {
                print('Barcode found! ${barcode.rawValue}');
                value = barcode.rawValue;
                if (value != null) {
                  break;
                }
              }
              if (value != null) {
                context.read<StoreBloc>().add(ScanVoucherCode(
                    storeId: widget.id,
                    voucherCode: value,
                    description: 'string',
                    state: true));
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
