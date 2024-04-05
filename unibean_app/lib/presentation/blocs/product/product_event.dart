part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();
}

final class LoadProducts extends ProductEvent {
  final int page;
  final int limit;
  final String search;

  LoadProducts({this.page = 1, this.limit = 5, this.search = ''});

  @override
  List<Object?> get props => [page, limit, search];
}

final class LoadProductById extends ProductEvent {
  final String productId;

  LoadProductById({required this.productId});

  @override
  List<Object?> get props => [productId];
}

final class LoadMoreProducts extends ProductEvent {
  final int page;
  final int limit;

  LoadMoreProducts({this.page = 1, this.limit = 5});
  @override
  List<Object?> get props => [page, limit];
}
