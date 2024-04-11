import 'package:equatable/equatable.dart';

class StateOrderDetailModel extends Equatable {
  final String id;
  final String orderId;
  final int stateId;
  final String state;
  final String stateName;
  final String dateCreated;
  final String description;
  final bool status;

  StateOrderDetailModel(
      {required this.id,
      required this.orderId,
      required this.stateId,
      required this.state,
      required this.stateName,
      required this.dateCreated,
      required this.description,
      required this.status});

  factory StateOrderDetailModel.fromJson(Map<String, dynamic> json) {
    return StateOrderDetailModel(
      id: json['id'],
      orderId: json['orderId'],
      stateId: json['stateId'],
      state: json['state'],
      stateName: json['stateName'],
      dateCreated: json['dateCreated'],
      description: json['description'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['orderId'] = this.orderId;
    data['stateId'] = this.stateId;
    data['state'] = this.state;
    data['stateName'] = this.stateName;
    data['dateCreated'] = this.dateCreated;
    data['description'] = this.description;
    data['status'] = this.status;
    return data;
  }

  @override
  List<Object?> get props => [
        this.id,
        this.orderId,
        this.stateId,
        this.state,
        this.stateName,
        this.dateCreated,
        this.description,
        this.status
      ];
}
