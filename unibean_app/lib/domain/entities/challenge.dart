import 'package:equatable/equatable.dart';

class Challenge extends Equatable {
  final String id;
  final int typeId;
  final String type;
  final String typeName;
  final String challengeName;
  final int amount;
  final int condition;
  final String image;
  final String fileName;
  final String dateCreated;
  final String dateUpdated;
  final String description;
  final bool state;
  final bool status;

  Challenge(
      {required this.id,
      required this.typeId,
      required this.type,
      required this.typeName,
      required this.challengeName,
      required this.amount,
      required this.condition,
      required this.image,
      required this.fileName,
      required this.dateCreated,
      required this.dateUpdated,
      required this.description,
      required this.state,
      required this.status});

  @override
  List<Object> get props => [
        this.id,
        this.typeId,
        this.type,
        this.typeName,
        this.challengeName,
        this.amount,
        this.condition,
        this.image,
        this.fileName,
        this.dateCreated,
        this.dateUpdated,
        this.description,
        this.state,
        this.status
      ];
}
