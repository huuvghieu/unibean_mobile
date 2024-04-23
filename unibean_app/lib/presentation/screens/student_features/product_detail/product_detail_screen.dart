import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/domain/repositories/student_features/product_repository.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/widgets/shimmer_widget.dart';

import '../../../cubits/counter/counter_cubit.dart';
import '../../screens.dart';
import 'components/body.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = '/product-detail-student';

  static Route route({required String id}) {
    return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  lazy: false,
                  create: (context) => ProductBloc(
                      productRepository: context.read<ProductRepository>())
                    ..add(LoadProductById(productId: id)),
                ),
                BlocProvider(
                  lazy: false,
                  create: (context) => CounterCubit(),
                ),
              ],
              child: ProductDetailScreen(
                id: id,
              ),
            ),
        settings: const RouteSettings(arguments: routeName));
  }

  const ProductDetailScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double baseHeight = 812;
    double ffem = fem * 0.97;
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
                size: 30 * fem,
              ),
            ),
            toolbarHeight: 50 * hem,
            centerTitle: true,
            title: Text(
              'Chi tiết sản phẩm',
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      fontSize: 22 * ffem,
                      fontWeight: FontWeight.w900,
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
                                    await AuthenLocalDataSource.getStudentId();
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
          ),
          body: BlocListener<CartBloc, CartState>(
            listener: (context, state) {
              if (state is CartError) {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    content: Text(
                      '${state.error}',
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.normal,
                              color: Colors.black)),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          context.read<CartBloc>().add(ReloadCart());
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Đồng ý',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  fontSize: 15 * ffem,
                                  fontWeight: FontWeight.normal,
                                  color: kPrimaryColor)),
                        ),
                      )
                    ],
                  ),
                );
              } else if (state is AddSuccess) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                    elevation: 0,
                    duration: const Duration(milliseconds: 2000),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      title: 'Thêm thành công!',
                      message: 'Thêm vào giỏ hàng thành công!',
                      contentType: ContentType.success,
                    ),
                  ));
              }
            },
            child: Body(),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductByIdLoading) {
                return ShimmerWidget.rectangular(height: 35 * hem);
              } else if (state is ProductByIdLoaded) {
                return BlocBuilder<CartBloc, CartState>(
                  builder: (context, _) {
                    if (_ is CartLoading) {
                      return BottomAppBar(
                        child: InkWell(
                            onTap: () async {},
                            child: Container(
                              height: 35 * hem,
                              width: 200 * fem,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius:
                                      BorderRadius.circular(10 * fem)),
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: Colors.white,
                              )),
                            )),
                      );
                    } else if (_ is CartLoaded) {
                      return BlocBuilder<CounterCubit, CounterState>(
                        builder: (context, counter) {
                          return GestureDetector(
                              onTap: () async {
                                context.read<CartBloc>().add(AddProduct(
                                    product: state.productDetail,
                                    quantity: counter.counterValue));
                              },
                              child: Container(
                                height: 45 * hem,
                                width: 250 * fem,
                                margin: EdgeInsets.only(
                                    left: 40 * fem, right: 40 * fem),
                                decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius:
                                        BorderRadius.circular(10 * fem)),
                                child: Center(
                                  child: Text(
                                    'Thêm vào giỏ hàng',
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            fontSize: 15 * ffem,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  ),
                                ),
                              ));
                        },
                      );
                    }
                    else if (_ is AddSuccess) {
                      return BlocBuilder<CounterCubit, CounterState>(
                        builder: (context, counter) {
                          return GestureDetector(
                              onTap: () async {
                                context.read<CartBloc>().add(AddProduct(
                                    product: state.productDetail,
                                    quantity: counter.counterValue));
                              },
                              child: Container(
                                height: 45 * hem,
                                width: 250 * fem,
                                margin: EdgeInsets.only(
                                    left: 40 * fem, right: 40 * fem),
                                decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius:
                                        BorderRadius.circular(10 * fem)),
                                child: Center(
                                  child: Text(
                                    'Thêm vào giỏ hàng',
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            fontSize: 15 * ffem,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  ),
                                ),
                              ));
                        },
                      );
                    }
                    return Container();
                  },
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
