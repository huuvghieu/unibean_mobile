import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/student_features/profile_products/components/body.dart';

import '../../../../data/datasource/authen_local_datasource.dart';
import '../../screens.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/profile-product';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const ProductScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;

    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/background_splash.png'),
                          fit: BoxFit.cover)),
                ),
                toolbarHeight: 50 * hem,
                centerTitle: true,
                title: Text(
                  'UniBean',
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontSize: 22 * ffem,
                          fontWeight: FontWeight.w900,
                          color: Colors.white)),
                ),
              ),
              body: Center(
                child: Lottie.asset('assets/animations/loading-screen.json'),
              ),
            ),
          );
        } else if (state is ProductsLoaded) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
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
                                        arguments: <dynamic>[studentId, false]);
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
              ),
              backgroundColor: klighGreyColor,
              extendBody: true,
              body: Body(),
            ),
          );
        }
        return Container();
      },
    );
  }
}
