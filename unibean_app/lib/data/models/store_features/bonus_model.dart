import 'package:unibean_app/domain/entities.dart';

class BonusModel extends Bonus {
  BonusModel(
      {required super.id,
      required super.brandId,
      required super.brandName,
      required super.storeId,
      required super.storeName,
      required super.studentId,
      required super.studentName,
      required super.amount,
      required super.dateCreated,
      required super.dateUpdated,
      required super.description,
      required super.state,
      required super.status});

  factory BonusModel.fromJson(Map<String, dynamic> json) {
    return BonusModel(
      id: json['id'] ?? '',
      brandId: json['brandId'] ?? '',
      brandName: json['brandName'] ?? '',
      storeId: json['storeId'] ?? '',
      storeName: json['storeName'] ?? '',
      studentId: json['studentId'] ?? '',
      studentName: json['studentName'] ?? '',
      amount: json['amount'] ?? 0,
      dateCreated: json['dateCreated'] ?? '',
      dateUpdated: json['dateUpdated'] ?? '',
      description: json['description'] ?? '',
      state: json['state'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brandId'] = this.brandId;
    data['brandName'] = this.brandName;
    data['storeId'] = this.storeId;
    data['storeName'] = this.storeName;
    data['studentId'] = this.studentId;
    data['studentName'] = this.studentName;
    data['amount'] = this.amount;
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    data['description'] = this.description;
    data['state'] = this.state;
    data['status'] = this.status;
    return data;
  }
}
