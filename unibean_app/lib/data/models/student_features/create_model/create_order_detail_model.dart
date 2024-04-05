import 'package:equatable/equatable.dart';

class CreateOrderDetailModel extends Equatable {
  final String productId;
  final int quantity;
  final bool state;

  CreateOrderDetailModel(
      {required this.productId, required this.quantity, required this.state});

  factory CreateOrderDetailModel.fromJson(Map<String, dynamic> json) {
    return CreateOrderDetailModel(
        productId: json['productId'],
        quantity: json['quantity'],
        state: json['state']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['quantity'] = this.quantity;
    data['state'] = this.state;
    return data;
  }

  @override
  List<Object?> get props => [productId, quantity, state];
}
