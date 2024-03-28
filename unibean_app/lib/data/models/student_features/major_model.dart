import 'package:unibean_app/domain/entities/student_features/major.dart';

class MajorModel extends Major {
  MajorModel(
      {required super.id,
      required super.majorName,
      required super.image,
      required super.fileName,
      required super.dateCreated,
      required super.dateUpdated,
      required super.description,
      required super.state,
      required super.status});

  factory MajorModel.fromJson(Map<String, dynamic> json) {
    return MajorModel(
      id: json['id'],
      majorName: json['majorName'],
      image: json['image'] ?? '',
      fileName: json['fileName'] ?? '',
      dateCreated: json['dateCreated'],
      dateUpdated: json['dateUpdated'],
      description: json['description'] ?? '',
      state: json['state'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['majorName'] = this.majorName;
    data['image'] = this.image;
    data['fileName'] = this.fileName;
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    data['description'] = this.description;
    data['state'] = this.state;
    data['status'] = this.status;
    return data;
  }
}
