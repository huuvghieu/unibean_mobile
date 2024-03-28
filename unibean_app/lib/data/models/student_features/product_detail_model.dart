import 'package:unibean_app/domain/entities.dart';

class ProductDetailModel extends ProductDetail {
  ProductDetailModel(
      {required super.id,
      required super.categoryId,
      required super.categoryName,
      required super.categoryImage,
      required super.productName,
      required super.productImages,
      required super.price,
      required super.weight,
      required super.quantity,
      required super.dateCreated,
      required super.dateUpdated,
      required super.description,
      required super.state,
      required super.status,
      required super.numOfSold});

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) {
    var productImages = (json['productImages'] as List<dynamic>)
        .map((item) => item as String)
        .toList();
    return ProductDetailModel(
      id: json['id'],
      categoryId: json['categoryId'],
      categoryName: json['categoryName'],
      categoryImage: json['categoryImage'],
      productName: json['productName'],
      productImages: productImages,
      price: json['price'],
      weight: json['weight'],
      quantity: json['quantity'],
      dateCreated: json['dateCreated'],
      dateUpdated: json['dateUpdated'],
      description: json['description'],
      state: json['state'],
      status: json['status'],
      numOfSold: json['numOfSold'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryId'] = this.categoryId;
    data['categoryName'] = this.categoryName;
    data['categoryImage'] = this.categoryImage;
    data['productName'] = this.productName;
    data['productImages'] = this.productImages;
    data['price'] = this.price;
    data['weight'] = this.weight;
    data['quantity'] = this.quantity;
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    data['description'] = this.description;
    data['state'] = this.state;
    data['status'] = this.status;
    data['numOfSold'] = this.numOfSold;
    return data;
  }
}
