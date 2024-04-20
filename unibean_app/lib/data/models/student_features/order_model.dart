import '../../../domain/entities.dart';

class OrderModel extends Order {
  OrderModel(
      {required super.id,
      required super.orderImage,
      required super.studentId,
      required super.studentName,
      required super.studentCode,
      required super.stationId,
      required super.stationName,
      required super.amount,
      required super.dateCreated,
      required super.description,
      required super.state,
      required super.status,
      required super.currentStateId,
      required super.currentState,
      required super.currentStateName});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      orderImage: json['orderImage'] ?? '',
      studentId: json['studentId'] ?? '',
      studentName: json['studentName'] ?? '',
      studentCode: json['studentCode'] ?? '',
      stationId: json['stationId'] ?? '',
      stationName: json['stationName'] ?? '',
      amount: json['amount'] ?? 0,
      dateCreated: json['dateCreated'] ?? '',
      description: json['description'] ?? '',
      state: json['state'],
      status: json['status'],
      currentStateId: json['currentStateId'] ?? '',
      currentState: json['currentState'] ?? '',
      currentStateName: json['currentStateName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['orderImage'] = this.orderImage;
    data['studentId'] = this.studentId;
    data['studentName'] = this.studentName;
    data['studentCode'] = this.studentCode;
    data['stationId'] = this.stationId;
    data['stationName'] = this.stationName;
    data['amount'] = this.amount;
    data['dateCreated'] = this.dateCreated;
    data['description'] = this.description;
    data['state'] = this.state;
    data['status'] = this.status;
    data['currentStateId'] = this.currentStateId;
    data['currentState'] = this.currentState;
    data['currentStateName'] = this.currentStateName;
    return data;
  }
}
