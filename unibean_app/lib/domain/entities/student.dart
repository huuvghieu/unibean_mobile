import 'package:equatable/equatable.dart';

class Student extends Equatable {
  final String id;
  final String majorId;
  final String majorName;
  final String majorImage;
  final String campusId;
  final String campusName;
  final String campusImage;
  final String accountId;
  final String userName;
  final String studentCardFront;
  final String fileNameFront;
  final String studentCardBack;
  final String fileNameBack;
  final String fullName;
  final String code;
  final String gender;
  final String inviteCode;
  final String email;
  final String dateOfBirth;
  final String phone;
  final String avatar;
  final String imageName;
  final String address;
  final int totalIncome;
  final int totalSpending;
  final String dateCreated;
  final String dateUpdated;
  final String dateVerified;
  final bool isVerify;
  final bool state;
  final bool status;
  final int greenWallet;
  final String greenWalletImage;
  final int redWallet;
  final String redWalletImage;
  final int following;
  final String inviter;
  final int invitee;

  Student(
      {required this.id,
      required this.majorId,
      required this.majorName,
      required this.majorImage,
      required this.campusId,
      required this.campusName,
      required this.campusImage,
      required this.accountId,
      required this.userName,
      required this.studentCardFront,
      required this.fileNameFront,
      required this.studentCardBack,
      required this.fileNameBack,
      required this.fullName,
      required this.code,
      required this.gender,
      required this.inviteCode,
      required this.email,
      required this.dateOfBirth,
      required this.phone,
      required this.avatar,
      required this.imageName,
      this.address = '',
      required this.totalIncome,
      required this.totalSpending,
      required this.dateCreated,
      required this.dateUpdated,
      required this.dateVerified,
      required this.isVerify,
      required this.state,
      required this.status,
      required this.greenWallet,
      required this.greenWalletImage,
      required this.redWallet,
      required this.redWalletImage,
      required this.following,
      this.inviter = '',
      required this.invitee});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      majorId: json['majorId'],
      majorName: json['majorName'],
      majorImage: json['majorImage'],
      campusId: json['campusId'],
      campusName: json['campusName'],
      campusImage: json['campusImage'],
      accountId: json['accountId'],
      userName: json['userName'],
      studentCardFront: json['studentCardFront'],
      fileNameFront: json['fileNameFront'],
      studentCardBack: json['studentCardBack'],
      fileNameBack: json['fileNameBack'],
      fullName: json['fullName'],
      code: json['code'],
      gender: json['gender'],
      inviteCode: json['inviteCode'],
      email: json['email'],
      dateOfBirth: json['dateOfBirth'],
      phone: json['phone'],
      avatar: json['avatar'],
      imageName: json['imageName'],
      address: json['address'],
      totalIncome: json['totalIncome'],
      totalSpending: json['totalSpending'],
      dateCreated: json['dateCreated'],
      dateUpdated: json['dateUpdated'],
      dateVerified: json['dateVerified'],
      isVerify: json['isVerify'],
      state: json['state'],
      status: json['status'],
      greenWallet: json['greenWallet'],
      greenWalletImage: json['greenWalletImage'],
      redWallet: json['redWallet'],
      redWalletImage: json['redWalletImage'],
      following: json['following'],
      inviter: json['inviter'],
      invitee: json['invitee'],
    );
  }
  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['majorId'] = this.majorId;
    data['majorName'] = this.majorName;
    data['majorImage'] = this.majorImage;
    data['campusId'] = this.campusId;
    data['campusName'] = this.campusName;
    data['campusImage'] = this.campusImage;
    data['accountId'] = this.accountId;
    data['userName'] = this.userName;
    data['studentCardFront'] = this.studentCardFront;
    data['fileNameFront'] = this.fileNameFront;
    data['studentCardBack'] = this.studentCardBack;
    data['fileNameBack'] = this.fileNameBack;
    data['fullName'] = this.fullName;
    data['code'] = this.code;
    data['gender'] = this.gender;
    data['inviteCode'] = this.inviteCode;
    data['email'] = this.email;
    data['dateOfBirth'] = this.dateOfBirth;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    data['imageName'] = this.imageName;
    data['address'] = this.address;
    data['totalIncome'] = this.totalIncome;
    data['totalSpending'] = this.totalSpending;
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    data['dateVerified'] = this.dateVerified;
    data['isVerify'] = this.isVerify;
    data['state'] = this.state;
    data['status'] = this.status;
    data['greenWallet'] = this.greenWallet;
    data['greenWalletImage'] = this.greenWalletImage;
    data['redWallet'] = this.redWallet;
    data['redWalletImage'] = this.redWalletImage;
    data['following'] = this.following;
    data['inviter'] = this.inviter;
    data['invitee'] = this.invitee;
    return data;
  }

  @override
  List<Object?> get props => [];
}
