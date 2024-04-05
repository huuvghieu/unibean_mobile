import 'package:equatable/equatable.dart';

import '../../models.dart';

class CheckoutModel extends Equatable {
  final List<CreateOrderModel> orderList;
  const CheckoutModel(
      {required this.orderList});

  @override
  List<Object?> get props => [orderList];

}