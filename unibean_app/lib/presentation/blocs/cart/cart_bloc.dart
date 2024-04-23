import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unibean_app/data/datasource/authen_local_datasource.dart';

import '../../../data/models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<LoadCart>(_onLoadCart);
    on<AddProduct>(_onAddProduct);
    on<RemoveProduct>(_onRemoveProduct);
    on<RemoveAllProduct>(_onRemoveAllProduct);
    on<ReloadCart>(_onReloadCart);
    on<RefreshCart>(_onCartRefresh);
  }

  Future<void> _onLoadCart(
    LoadCart event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    try {
      var cart = await AuthenLocalDataSource.getCarts();
      if (cart == null) {
        cart = Cart();
        String cartString = jsonEncode(cart);
        AuthenLocalDataSource.saveCarts(cartString);
        emit(CartLoaded(cart: cart));
      } else {
        emit(CartLoaded(cart: cart));
      }
    } catch (e) {
      emit(CartError(error: e.toString()));
    }
  }

  Future<void> _onReloadCart(
    ReloadCart event,
    Emitter<CartState> emit,
  ) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 1));

      emit(CartLoaded(cart: (this.state as CartError).cart!));
    } catch (e) {
      emit(CartError(error: e.toString()));
    }
  }

  Future<void> _onAddProduct(
    AddProduct event,
    Emitter<CartState> emit,
  ) async {
    if (this.state is CartLoaded) {
      try {
        if (event.quantity > 1) {
          var productInCart = (this.state as CartLoaded).cart.products;
          Cart cart = (this.state as CartLoaded).cart;
          int quantityInCart =
              productInCart.where((p) => p.id == event.product.id).length;
          if ((quantityInCart + event.quantity) > event.product.quantity) {
            emit(
              CartError(
                  error:
                      "Không thể thêm số lượng đã chọn vào giỏ hàng vì sẽ vượt quá giới hạn mua hàng",
                  cart: cart),
            );
          } else {
            var products = <ProductDetailModel>[];
            for (int i = 0; i < event.quantity; i++) {
              products.add(event.product);
            }
            List<ProductDetailModel> results = [
              ...products,
              ...(this.state as CartLoaded).cart.products
            ];

            final cart = Cart(products: results);
            String cartString = jsonEncode(cart);
            AuthenLocalDataSource.saveCarts(cartString);
            emit(AddSuccess(cart: cart));
            emit(
              CartLoaded(
                cart: cart,
              ),
            );
          }
        } else {
          var productInCart = (this.state as CartLoaded).cart.products;
          Cart cart = (this.state as CartLoaded).cart;
          int quantityInCart =
              productInCart.where((p) => p.id == event.product.id).length;
          if ((quantityInCart + event.quantity) > event.product.quantity) {
            emit(
              CartError(
                  error:
                      "Không thể thêm số lượng đã chọn vào giỏ hàng vì sẽ vượt quá giới hạn mua hàng",
                  cart: cart),
            );
          } else {
            emit(AddSuccess(
              cart: Cart(
                products: List.from((this.state as CartLoaded).cart.products)
                  ..add(event.product),
              ),
            ));
            cart = Cart(
              products: List.from((this.state as AddSuccess).cart.products),
            );
            String cartString = jsonEncode(cart);
            AuthenLocalDataSource.saveCarts(cartString);
            emit(CartLoaded(cart: cart));
          }
        }
      } catch (e) {
        emit(CartError(error: e.toString()));
      }
    }
  }

  Future<void> _onCartRefresh(
      RefreshCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      AuthenLocalDataSource.removeCart();
      emit(CartLoaded(cart: Cart(products: [])));
    } catch (_) {
      emit(CartError(error: ''));
    }
  }

  Future<void> _onRemoveProduct(
    RemoveProduct event,
    Emitter<CartState> emit,
  ) async {
    if (this.state is CartLoaded) {
      try {
        var cart = Cart(
          products: List.from((this.state as CartLoaded).cart.products)
            ..remove(event.product),
        );
        String cartString = jsonEncode(cart);
        AuthenLocalDataSource.saveCarts(cartString);
        emit(
          CartLoaded(cart: cart),
        );
      } catch (e) {
        emit(CartError(error: e.toString()));
      }
    }
  }

  Future<void> _onRemoveAllProduct(
    RemoveAllProduct event,
    Emitter<CartState> emit,
  ) async {
    final state = this.state;

    if (state is CartLoaded) {
      try {
        var cart = state.cart.copyWith(
          products: List.from(state.cart.products)
            ..removeWhere((product) => product == event.product),
        );
        String cartString = jsonEncode(cart);
        AuthenLocalDataSource.saveCarts(cartString);
        emit(
          CartLoaded(cart: cart),
        );
      } catch (_) {}
    }
  }
}
