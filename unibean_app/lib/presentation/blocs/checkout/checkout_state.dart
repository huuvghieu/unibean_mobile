part of 'checkout_bloc.dart';

sealed class CheckoutState extends Equatable {
  const CheckoutState();
}

final class CheckoutLoading extends CheckoutState {
  @override
  List<Object?> get props => [];
}

final class CheckoutLoaded extends CheckoutState {
  final Cart? cart;
  const CheckoutLoaded({this.cart});

  @override
  List<Object?> get props => [cart];
}

final class ConfirmLoading extends CheckoutState {
  @override
  List<Object?> get props => [];
}

final class CheckoutFailed extends CheckoutState {
  final String error;

  CheckoutFailed({required this.error});
  @override
  List<Object?> get props => [error];
}

final class CheckoutSuccess extends CheckoutState {
  final OrderModel orderModel;

  CheckoutSuccess({required this.orderModel});
  @override
  List<Object?> get props => [orderModel];
}
