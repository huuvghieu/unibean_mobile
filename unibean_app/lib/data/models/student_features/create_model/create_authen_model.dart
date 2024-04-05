class CreateAuthenModel {
  String? userName;
  String? password;
  String? passwordConfirmed;
  String? majorId;
  String? campusId;
  String? fullName;
  int? gender;
  String? code;
  String? inviteCode;
  String? studentFrontCard;
  String? studentBackCard;
  String? email;
  String? dateofBirth;
  String? phoneNumber;
  String? address;
  String? description;
  bool? state;

  CreateAuthenModel(
      {this.userName,
      this.password,
      this.passwordConfirmed,
      this.majorId,
      this.campusId,
      this.fullName,
      this.gender,
      this.code,
      this.inviteCode,
      this.studentFrontCard,
      this.studentBackCard,
      this.email,
      this.dateofBirth,
      this.phoneNumber,
      this.address,
      this.description,
      this.state});

  factory CreateAuthenModel.fromJson(Map<String, dynamic> json) {
    return CreateAuthenModel(
      userName: json['userName'],
      password: json['password'],
      passwordConfirmed: json['passwordConfirmed'],
      majorId: json['majorId'],
      campusId: json['campusId'],
      fullName: json['fullName'],
      studentFrontCard: json['studentFrontCard'],
      studentBackCard: json['studentBackCard'],
      gender: json['gender'],
      code: json['code'],
      inviteCode: json['inviteCode'],
      email: json['email'],
      dateofBirth: json['dateofBirth'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['password'] = this.password;
    data['passwordConfirmed'] = this.passwordConfirmed;
    data['majorId'] = this.majorId;
    data['campusId'] = this.campusId;
    data['phoneNumber'] = this.phoneNumber;
    data['code'] = this.code;
    data['dateofBirth'] = this.dateofBirth;
    data['inviteCode'] = this.inviteCode;
    data['studentFrontCard'] = this.studentFrontCard;
    data['studentBackCard'] = this.studentBackCard;
    data['fullName'] = this.fullName;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['description'] = this.description;
    data['address'] = this.address;
    data['state'] = this.state;
    return data;
  }
}
