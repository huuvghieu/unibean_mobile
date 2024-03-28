import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/domain/repositories/student_features/product_repository.dart';
import 'package:unibean_app/presentation/blocs/blocs.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/widgets/shimmer_widget.dart';

import '../../../cubits/counter/counter_cubit.dart';
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
    return SafeArea(
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
              size: 35 * fem,
            ),
          ),
          toolbarHeight: 80 * hem,
          centerTitle: true,
          title: Text(
            'Chi tiết sản phẩm',
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    fontSize: 20 * ffem,
                    fontWeight: FontWeight.w900,
                    height: 1.3625 * ffem / fem,
                    color: Colors.white)),
          ),
        ),
        body: Body(),
        bottomNavigationBar: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductByIdLoading) {
              return ShimmerWidget.rectangular(height: 35 * hem);
            } else if (state is ProductByIdLoaded) {
              return BottomAppBar(child: BlocBuilder<CartBloc, CartState>(
                builder: (context, _) {
                  if (_ is CartLoading) {
                    return InkWell(
                        onTap: () async {},
                        child: Container(
                          height: 35 * hem,
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(10 * fem)),
                          child: Center(
                              child: CircularProgressIndicator(
                            color: Colors.white,
                          )),
                        ));
                  } else if (_ is CartLoaded) {
                    return BlocBuilder<CounterCubit, CounterState>(
                      builder: (context, counter) {
                        return InkWell(
                            onTap: () async {
                              context.read<CartBloc>().add(AddProduct(
                                  product: state.productDetail,
                                  quantity: counter.counterValue));
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(SnackBar(
                                  elevation: 0,
                                  duration: const Duration(milliseconds: 2000),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  content: AwesomeSnackbarContent(
                                    title: 'Thêm thành công!',
                                    message:
                                        'Thêm ${state.productDetail.productName} vào giỏ hàng thành công!',
                                    contentType: ContentType.success,
                                  ),
                                ));
                            },
                            child: Container(
                              height: 35 * hem,
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
              ));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
