import 'package:unibean_app/domain/entities.dart';

class StudentRankingModel extends CampaignRanking {
  StudentRankingModel(
      {required super.rank,
      required super.name,
      required super.image,
      required super.value});

  factory StudentRankingModel.fromJson(Map<String, dynamic> json) {
    return StudentRankingModel(
      rank: json['rank'],
      name: json['name'],
      image: json['image'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rank'] = this.rank;
    data['name'] = this.name;
    data['image'] = this.image;
    data['value'] = this.value;
    return data;
  }
}
