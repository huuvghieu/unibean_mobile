import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String categoryId;
  final String categoryName;
  final String productName;
  final String productImage;
  final double price;
  final double weight;
  final int quantity;
  final String dateCreated;
  final String dateUpdated;
  final String description;
  final bool state;
  final bool status;

  Product(
      {required this.id,
      required this.categoryId,
      required this.categoryName,
      required this.productName,
      required this.productImage,
      required this.price,
      required this.weight,
      required this.quantity,
      required this.dateCreated,
      required this.dateUpdated,
      required this.description,
      required this.state,
      required this.status});

  @override
  List<Object?> get props => [
        this.id,
        this.categoryId,
        this.categoryName,
        this.productName,
        this.productImage,
        this.price,
        this.weight,
        this.quantity,
        this.dateCreated,
        this.dateUpdated,
        this.description,
        this.state,
        this.status
      ];
}
