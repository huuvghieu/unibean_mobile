part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();
}

final class LoadCart extends CartEvent {
  @override
  List<Object?> get props => [];
}

final class AddProduct extends CartEvent {
  final ProductDetailModel product;
  final int quantity;

  AddProduct({required this.product, this.quantity = 1});

  @override
  List<Object?> get props => [product, quantity];
}

final class RemoveProduct extends CartEvent {
  final ProductDetailModel product;

  RemoveProduct({required this.product});

  @override
  List<Object?> get props => [product];
}
