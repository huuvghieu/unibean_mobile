import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibean_app/data/datasource/authen_local_datasource.dart';
import 'package:unibean_app/domain/repositories.dart';
import 'package:unibean_app/presentation/config/constants.dart';
import 'package:unibean_app/presentation/screens/screens.dart';

import '../../../../data/models.dart';
import '../../../blocs/blocs.dart';
import '../../../blocs/checkout/checkout_bloc.dart';

class ProductConfirmScreen extends StatelessWidget {
  static const String routeName = '/product-confirmed-student';

  static Route route({required StationModel stationModel}) {
    return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => StudentBloc(
                      studentRepository: context.read<StudentRepository>()),
                ),
                BlocProvider(
                  create: (context) => CheckoutBloc(
                      cartBloc: context.read<CartBloc>(),
                      studentRepository: context.read<StudentRepository>()),
                ),
              ],
              child: ProductConfirmScreen(
                stationModel: stationModel,
              ),
            ),
        settings: const RouteSettings(arguments: routeName));
  }

  const ProductConfirmScreen({super.key, required this.stationModel});
  final StationModel stationModel;

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
              size: 25 * fem,
            ),
          ),
          toolbarHeight: 50 * hem,
          centerTitle: true,
          title: Text(
            'Xác nhận đơn hàng',
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    fontSize: 18 * ffem,
                    fontWeight: FontWeight.w900,
                    height: 1.3625 * ffem / fem,
                    color: Colors.white)),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10 * hem,
            ),
            Expanded(
              flex: 3,
              child: BlocBuilder<CheckoutBloc, CheckoutState>(
                builder: (context, state) {
                  if (state is CheckoutLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                    );
                  } else if (state is CheckoutLoaded) {
                    Map cart =
                        state.cart!.productQuantity(state.cart!.products);

                    return ListView.builder(
                      itemCount: cart.keys.length,
                      itemBuilder: (context, index) {
                        var listProduct = cart.keys.toList();
                        return Column(
                          children: [
                            Container(
                              constraints: BoxConstraints(maxHeight: 120 * hem),
                              margin: EdgeInsets.only(
                                bottom: 2 * hem,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: klighGreyColor),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0x0c000000),
                                        offset: Offset(0 * fem, 0 * fem),
                                        blurRadius: 5 * fem)
                                  ]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: EdgeInsets.all(5 * fem),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          listProduct[index].productImages[0],
                                          fit: BoxFit.fill,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                              'assets/images/image-404.jpg',
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8 * fem,
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.only(top: 5 * hem),
                                          child: Text(
                                              listProduct[index].productName,
                                              softWrap: true,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.openSans(
                                                  textStyle: TextStyle(
                                                fontSize: 18 * ffem,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                              ))),
                                        ),
                                        Container(
                                          child: Text(
                                              'Số lượng: ${cart.values.elementAt(index)}',
                                              softWrap: true,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.openSans(
                                                  textStyle: TextStyle(
                                                fontSize: 16 * ffem,
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                              ))),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '${formatter.format(listProduct[index].price).toString()}',
                                              style: GoogleFonts.openSans(
                                                  textStyle: TextStyle(
                                                fontSize: 20 * ffem,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                              )),
                                            ),
                                            SizedBox(
                                              width: 5 * fem,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 4 * hem,
                                                  bottom: 2 * hem),
                                              child: SvgPicture.asset(
                                                'assets/icons/red-bean-icon.svg',
                                                width: 18 * fem,
                                                height: 16 * fem,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10 * hem,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
            ),
            Expanded(
                flex: 1,
                child: BlocConsumer<CheckoutBloc, CheckoutState>(
                  listener: (context, state) {
                    if (state is ConfirmLoading) {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) {
                            Future.delayed(Duration(seconds: 10));
                            return AlertDialog(
                                content: Container(
                                    width: 250,
                                    height: 250,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Center(
                                            child: CircularProgressIndicator(
                                                color: kPrimaryColor)),
                                        Text(
                                          'Đang thực hiện giao dịch...',
                                          style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                                  fontSize: 15 * ffem,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black)),
                                        )
                                      ],
                                    )));
                          });
                    } else if (state is CheckoutSuccess) {
                      Navigator.pushNamedAndRemoveUntil(
                          context,
                          SuccessCreateOrderScreen.routeName,
                          (Route<dynamic> route) => false,
                          arguments: state.orderModel);
                    }else if(state is CheckoutFailed){
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          FailedBuyScreen.routeName,
                          (Route<dynamic> route) => false,
                          arguments: state.error);
                    }
                  },
                  builder: (context, state) {
                    return BlocBuilder<CheckoutBloc, CheckoutState>(
                      builder: (context, state) {
                        if (state is CheckoutLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: kPrimaryColor,
                            ),
                          );
                        } else if (state is CheckoutLoaded) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                color: Colors.white),
                            padding: EdgeInsets.only(
                                left: 15 * fem,
                                right: 15 * fem,
                                top: 15 * hem,
                                bottom: 15 * hem),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Nhận tại trạm:',
                                      style: GoogleFonts.openSans(
                                          textStyle: TextStyle(
                                              fontSize: 15 * ffem,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black)),
                                    ),
                                    Container(
                                      width: 150,
                                      child: Text(
                                        '${stationModel.stationName}',
                                        textAlign: TextAlign.end,
                                        maxLines: 2,
                                        style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                                fontSize: 16 * ffem,
                                                fontWeight: FontWeight.w600,
                                                color: kPrimaryColor)),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Tổng đậu đỏ',
                                      style: GoogleFonts.openSans(
                                          textStyle: TextStyle(
                                              fontSize: 15 * ffem,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black)),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${formatter.format(state.cart!.total)}',
                                          style: GoogleFonts.openSans(
                                              textStyle: TextStyle(
                                            fontSize: 30 * ffem,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          )),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 5 * fem,
                                              top: 4 * hem,
                                              bottom: 0 * hem),
                                          child: SvgPicture.asset(
                                            'assets/icons/red-bean-icon.svg',
                                            width: 23 * fem,
                                            height: 26 * fem,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () async {
                                    final student = await AuthenLocalDataSource
                                        .getStudent();

                                    if (student!.greenWalletBalance <
                                        state.cart!.total) {
                                      ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(SnackBar(
                                          elevation: 0,
                                          duration: const Duration(
                                              milliseconds: 2000),
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Colors.transparent,
                                          content: AwesomeSnackbarContent(
                                            title: 'Mua thất bại',
                                            message:
                                                'Số đậu đỏ của bạn không đủ!',
                                            contentType: ContentType.failure,
                                          ),
                                        ));
                                    } else {
                                      Map cart = state.cart!.productQuantity(
                                          state.cart!.products);
                                      List<CreateOrderDetailModel> detailList =
                                          [];
                                      for (int i = 0;
                                          i < cart.keys.length;
                                          i++) {
                                        ProductDetailModel product =
                                            (cart.keys.elementAt(i)
                                                as ProductDetailModel);
                                        int quantity = cart.values.elementAt(i);
                                        CreateOrderDetailModel detailModel =
                                            CreateOrderDetailModel(
                                                productId: product.id,
                                                quantity: quantity,
                                                state: true);
                                        detailList.add(detailModel);
                                      }
                                      CreateOrderModel createOrder =
                                          CreateOrderModel(
                                              stationId: stationModel.id,
                                              amount: state.cart!.total,
                                              description: '',
                                              state: true,
                                              orderDetails: detailList);
                                      context.read<CheckoutBloc>().add(
                                          ConfirmCheckoutEvent(
                                              createOrderModel: createOrder));
                                      context
                                          .read<CartBloc>()
                                          .add(RefreshCart());
                                    }
                                  },
                                  child: Container(
                                    width: 200 * fem,
                                    height: 45 * hem,
                                    decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        borderRadius:
                                            BorderRadius.circular(15 * fem)),
                                    child: Center(
                                      child: Text(
                                        'Đổi ngay',
                                        style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                                fontSize: 16 * ffem,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                        return Container();
                      },
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
