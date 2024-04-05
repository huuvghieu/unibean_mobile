import 'package:equatable/equatable.dart';

import '../../models.dart';

class Cart extends Equatable {
  final List<ProductDetailModel> products;

  const Cart({this.products = const <ProductDetailModel>[]});

  Map productQuantity(List<ProductDetailModel> products) {
    var quantity = Map();
    products.sort((a, b) => a.id.compareTo(b.id),);
    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });
    return quantity;
  }

  double get total =>
      products.fold(0, (total, current) => total + current.price);

  @override
  List<Object?> get props => [products];

    Cart copyWith({
    List<ProductDetailModel>? products,
  }) {
    return Cart(products: products ?? this.products);
  }
}
