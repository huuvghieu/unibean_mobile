import 'package:unibean_app/domain/entities.dart';

class UniversityModel extends University {
  UniversityModel(
      {required super.id,
      required super.universityName,
      required super.phone,
      required super.email,
      required super.link,
      required super.image,
      required super.fileName,
      required super.dateCreated,
      required super.dateUpdated,
      required super.description,
      required super.state,
      required super.status});

  factory UniversityModel.fromJson(Map<String, dynamic> json) {
    return UniversityModel(
      id: json['id'],
      universityName: json['universityName'] ?? '',
      phone: json['phone']?? '',
      email: json['email']?? '',
      link: json['link']?? '',
      image: json['image']?? '',
      fileName: json['fileName']?? '',
      dateCreated: json['dateCreated']?? '',
      dateUpdated: json['dateUpdated']?? '',
      description: json['description']?? '',
      state: json['state'],
      status: json['status'],
    );
  }
}
