import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/student_features/profile_products/components/body.dart';


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
