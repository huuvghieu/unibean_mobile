import 'package:equatable/equatable.dart';

class CampaignVoucherStore extends Equatable {
  final String id;
  final String voucherId;
  final String voucherName;
  final String voucherImage;
  final String campaignId;
  final String campaignName;
  final double price;
  final double rate;
  final int quantity;
  final int fromIndex;
  final int toIndex;
  final String dateCreated;
  final String dateUpdated;
  final String description;
  final bool state;
  final bool status;
  final int quantityInStock;
  final int quantityInBought;
  final int quantityInUsed;

  CampaignVoucherStore(
      {required this.id,
      required this.voucherId,
      required this.voucherName,
      required this.voucherImage,
      required this.campaignId,
      required this.campaignName,
      required this.price,
      required this.rate,
      required this.quantity,
      required this.fromIndex,
      required this.toIndex,
      required this.dateCreated,
      required this.dateUpdated,
      required this.description,
      required this.state,
      required this.status,
      required this.quantityInStock,
      required this.quantityInBought,
      required this.quantityInUsed});

  @override
  List<Object?> get props => [
        this.id,
        this.voucherId,
        this.voucherName,
        this.voucherImage,
        this.campaignId,
        this.campaignName,
        this.price,
        this.rate,
        this.quantity,
        this.fromIndex,
        this.toIndex,
        this.dateCreated,
        this.dateUpdated,
        this.description,
        this.state,
        this.status,
        this.quantityInStock,
        this.quantityInBought,
        this.quantityInUsed
      ];
}
