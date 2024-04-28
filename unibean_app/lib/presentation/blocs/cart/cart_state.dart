part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();
}

final class CartLoading extends CartState {
  @override
  List<Object?> get props => [];
}

final class CartLoaded extends CartState {
  final Cart cart;

  CartLoaded({this.cart = const Cart()});

  @override
  List<Object?> get props => [cart];
}

final class AddSuccess extends CartState {
  final Cart cart;

  AddSuccess({this.cart = const Cart()});

  @override
  List<Object?> get props => [cart];
}

// ignore: must_be_immutable
final class CartError extends CartState {
  final String error;
  Cart? cart;
  CartError({required this.error, this.cart});

  @override
  List<Object?> get props => [error, cart];
}
