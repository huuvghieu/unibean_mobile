import 'package:unibean_app/domain/entities.dart';

class BrandModel extends Brand {
  BrandModel(
      {required super.id,
      required super.accountId,
      required super.brandName,
      required super.acronym,
      required super.userName,
      required super.address,
      required super.logo,
      required super.logoFileName,
      required super.coverPhoto,
      required super.coverFileName,
      required super.email,
      required super.phone,
      required super.link,
      required super.openingHours,
      required super.closingHours,
      required super.totalIncome,
      required super.totalSpending,
      required super.dateCreated,
      required super.dateUpdated,
      required super.description,
      required super.state,
      required super.status,
      required super.isFavor,
      required super.numberOfFollowers,
      required super.greenWalletId,
      required super.greenWallet,
      required super.greenWalletName,
      required super.greenWalletBalance});

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'] ?? '',
      accountId: json['accountId'] ?? '',
      brandName: json['brandName'] ?? '',
      acronym: json['acronym'] ?? '',
      userName: json['userName'] ?? '',
      address: json['address'] ?? '',
      logo: json['logo'] ?? '',
      logoFileName: json['logoFileName'] ?? '',
      coverPhoto: json['coverPhoto'] ?? '',
      coverFileName: json['coverFileName'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      link: json['link'] ?? '',
      openingHours: json['openingHours'] ?? '',
      closingHours: json['closingHours'] ?? '',
      totalIncome: json['totalIncome'],
      totalSpending: json['totalSpending'],
      dateCreated: json['dateCreated'] ?? '',
      dateUpdated: json['dateUpdated'] ?? '',
      description: json['description'] ?? '',
      state: json['state'] ?? true,
      status: json['status'] ?? true,
      isFavor: json['isFavor'] ?? false,
      numberOfFollowers: json['numberOfFollwers'] ?? 0,
      greenWalletId: json['greenWalletId'] ?? '',
      greenWallet: json['greenWallet'],
      greenWalletName: json['greenWalletName'],
      greenWalletBalance: json['greenWalletBalance'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['accountId'] = this.accountId;
    data['brandName'] = this.brandName;
    data['acronym'] = this.acronym;
    data['userName'] = this.userName;
    data['address'] = this.address;
    data['logo'] = this.logo;
    data['logoFileName'] = this.logoFileName;
    data['coverPhoto'] = this.coverPhoto;
    data['coverFileName'] = this.coverFileName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['link'] = this.link;
    data['openingHours'] = this.openingHours;
    data['closingHours'] = this.closingHours;
    data['totalIncome'] = this.totalIncome;
    data['totalSpending'] = this.totalSpending;
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    data['description'] = this.description;
    data['state'] = this.state;
    data['status'] = this.status;
    data['isFavor'] = this.isFavor;
    data['numberOfFollwers'] = this.numberOfFollowers;
    data['greenWalletId'] = this.greenWalletId;
    data['greenWallet'] = this.greenWallet;
    data['greenWalletName'] = this.greenWalletName;
    data['greenWalletBalance'] = this.greenWalletBalance;
    return data;
  }

  BrandModel copyWith({
    String? id,
    String? accountId,
    String? brandName,
    String? acronym,
    String? userName,
    String? address,
    String? logo,
    String? logoFileName,
    String? coverPhoto,
    String? coverFileName,
    String? email,
    String? phone,
    String? link,
    String? openingHours,
    String? closingHours,
    double? totalIncome,
    double? totalSpending,
    String? dateCreated,
    String? dateUpdated,
    String? description,
    bool? state,
    bool? status,
    bool? isFavor,
    int? numberOfFollowers,
    int? greenWalletId,
    String? greenWallet,
    String? greenWalletName,
    double? greenWalletBalance,
  }) {
    return BrandModel(
        id: id ?? this.id,
        accountId: accountId ?? this.accountId,
        brandName: brandName ?? this.brandName,
        acronym: acronym ?? this.acronym,
        userName: userName ?? this.userName,
        address: address ?? this.address,
        logo: logo ?? this.logo,
        logoFileName: logoFileName ?? this.logoFileName,
        coverPhoto: coverPhoto ?? this.coverPhoto,
        coverFileName: coverFileName ?? this.coverFileName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        link: link ?? this.link,
        openingHours: openingHours ?? this.openingHours,
        closingHours: closingHours ?? this.closingHours,
        totalIncome: totalIncome ?? this.totalIncome,
        totalSpending: totalSpending ?? this.totalSpending,
        dateCreated: dateCreated ?? this.dateCreated,
        dateUpdated: dateUpdated ?? this.dateUpdated,
        description: description ?? this.description,
        state: state ?? this.state,
        status: status ?? this.status,
        isFavor: isFavor ?? this.isFavor,
        numberOfFollowers: numberOfFollowers ?? this.numberOfFollowers,
        greenWalletId: greenWalletId ?? this.greenWalletId,
        greenWallet: greenWallet ?? this.greenWallet,
        greenWalletName: greenWalletName ?? this.greenWalletName,
        greenWalletBalance: greenWalletBalance ?? this.greenWalletBalance);
  }
}
