import 'package:equatable/equatable.dart';

class ProductDetail extends Equatable {
  final String id;
  final String categoryId;
  final String categoryName;
  final String categoryImage;
  final String productName;
  final List<String> productImages;
  final double price;
  final double weight;
  final int quantity;
  final String dateCreated;
  final String dateUpdated;
  final String description;
  final bool state;
  final bool status;
  final int numOfSold;

  ProductDetail(
      {required this.id,
      required this.categoryId,
      required this.categoryName,
      required this.categoryImage,
      required this.productName,
      required this.productImages,
      required this.price,
      required this.weight,
      required this.quantity,
      required this.dateCreated,
      required this.dateUpdated,
      required this.description,
      required this.state,
      required this.status,
      required this.numOfSold});

  @override
  List<Object?> get props => [
        this.id,
        this.categoryId,
        this.categoryName,
        this.categoryImage,
        this.productName,
        this.productImages,
        this.price,
        this.weight,
        this.quantity,
        this.dateCreated,
        this.dateUpdated,
        this.description,
        this.state,
        this.status,
        this.numOfSold
      ];
}
