import 'package:unibean_app/domain/entities.dart';

class ChallengeModel extends Challenge {
  ChallengeModel(
      {required super.id,
      required super.typeId,
      required super.type,
      required super.typeName,
      required super.challengeName,
      required super.amount,
      required super.condition,
      required super.image,
      required super.fileName,
      required super.dateCreated,
      required super.dateUpdated,
      required super.description,
      required super.state,
      required super.status});

  factory ChallengeModel.fromJson(Map<String, dynamic> json) {
    return ChallengeModel(
      id: json['id'],
      typeId: json['typeId'],
      type: json['type'],
      typeName: json['typeName'],
      challengeName: json['challengeName'],
      amount: json['amount'],
      condition: json['condition'],
      image: json['image'],
      fileName: json['fileName'],
      dateCreated: json['dateCreated'],
      dateUpdated: json['dateUpdated'],
      description: json['description'],
      state: json['state'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['typeId'] = this.typeId;
    data['type'] = this.type;
    data['typeName'] = this.typeName;
    data['challengeName'] = this.challengeName;
    data['amount'] = this.amount;
    data['condition'] = this.condition;
    data['image'] = this.image;
    data['fileName'] = this.fileName;
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    data['description'] = this.description;
    data['state'] = this.state;
    data['status'] = this.status;
    return data;
  }
}
