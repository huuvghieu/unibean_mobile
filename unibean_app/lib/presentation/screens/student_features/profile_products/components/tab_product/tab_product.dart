import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/presentation/screens/screens.dart';
import '../../../../../blocs/blocs.dart';
import '../../../../../config/constants.dart';
import 'product_card.dart';
import 'search_bar_custom.dart';

class TabProduct extends StatelessWidget {
  const TabProduct({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    double baseHeight = 812;
    double hem = MediaQuery.of(context).size.height / baseHeight;

    return RefreshIndicator(
      onRefresh: () async {
        context.read<ProductBloc>().add(LoadProducts());
      },
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<RoleAppBloc, RoleAppState>(
                    builder: (context, state) {
                      if (state is Verified) {
                        return Container(
                          color: kbgWhiteColor,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 20 * hem),
                                child: Center(
                                  child: Text(
                                    'Xin chào, ${state.authenModel.userModel.name}!',
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 21 * ffem,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Tham gia các hoạt động để tích lũy ưu đãi',
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.normal)),
                                ),
                              ),
                              SizedBox(
                                height: 10 * hem,
                              ),
                              SearchBarCustom(),
                              SizedBox(
                                height: 15 * hem,
                              ),
                            ],
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                  SizedBox(
                    height: 10 * hem,
                  ),
                  Container(
                    color: kbgWhiteColor,
                    padding: EdgeInsets.only(top: 15 * fem, bottom: 15 * fem),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10 * fem),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'SẢN PHẨM',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                  fontSize: 15 * ffem,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12 * hem,
                        ),
                        // CampaignPaged()
                        BlocBuilder<ProductBloc, ProductState>(
                          builder: (context, state) {
                            if (state is ProductLoading) {
                              return Center(
                                child: Lottie.asset(
                                    'assets/animations/loading-screen.json'),
                              );
                            } else if (state is ProductsLoaded) {
                              return Container(
                                margin: EdgeInsets.only(left: 10 * fem),
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
                                        Navigator.pushNamed(context,
                                            ProductDetailScreen.routeName,
                                            arguments:
                                                state.products[index].id);
                                      },
                                    );
                                  },
                                ),
                              );
                            }
                            return Container();
                          },
                        ),
                        SizedBox(
                          height: 10 * hem,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
