import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<LoadCart>(_onLoadCart);
    on<AddProduct>(_onAddProduct);
    on<RemoveProduct>(_onRemoveProduct);
  }

  void _onLoadCart(
    LoadCart event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(CartLoaded());
    } catch (_) {
      emit(CartError());
    }
  }

  void _onAddProduct(
    AddProduct event,
    Emitter<CartState> emit,
  ) {
    if (this.state is CartLoaded) {
      try {
        if (event.quantity > 1) {
          var products = <ProductDetailModel>[];
          for (int i = 0; i < event.quantity; i++) {
            products.add(event.product);
          }
          List<ProductDetailModel> results = [
            ...products,
            ...(this.state as CartLoaded).cart.products
          ];

          emit(
            CartLoaded(
              cart: Cart(products: results),
            ),
          );
        } else {
          List<ProductDetailModel> results = [
            event.product,
            ...(this.state as CartLoaded).cart.products
          ];
          emit(
            CartLoaded(
              cart: Cart(products: results),
            ),
          );
        }
      } on Exception {
        emit(CartError());
      }
    }
  }

  void _onRemoveProduct(
    RemoveProduct event,
    Emitter<CartState> emit,
  ) {
    if (this.state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cart: Cart(
              products: List.from((this.state as CartLoaded).cart.products)
                ..remove(event.product),
            ),
          ),
        );
      } on Exception {
        emit(CartError());
      }
    }
  }
}
