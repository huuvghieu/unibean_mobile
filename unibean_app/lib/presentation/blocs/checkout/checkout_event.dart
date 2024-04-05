part of 'checkout_bloc.dart';

sealed class CheckoutEvent extends Equatable {
  const CheckoutEvent();
}

final class UpdateCheckoutEvent extends CheckoutEvent {
  final List<CreateOrderDetailModel> detailLists;
  final String studentId;
  final bool state;
  final double amount;
  final CheckoutModel checkout;

  UpdateCheckoutEvent(
      {required this.detailLists,
      required this.studentId,
      required this.state,
      required this.amount,
      required this.checkout});

  @override
  List<Object?> get props => [checkout, detailLists, studentId, state, amount];
}

class ConfirmCheckoutEvent extends CheckoutEvent {
  final CreateOrderModel createOrderModel;

  const ConfirmCheckoutEvent({required this.createOrderModel});

  @override
  List<Object?> get props => [createOrderModel];
}
