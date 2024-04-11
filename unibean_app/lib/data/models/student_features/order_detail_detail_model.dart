import 'package:equatable/equatable.dart';

class OrderDetailDetailModel extends Equatable {
  final String id;
  final String productId;
  final String productName;
  final String productImage;
  final String orderId;
  final double price;
  final int quantity;
  final double amount;
  final bool state;
  final bool status;

  OrderDetailDetailModel(
      {required this.id,
      required this.productId,
      required this.productName,
      required this.productImage,
      required this.orderId,
      required this.price,
      required this.quantity,
      required this.amount,
      required this.state,
      required this.status});
      
  factory OrderDetailDetailModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailDetailModel(
      id: json['id'],
      productId: json['productId'],
      productName: json['productName'],
      productImage: json['productImage'],
      orderId: json['orderId'],
      price: json['price'],
      quantity: json['quantity'],
      amount: json['amount'],
      state: json['state'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['productImage'] = this.productImage;
    data['orderId'] = this.orderId;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['amount'] = this.amount;
    data['state'] = this.state;
    data['status'] = this.status;
    return data;
  }

  @override
  List<Object?> get props => [
        this.id,
        this.productId,
        this.productName,
        this.productImage,
        this.orderId,
        this.price,
        this.quantity,
        this.amount,
        this.state,
        this.status
      ];
}
