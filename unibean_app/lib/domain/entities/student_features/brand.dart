import 'package:equatable/equatable.dart';

class Brand extends Equatable {
  final String id;
  final String accountId;
  final String brandName;
  final String acronym;
  final String userName;
  final String address;
  final String logo;
  final String logoFileName;
  final String coverPhoto;
  final String coverFileName;
  final String email;
  final String phone;
  final String link;
  final String openingHours;
  final String closingHours;
  final double totalIncome;
  final double totalSpending;
  final String dateCreated;
  final String dateUpdated;
  final String description;
  final bool state;
  final bool status;
  final bool isFavor;
  final int numberOfFollowers;
  final int numberOfCampaigns;
  final int greenWalletId;
  final String greenWallet;
  final String greenWalletName;
  final double greenWalletBalance;

  Brand(
      {required this.id,
      required this.accountId,
      required this.brandName,
      required this.acronym,
      required this.userName,
      required this.address,
      required this.logo,
      required this.logoFileName,
      required this.coverPhoto,
      required this.coverFileName,
      required this.email,
      required this.phone,
      required this.link,
      required this.openingHours,
      required this.closingHours,
      required this.totalIncome,
      required this.totalSpending,
      required this.dateCreated,
      required this.dateUpdated,
      required this.description,
      required this.state,
      required this.status,
      required this.isFavor,
      required this.numberOfFollowers,
      required this.numberOfCampaigns,
      required this.greenWalletId,
      required this.greenWallet,
      required this.greenWalletName,
      required this.greenWalletBalance});

  @override
  List<Object?> get props => [
        this.id,
        this.accountId,
        this.brandName,
        this.acronym,
        this.userName,
        this.address,
        this.logo,
        this.logoFileName,
        this.coverPhoto,
        this.coverFileName,
        this.email,
        this.phone,
        this.link,
        this.openingHours,
        this.closingHours,
        this.totalIncome,
        this.totalSpending,
        this.dateCreated,
        this.dateUpdated,
        this.description,
        this.state,
        this.status,
        this.isFavor,
        this.numberOfFollowers,
        this.numberOfCampaigns,
        this.greenWalletId,
        this.greenWallet,
        this.greenWalletName,
        this.greenWalletBalance
      ];
}
