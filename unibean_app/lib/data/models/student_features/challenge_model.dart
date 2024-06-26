import 'package:unibean_app/domain/entities.dart';

class ChallengeModel extends Challenge {
  ChallengeModel(
      {required super.id,
      required super.challengeId,
      required super.challengeTypeId,
      required super.challengeType,
      required super.challengeTypeName,
      required super.challengeName,
      required super.challengeImage,
      required super.studentId,
      required super.studentName,
      required super.amount,
      required super.current,
      required super.condition,
      required super.isCompleted,
      required super.isClaimed,
      required super.dateCreated,
      required super.dateUpdated,
      required super.description,
      required super.state,
      required super.status});

  factory ChallengeModel.fromJson(Map<String, dynamic> json) {
    return ChallengeModel(
      id: json['id'],
      challengeId: json['challengeId'],
      challengeTypeId: json['challengeTypeId'],
      challengeType: json['challengeType'],
      challengeTypeName: json['challengeTypeName'],
      challengeName: json['challengeName'],
      challengeImage: json['challengeImage'],
      studentId: json['studentId'],
      studentName: json['studentName'],
      amount: json['amount'],
      current: json['current'],
      condition: json['condition'],
      isCompleted: json['isCompleted'],
      isClaimed: json['isClaimed'],
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
    data['challengeId'] = this.challengeId;
    data['challengeTypeId'] = this.challengeTypeId;
    data['challengeType'] = this.challengeType;
    data['challengeTypeName'] = this.challengeTypeName;
    data['challengeName'] = this.challengeName;
    data['challengeImage'] = this.challengeImage;
    data['studentId'] = this.studentId;
    data['studentName'] = this.studentName;
    data['amount'] = this.amount;
    data['current'] = this.current;
    data['condition'] = this.condition;
    data['isCompleted'] = this.isCompleted;
    data['isClaimed'] = this.isClaimed;
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    data['description'] = this.description;
    data['state'] = this.state;
    data['status'] = this.status;
    return data;
  }

  ChallengeModel copyWith({
    String? id,
    String? challengeId,
    String? challengeTypeId,
    String? challengeType,
    String? challengeTypeName,
    String? challengeName,
    String? challengeImage,
    String? studentId,
    String? studentName,
    double? amount,
    double? current,
    double? condition,
    bool? isCompleted,
    bool? isClaimed,
    String? dateCreated,
    String? dateUpdated,
    String? description,
    bool? state,
    bool? status,
  }) {
    return ChallengeModel(
        id: id ?? this.id,
        challengeId: challengeId ?? this.challengeId,
        challengeTypeId: challengeTypeId ?? this.challengeTypeId,
        challengeType: challengeType ?? this.challengeType,
        challengeTypeName: challengeTypeName ?? this.challengeTypeName,
        challengeName: challengeName ?? this.challengeName,
        challengeImage: challengeImage ?? this.challengeImage,
        studentId: studentId ?? this.studentId,
        studentName: studentName ?? this.studentName,
        amount: amount ?? this.amount,
        current: current ?? this.current,
        condition: condition ?? this.condition,
        isCompleted: isCompleted ?? this.isCompleted,
        isClaimed: isClaimed ?? this.isClaimed,
        dateCreated: dateCreated ?? this.dateCreated,
        dateUpdated: dateUpdated ?? this.dateUpdated,
        description: description ?? this.description,
        state: state ?? this.state,
        status: status ?? this.status);
  }
}
