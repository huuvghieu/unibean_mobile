import 'package:unibean_app/domain/entities.dart';

class StationModel extends Station {
  StationModel(
      {required super.id,
      required super.stationName,
      required super.address,
      required super.image,
      required super.fileName,
      required super.openingHours,
      required super.closingHours,
      required super.phone,
      required super.email,
      required super.dateCreated,
      required super.dateUpdated,
      required super.description,
      required super.stateId,
      required super.state,
      required super.stateName,
      required super.status});

  factory StationModel.fromJson(Map<String, dynamic> json) {
    return StationModel(
      id: json['id'],
      stationName: json['stationName'],
      address: json['address'],
      image: json['image'],
      fileName: json['fileName'],
      openingHours: json['openingHours'],
      closingHours: json['closingHours'],
      phone: json['phone'],
      email: json['email'],
      dateCreated: json['dateCreated'],
      dateUpdated: json['dateUpdated'],
      description: json['description'],
      stateId: json['stateId'],
      state: json['state'],
      stateName: json['stateName'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['stationName'] = this.stationName;
    data['address'] = this.address;
    data['image'] = this.image;
    data['fileName'] = this.fileName;
    data['openingHours'] = this.openingHours;
    data['closingHours'] = this.closingHours;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    data['description'] = this.description;
    data['stateId'] = this.stateId;
    data['state'] = this.state;
    data['stateName'] = this.stateName;
    data['status'] = this.status;
    return data;
  }
}
