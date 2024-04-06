import 'package:equatable/equatable.dart';

class Bonus extends Equatable {
  final String id;
  final String brandId;
  final String brandName;
  final String storeId;
  final String storeName;
  final String studentId;
  final String studentName;
  final double amount;
  final String dateCreated;
  final String dateUpdated;
  final String description;
  final bool state;
  final bool status;

  Bonus(
      {required this.id,
      required this.brandId,
      required this.brandName,
      required this.storeId,
      required this.storeName,
      required this.studentId,
      required this.studentName,
      required this.amount,
      required this.dateCreated,
      required this.dateUpdated,
      required this.description,
      required this.state,
      required this.status});

  @override
  List<Object?> get props => [
        this.id,
        this.brandId,
        this.brandName,
        this.storeId,
        this.storeName,
        this.studentId,
        this.studentName,
        this.amount,
        this.dateCreated,
        this.dateUpdated,
        this.description,
        this.state,
        this.status
      ];
}
