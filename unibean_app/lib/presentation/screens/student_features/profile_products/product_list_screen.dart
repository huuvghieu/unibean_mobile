import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/domain/repositories.dart';
import 'package:unibean_app/presentation/blocs/product/product_bloc.dart';
import 'package:unibean_app/presentation/config/constants.dart';

import '../../../blocs/blocs.dart';
import '../../screens.dart';
import 'components/tab_product/product_card.dart';

class ProductListScreen extends StatelessWidget {
  static const String routeName = '/product-list-student';

  static Route route({required String search}) {
    return MaterialPageRoute(
        builder: (_) => ProductListScreen(
              search: search,
            ),
        settings: const RouteSettings(arguments: routeName));
  }

  const ProductListScreen({super.key, required this.search});
  final String search;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double baseHeight = 812;
    double ffem = fem * 0.97;
    double hem = MediaQuery.of(context).size.height / baseHeight;
    return BlocProvider(
      create: (context) =>
          ProductBloc(productRepository: context.read<ProductRepository>())
            ..add(LoadProducts(search: search)),
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
                size: 25 * fem,
              ),
            ),
            toolbarHeight: 50 * hem,
            centerTitle: true,
            title: Text(
              'Kết quả tìm kiếm',
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      fontSize: 18 * ffem,
                      fontWeight: FontWeight.w900,
                      height: 1.3625 * ffem / fem,
                      color: Colors.white)),
            ),
            actions: [
              // SvgPicture.asset('assets/icons/notification-icon.svg')
              Padding(
                padding: EdgeInsets.only(right: 20 * fem),
                child: IconButton(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 25 * fem,
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context,
                        '/landing-screen', (Route<dynamic> route) => false);
                  },
                ),
              ),
            ],
          ),
          body: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return buildVoucherShimmer(3, fem, hem);
              } else if (state is ProductsLoaded) {
                if (state.products.isEmpty) {
                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(
                        left: 15 * fem, right: 15 * fem, top: 20),
                    height: 220 * hem,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/empty.svg',
                          width: 60 * fem,
                          colorFilter:
                              ColorFilter.mode(kLowTextColor, BlendMode.srcIn),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              'Không tìm thấy',
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildListDelegate([
                          SizedBox(
                            height: 20 * hem,
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(
                                left: 10 * fem),
                            child: GridView.builder(
                              // controller:
                              //     context.read<BrandBloc>().scrollController,
                              primary: false,

                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 15,
                                childAspectRatio: 0.75,
                              ),
                              shrinkWrap: true,
                              itemCount: state.products.length,
                              itemBuilder: (context, index) {
                                return ProductCard(
                                  fem: fem,
                                  hem: hem,
                                  ffem: ffem,
                                  product: state.products[index],
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, ProductDetailScreen.routeName,
                                        arguments: state.products[index].id);
                                  },
                                );
                              },
                            ),
                          ),
                        ]),
                      )
                    ],
                  );
                }
              }
              return buildProductShimmer(3, fem, hem);
            },
          ),
        ),
      ),
    );
  }
}

Widget buildProductShimmer(count, double fem, double hem) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        width: 170 * fem,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15 * fem),
          color: Colors.white,
        ),
      ),
      Container(
        width: 170 * fem,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15 * fem),
          color: Colors.white,
        ),
      )
    ],
  );
}
