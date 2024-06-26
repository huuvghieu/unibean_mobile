part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();
}

final class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}

final class ProductLoading extends ProductState {
  @override
  List<Object> get props => [];
}

final class ProductsLoaded extends ProductState {
  final List<ProductModel> products;
  final bool hasReachedMax;


  ProductsLoaded({required this.products, this.hasReachedMax = false});

  @override
  List<Object?> get props => [products, hasReachedMax];
}

final class ProductFailed extends ProductState {
  final String error;

  ProductFailed({required this.error});

  @override
  List<Object?> get props => [error];
}

final class ProductByIdLoading extends ProductState {
  @override
  List<Object> get props => [];
}

final class ProductByIdLoaded extends ProductState {
  final ProductDetailModel productDetail;

  ProductByIdLoaded({required this.productDetail});

  @override
  List<Object?> get props => [productDetail];
}
