import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Student extends Equatable {
  final String id;
  final String majorId;
  final String majorName;
  final String majorImage;
  final String universityId;
  final String universityName;
  final String universityImage;
  final String campusId;
  final String campusName;
  final String campusImage;
  final String accountId;
  String? userName;
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
  dynamic address;
  final double totalIncome;
  final double totalSpending;
  final String dateCreated;
  final String dateUpdated;
  final String dateVerified;
  final bool isVerify;
  final int stateId;
  final String state;
  final String stateName;
  final bool status;
  final int greenWalletId;
  final String greenWallet;
  final String greenWalletName;
  final double greenWalletBalance;
  final int redWalletId;
  final String redWallet;
  final String redWalletName;
  final double redWalletBalance;
  final int following;
  dynamic inviter;
  final int invitee;

  Student(
      {required this.id,
      required this.majorId,
      required this.majorName,
      required this.majorImage,
      required this.universityId,
      required this.universityName,
      required this.universityImage,
      required this.campusId,
      required this.campusName,
      required this.campusImage,
      required this.accountId,
      this.userName,
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
      this.address,
      required this.totalIncome,
      required this.totalSpending,
      required this.dateCreated,
      required this.dateUpdated,
      required this.dateVerified,
      required this.isVerify,
      required this.stateId,
      required this.state,
      required this.stateName,
      required this.status,
      required this.greenWalletId,
      required this.greenWallet,
      required this.greenWalletName,
      required this.greenWalletBalance,
      required this.redWalletId,
      required this.redWallet,
      required this.redWalletName,
      required this.redWalletBalance,
      required this.following,
      this.inviter,
      required this.invitee});

  @override
  List<Object?> get props => [
        this.id,
        this.majorId,
        this.majorName,
        this.majorImage,
        this.universityId,
        this.universityName,
        this.universityImage,
        this.campusId,
        this.campusName,
        this.campusImage,
        this.accountId,
        this.userName,
        this.studentCardFront,
        this.fileNameFront,
        this.studentCardBack,
        this.fileNameBack,
        this.fullName,
        this.code,
        this.gender,
        this.inviteCode,
        this.email,
        this.dateOfBirth,
        this.phone,
        this.avatar,
        this.imageName,
        this.address,
        this.totalIncome,
        this.totalSpending,
        this.dateCreated,
        this.dateUpdated,
        this.dateVerified,
        this.isVerify,
        this.stateId,
        this.state,
        this.stateName,
        this.status,
        this.greenWalletId,
        this.greenWallet,
        this.greenWalletName,
        this.greenWalletBalance,
        this.redWalletId,
        this.redWallet,
        this.redWalletName,
        this.redWalletBalance,
        this.following,
        this.inviter,
        this.invitee
      ];
}
