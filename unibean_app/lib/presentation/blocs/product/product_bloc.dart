import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:unibean_app/domain/repositories.dart';

import '../../../data/models.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  ProductBloc({required this.productRepository}) : super(ProductInitial()) {
    scrollController.addListener(() {
      add(LoadMoreProducts());
    });
    on<LoadProducts>(_onLoadProducts);
    on<LoadProductById>(_onLoadProductById);
    on<LoadMoreProducts>(_onLoadMoreProducts);
  }

  ScrollController scrollController = ScrollController();
  var isLoadingMore = false;
  int page = 1;
  Future<void> _onLoadProducts(
      LoadProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      var apiResponse = await productRepository.fetchProducts(
          page: event.page, limit: event.limit, search: event.search);
      if (apiResponse!.totalCount < apiResponse.pageSize) {
        emit(ProductsLoaded(products: apiResponse.result, hasReachedMax: true));
      } else {
        emit(ProductsLoaded(products: apiResponse.result));
      }
    } catch (e) {
      emit(ProductFailed(error: e.toString()));
    }
  }

  Future<void> _onLoadProductById(
      LoadProductById event, Emitter<ProductState> emit) async {
    emit(ProductByIdLoading());
    try {
      var productDetail =
          await productRepository.fecthProductById(productId: event.productId);
      if (productDetail != null) {
        emit(ProductByIdLoaded(productDetail: productDetail));
      } else {
        emit(ProductFailed(error: 'Failed'));
      }
    } catch (e) {
      emit(ProductFailed(error: e.toString()));
    }
  }

  Future<void> _onLoadMoreProducts(
      LoadMoreProducts event, Emitter<ProductState> emit) async {
    try {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if ((this.state as ProductsLoaded).hasReachedMax) {
          emit(ProductsLoaded(
              products: List.from((this.state as ProductsLoaded).products),
              hasReachedMax: true));
        } else {
          isLoadingMore = true;
          page++;
          var apiResponse = await productRepository.fetchProducts(
              page: page, limit: event.limit);
          if (apiResponse!.result.length == 0) {
            emit(ProductsLoaded(
                products: List.from((this.state as ProductsLoaded).products)
                  ..addAll(apiResponse.result),
                hasReachedMax: true));
            this.page = 1;
          } else {
            emit(ProductsLoaded(
                products: List.from((this.state as ProductsLoaded).products)
                  ..addAll(apiResponse.result)));
          }
        }
      }
    } catch (e) {
      emit(ProductFailed(error: e.toString()));
    }
  }
}
