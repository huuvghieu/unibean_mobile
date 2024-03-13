import 'package:unibean_app/domain/entities.dart';

class ProductModel extends Product {
  ProductModel(
      {required super.id,
      required super.categoryId,
      required super.categoryName,
      required super.productName,
      required super.productImage,
      required super.price,
      required super.weight,
      required super.quantity,
      required super.dateCreated,
      required super.dateUpdated,
      required super.description,
      required super.state,
      required super.status});
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      categoryId: json['categoryId'],
      categoryName: json['categoryName'],
      productName: json['productName'],
      productImage: json['productImage'],
      price: json['price'],
      weight: json['weight'],
      quantity: json['quantity'],
      dateCreated: json['dateCreated'],
      dateUpdated: json['dateUpdated'],
      description: json['description'],
      state: json['state'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryId'] = this.categoryId;
    data['categoryName'] = this.categoryName;
    data['productName'] = this.productName;
    data['productImage'] = this.productImage;
    data['price'] = this.price;
    data['weight'] = this.weight;
    data['quantity'] = this.quantity;
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    data['description'] = this.description;
    data['state'] = this.state;
    data['status'] = this.status;
    return data;
  }
}
