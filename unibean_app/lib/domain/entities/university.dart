import 'package:equatable/equatable.dart';

class University extends Equatable {
  final String id;
  final String universityName;
  final String phone;
  final String email;
  final String link;
  final String image;
  final String fileName;
  final String dateCreated;
  final String dateUpdated;
  final String description;
  final bool state;
  final bool status;

  University(
      {required this.id,
      required this.universityName,
      required this.phone,
      required this.email,
      required this.link,
      required this.image,
      required this.fileName,
      required this.dateCreated,
      required this.dateUpdated,
      required this.description,
      required this.state,
      required this.status});

  @override
  List<Object?> get props => [
        this.id,
        this.universityName,
        this.phone,
        this.email,
        this.link,
        this.image,
        this.fileName,
        this.dateCreated,
        this.dateUpdated,
        this.description,
        this.state,
        this.status
      ];
}
