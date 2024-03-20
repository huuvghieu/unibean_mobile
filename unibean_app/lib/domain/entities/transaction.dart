import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final String id;
  final String name;
  final String requestId;
  final String walletId;
  final int walletTypeId;
  final String walletType;
  final String walletTypeName;
  final String typeName;
  final double amount;
  final double rate;
  final String dateCreated;
  final String description;
  final bool state;
  final bool status;

  Transaction(
      {required this.id,
      required this.name,
      required this.requestId,
      required this.walletId,
      required this.walletTypeId,
      required this.walletType,
      required this.walletTypeName,
      required this.typeName,
      required this.amount,
      required this.rate,
      required this.dateCreated,
      required this.description,
      required this.state,
      required this.status});

  @override
  List<Object?> get props => [
        this.id,
        this.name,
        this.requestId,
        this.walletId,
        this.walletTypeId,
        this.walletType,
        this.walletTypeName,
        this.typeName,
        this.amount,
        this.rate,
        this.dateCreated,
        this.description,
        this.state,
        this.status
      ];
}
