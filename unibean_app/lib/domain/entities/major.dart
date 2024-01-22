import 'package:equatable/equatable.dart';

class Major extends Equatable {
  final String id;
  final String majorName;
  final String image;
  final String fileName;
  final String dateCreated;
  final String dateUpdated;
  final String description;
  final bool state;
  final bool status;

  Major(
      {required this.id,
      required this.majorName,
      required this.image,
      required this.fileName,
      required this.dateCreated,
      required this.dateUpdated,
      required this.description,
      required this.state,
      required this.status});

  @override
  List<Object?> get props => [
        id,
        majorName,
        image,
        fileName,
        dateCreated,
        dateUpdated,
        description,
        state,
        status
      ];
}
