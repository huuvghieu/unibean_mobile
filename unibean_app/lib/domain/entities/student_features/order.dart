import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String id;
  final String orderImage;
  final String studentId;
  final String studentName;
  final String studentCode;
  final String stationId;
  final String stationName;
  final double amount;
  final String dateCreated;
  final String description;
  final bool state;
  final bool status;
  final int currentStateId;
  final String currentState;
  final String currentStateName;

  Order(
      {required this.id,
      required this.orderImage,
      required this.studentId,
      required this.studentName,
      required this.studentCode,
      required this.stationId,
      required this.stationName,
      required this.amount,
      required this.dateCreated,
      required this.description,
      required this.state,
      required this.status,
      required this.currentStateId,
      required this.currentState,
      required this.currentStateName});

  @override
  List<Object?> get props => [
        this.id,
        this.orderImage,
        this.studentId,
        this.studentName,
        this.studentCode,
        this.stationId,
        this.stationName,
        this.amount,
        this.dateCreated,
        this.description,
        this.state,
        this.status,
        this.currentStateId,
        this.currentState,
        this.currentStateName
      ];
}
