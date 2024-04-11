import 'package:equatable/equatable.dart';

class BonusTransactionModel extends Equatable {
  final String id;
  final String walletId;
  final String walletTypeId;
  final String walletType;
  final String walletTypeName;
  final String bonusId;
  final double amount;
  final double rate;
  final String description;
  final bool state;
  final bool status;

  BonusTransactionModel(
      {required this.id,
      required this.walletId,
      required this.walletTypeId,
      required this.walletType,
      required this.walletTypeName,
      required this.bonusId,
      required this.amount,
      required this.rate,
      required this.description,
      required this.state,
      required this.status});
  factory BonusTransactionModel.fromJson(Map<String, dynamic> json) {
    return BonusTransactionModel(
      id: json['id'],
      walletId: json['walletId'],
      walletTypeId: json['walletTypeId'],
      walletType: json['walletType'],
      walletTypeName: json['walletTypeName'],
      bonusId: json['bonusId'],
      amount: json['amount'],
      rate: json['rate'],
      description: json['description'],
      state: json['state'],
      status: json['status'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['walletId'] = this.walletId;
    data['walletTypeId'] = this.walletTypeId;
    data['walletType'] = this.walletType;
    data['walletTypeName'] = this.walletTypeName;
    data['bonusId'] = this.bonusId;
    data['amount'] = this.amount;
    data['rate'] = this.rate;
    data['description'] = this.description;
    data['state'] = this.state;
    data['status'] = this.status;
    return data;
  }

  @override
  List<Object?> get props => [
        this.id,
        this.walletId,
        this.walletTypeId,
        this.walletType,
        this.walletTypeName,
        this.bonusId,
        this.amount,
        this.rate,
        this.description,
        this.state,
        this.status
      ];
}
