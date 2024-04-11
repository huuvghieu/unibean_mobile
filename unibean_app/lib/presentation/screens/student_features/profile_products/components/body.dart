import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/presentation/screens/screens.dart';

import '../../../../blocs/blocs.dart';
import 'tab_product/tab_product.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
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
      child: NestedScrollView(
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
                toolbarHeight: 55 * hem,
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
                centerTitle: true,
                title: Text(
                  'Đổi đậu lấy quà',
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w800,
                          color: Colors.white)),
                ),
                actions: [
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is CartLoaded) {
                        if (state.cart.products.length == 0) {
                          return Padding(
                            padding: EdgeInsets.only(right: 20 * fem),
                            child: IconButton(
                              icon: Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                                size: 25 * fem,
                              ),
                              onPressed: () async {
                                final studentId =
                                    await AuthenLocalDataSource.getStudentId();
                                Navigator.pushNamed(
                                    context, ProfileCartScreen.routeName,
                                    arguments: studentId);
                              },
                            ),
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsets.only(right: 20 * fem),
                            child: Stack(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.shopping_cart,
                                    color: Colors.white,
                                    size: 25 * fem,
                                  ),
                                  onPressed: () async {
                                    final studentId =
                                        await AuthenLocalDataSource
                                            .getStudentId();
                                    Navigator.pushNamed(
                                        context, ProfileCartScreen.routeName,
                                        arguments: studentId);
                                  },
                                ),
                                Positioned(
                                  top: 5,
                                  right: 3,
                                  child: Container(
                                    width: 25,
                                    height: 15,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.red),
                                    child: Center(
                                        child: Text(
                                      '${state.cart.products.length}',
                                      style: GoogleFonts.openSans(
                                          textStyle: TextStyle(
                                              fontSize: 11 * ffem,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white)),
                                    )),
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                      }
                      return Padding(
                        padding: EdgeInsets.only(right: 20 * fem),
                        child: IconButton(
                          icon: Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: 25 * fem,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, ProfileCartScreen.routeName);
                          },
                        ),
                      );
                    },
                  ),
                ],
              )
            ];
          },
          body: TabProduct()),
    );
  }
}
