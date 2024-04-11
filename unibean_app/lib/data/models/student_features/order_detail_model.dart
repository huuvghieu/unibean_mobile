import 'package:equatable/equatable.dart';

import '../../models.dart';

class OrderDetailModel extends Equatable {
  final String id;
  final String studentId;
  final String studentName;
  final String studentCode;
  final String studentImage;
  final String stationId;
  final String stationName;
  final String stationImage;
  final String stationAdress;
  final String stationPhone;
  final String stationOpeningHours;
  final String stationClosingHours;
  final double amount;
  final String dateCreated;
  final String description;
  final bool state;
  final bool status;
  final int currentStateId;
  final String currentState;
  final String currentStateName;
  final List<OrderDetailDetailModel> orderDetails;
  final List<StateOrderDetailModel> stateDetails;

  OrderDetailModel(
      {required this.id,
      required this.studentId,
      required this.studentName,
      required this.studentCode,
      required this.studentImage,
      required this.stationId,
      required this.stationName,
      required this.stationImage,
      required this.stationAdress,
      required this.stationPhone,
      required this.stationOpeningHours,
      required this.stationClosingHours,
      required this.amount,
      required this.dateCreated,
      required this.description,
      required this.state,
      required this.status,
      required this.currentStateId,
      required this.currentState,
      required this.currentStateName,
      required this.orderDetails,
      required this.stateDetails});

  @override
  List<Object?> get props => [
        this.id,
        this.studentId,
        this.studentName,
        this.studentCode,
        this.studentImage,
        this.stationId,
        this.stationName,
        this.stationImage,
        this.stationAdress,
        this.stationPhone,
        this.stationOpeningHours,
        this.stationClosingHours,
        this.amount,
        this.dateCreated,
        this.description,
        this.state,
        this.status,
        this.currentStateId,
        this.currentState,
        this.currentStateName,
        this.orderDetails,
        this.stateDetails
      ];

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) {
    var orderDetails = (json['orderDetails'] as List<dynamic>)
        .map((item) =>
            OrderDetailDetailModel.fromJson(item as Map<String, dynamic>))
        .toList();

    var stateDetail = (json['stateDetails'] as List<dynamic>)
        .map((item) =>
            StateOrderDetailModel.fromJson(item as Map<String, dynamic>))
        .toList();
    return OrderDetailModel(
        id: json['id'],
        studentId: json['studentId'],
        studentName: json['studentName'],
        studentCode: json['studentCode'],
        studentImage: json['studentImage'],
        stationId: json['stationId'],
        stationName: json['stationName'],
        stationImage: json['stationImage'],
        stationAdress: json['stationAdress'],
        stationPhone: json['stationPhone'],
        stationOpeningHours: json['stationOpeningHours'],
        stationClosingHours: json['stationClosingHours'],
        amount: json['amount'],
        dateCreated: json['dateCreated'],
        description: json['description'],
        state: json['state'],
        status: json['status'],
        currentStateId: json['currentStateId'],
        currentState: json['currentState'],
        currentStateName: json['currentStateName'],
        orderDetails: orderDetails,
        stateDetails: stateDetail);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['studentId'] = this.studentId;
    data['studentName'] = this.studentName;
    data['studentCode'] = this.studentCode;
    data['studentImage'] = this.studentImage;
    data['stationId'] = this.stationId;
    data['stationName'] = this.stationName;
    data['stationImage'] = this.stationImage;
    data['stationAdress'] = this.stationAdress;
    data['stationPhone'] = this.stationPhone;
    data['stationOpeningHours'] = this.stationOpeningHours;
    data['stationClosingHours'] = this.stationClosingHours;
    data['amount'] = this.amount;
    data['dateCreated'] = this.dateCreated;
    data['description'] = this.description;
    data['state'] = this.state;
    data['status'] = this.status;
    data['currentStateId'] = this.currentStateId;
    data['currentState'] = this.currentState;
    data['currentStateName'] = this.currentStateName;
    data['orderDetails'] = this.orderDetails.map((v) => v.toJson()).toList();
    data['stateDetails'] = this.stateDetails.map((v) => v.toJson()).toList();
    return data;
  }
}
