import 'package:equatable/equatable.dart';

import '../../models.dart';

class BonusDetailModel extends Equatable {
  final String id;
  final String brandId;
  final String brandName;
  final String brandAcronym;
  final String brandLogo;
  final String storeId;
  final String storeName;
  final String storeImage;
  final String studentId;
  final String studentName;
  final String studentAvatar;
  final double amount;
  final String dateCreated;
  final String dateUpdated;
  final String description;
  final bool state;
  final bool status;
  final List<BonusTransactionModel> bonusTransactions;

  BonusDetailModel(
      {required this.id,
      required this.brandId,
      required this.brandName,
      required this.brandAcronym,
      required this.brandLogo,
      required this.storeId,
      required this.storeName,
      required this.storeImage,
      required this.studentId,
      required this.studentName,
      required this.studentAvatar,
      required this.amount,
      required this.dateCreated,
      required this.dateUpdated,
      required this.description,
      required this.state,
      required this.status,
      required this.bonusTransactions});

  factory BonusDetailModel.fromJson(Map<String, dynamic> json) {
    var bonusTransactions = (json['bonusTransactions'] as List<dynamic>)
        .map((item) => BonusTransactionModel.fromJson(item as Map<String, dynamic>))
        .toList();
    return BonusDetailModel(
        id: json['id'],
        brandId: json['brandId'],
        brandName: json['brandName'],
        brandAcronym: json['brandAcronym'],
        brandLogo: json['brandLogo'],
        storeId: json['storeId'],
        storeName: json['storeName'],
        storeImage: json['storeImage'],
        studentId: json['studentId'],
        studentName: json['studentName'],
        studentAvatar: json['studentAvatar'],
        amount: json['amount'],
        dateCreated: json['dateCreated'],
        dateUpdated: json['dateUpdated'],
        description: json['description'],
        state: json['state'],
        status: json['status'],
        bonusTransactions: bonusTransactions);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brandId'] = this.brandId;
    data['brandName'] = this.brandName;
    data['brandAcronym'] = this.brandAcronym;
    data['brandLogo'] = this.brandLogo;
    data['storeId'] = this.storeId;
    data['storeName'] = this.storeName;
    data['storeImage'] = this.storeImage;
    data['studentId'] = this.studentId;
    data['studentName'] = this.studentName;
    data['studentAvatar'] = this.studentAvatar;
    data['amount'] = this.amount;
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    data['description'] = this.description;
    data['state'] = this.state;
    data['status'] = this.status;
    data['bonusTransactions'] =
        this.bonusTransactions.map((v) => v.toJson()).toList();

    return data;
  }

  @override
  List<Object?> get props => [
        this.id,
        this.brandId,
        this.brandName,
        this.brandAcronym,
        this.brandLogo,
        this.storeId,
        this.storeName,
        this.storeImage,
        this.studentId,
        this.studentName,
        this.studentAvatar,
        this.amount,
        this.dateCreated,
        this.dateUpdated,
        this.description,
        this.state,
        this.status,
        this.bonusTransactions
      ];
}
