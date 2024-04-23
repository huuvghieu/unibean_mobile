import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
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
        physics: const AlwaysScrollableScrollPhysics(),
        controller: context.read<ProductBloc>().scrollController,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: kbgWhiteColor,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15 * hem,
                        ),
                        SearchBarCustom(),
                        SizedBox(
                          height: 15 * hem,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5 * hem,
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
                                'SẢN PHẨM NỔI BẬT',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                  fontSize: 16 * ffem,
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
                              if (state.products.isEmpty) {
                                return Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(
                                      left: 15 * fem, right: 15 * fem),
                                  height: 220 * hem,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/empty-icon.svg',
                                        width: 60 * fem,
                                        colorFilter: ColorFilter.mode(
                                            kLowTextColor, BlendMode.srcIn),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 5),
                                          child: Text(
                                            'Không có sản phẩm',
                                            style: GoogleFonts.openSans(
                                                textStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                            )),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10 * fem,
                                      ),
                                    ],
                                  ),
                                );
                              } else {
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
                                    itemCount: state.hasReachedMax
                                        ? state.products.length
                                        : state.products.length + 1,
                                    itemBuilder: (context, index) {
                                      if (index >= state.products.length) {
                                        return Center(
                                          child: CircularProgressIndicator(
                                            color: kPrimaryColor,
                                          ),
                                        );
                                      } else {
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
                                      }
                                    },
                                  ),
                                );
                              }
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
