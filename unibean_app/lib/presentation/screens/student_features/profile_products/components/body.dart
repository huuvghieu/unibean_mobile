import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/blocs.dart';
import 'tab_product/tab_product.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {

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
        child: TabProduct());
  }
}
