import 'package:unibean_app/domain/entities.dart';

class TransactionModel extends Transaction {
  TransactionModel(
      {required super.id,
      required super.name,
      required super.requestId,
      required super.walletId,
      required super.walletTypeId,
      required super.walletType,
      required super.walletTypeName,
      required super.typeName,
      required super.amount,
      required super.rate,
      required super.dateCreated,
      required super.description,
      required super.state,
      required super.status});

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
   id : json['id'],
    name : json['name'],
    requestId : json['requestId'],
    walletId : json['walletId'],
    walletTypeId : json['walletTypeId'],
    walletType : json['walletType'],
    walletTypeName : json['walletTypeName'],
    typeName : json['typeName'],
    amount : json['amount'],
    rate : json['rate'],
    dateCreated : json['dateCreated'],
    description : json['description'],
    state : json['state'],
    status : json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['requestId'] = this.requestId;
    data['walletId'] = this.walletId;
    data['walletTypeId'] = this.walletTypeId;
    data['walletType'] = this.walletType;
    data['walletTypeName'] = this.walletTypeName;
    data['typeName'] = this.typeName;
    data['amount'] = this.amount;
    data['rate'] = this.rate;
    data['dateCreated'] = this.dateCreated;
    data['description'] = this.description;
    data['state'] = this.state;
    data['status'] = this.status;
    return data;
  }
}
