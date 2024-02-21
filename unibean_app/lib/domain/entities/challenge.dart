import 'package:equatable/equatable.dart';

class Challenge extends Equatable {
  final String id;
  final String challengeId;
  final String challengeTypeId;
  final String challengeType;
  final String challengeTypeName;
  final String challengeName;
  final String challengeImage;
  final String studentId;
  final String studentName;
  final double amount;
  final int current;
  final int condition;
  final bool isCompleted;
  final bool isClaimed;
  final String dateCreated;
  final String dateUpdated;
  final String description;
  final bool state;
  final bool status;

  Challenge(
      {required this.id,
      required this.challengeId,
      required this.challengeTypeId,
      required this.challengeType,
      required this.challengeTypeName,
      required this.challengeName,
      required this.challengeImage,
      required this.studentId,
      required this.studentName,
      required this.amount,
      required this.current,
      required this.condition,
      required this.isCompleted,
      required this.isClaimed,
      required this.dateCreated,
      required this.dateUpdated,
      required this.description,
      required this.state,
      required this.status});

  @override
  List<Object> get props => [
        this.id,
        this.challengeId,
        this.challengeTypeId,
        this.challengeType,
        this.challengeTypeName,
        this.challengeName,
        this.challengeImage,
        this.studentId,
        this.studentName,
        this.amount,
        this.current,
        this.condition,
        this.isCompleted,
        this.isClaimed,
        this.dateCreated,
        this.dateUpdated,
        this.description,
        this.state,
        this.status
      ];
}
