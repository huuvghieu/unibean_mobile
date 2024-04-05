import 'package:equatable/equatable.dart';

import '../../../models.dart';

class CreateOrderModel extends Equatable {
  final String stationId;
  final double amount;
  final String description;
  final bool state;
  final List<CreateOrderDetailModel> orderDetails;

  CreateOrderModel(
      {required this.stationId,
      required this.amount,
      required this.description,
      required this.state,
      required this.orderDetails});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stationId'] = this.stationId;
    data['amount'] = this.amount;
    data['description'] = this.description;
    data['state'] = this.state;
    data['orderDetails'] = this.orderDetails.map((v) => v.toJson()).toList();
    return data;
  }

  @override
  List<Object?> get props => [
        this.stationId,
        this.amount,
        this.description,
        this.state,
        this.orderDetails
      ];
}
