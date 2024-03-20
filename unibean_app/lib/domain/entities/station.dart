import 'package:equatable/equatable.dart';

class Station extends Equatable {
  final String id;
  final String stationName;
  final String address;
  final String image;
  final String fileName;
  final String openingHours;
  final String closingHours;
  final String phone;
  final String email;
  final String dateCreated;
  final String dateUpdated;
  final String description;
  final int stateId;
  final String state;
  final String stateName;
  final bool status;

  Station(
      {required this.id,
      required this.stationName,
      required this.address,
      required this.image,
      required this.fileName,
      required this.openingHours,
      required this.closingHours,
      required this.phone,
      required this.email,
      required this.dateCreated,
      required this.dateUpdated,
      required this.description,
      required this.stateId,
      required this.state,
      required this.stateName,
      required this.status});

  @override
  List<Object?> get props => [
        this.id,
        this.stationName,
        this.address,
        this.image,
        this.fileName,
        this.openingHours,
        this.closingHours,
        this.phone,
        this.email,
        this.dateCreated,
        this.dateUpdated,
        this.description,
        this.stateId,
        this.state,
        this.stateName,
        this.status
      ];
}
