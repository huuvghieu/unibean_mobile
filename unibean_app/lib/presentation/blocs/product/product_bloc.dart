import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unibean_app/domain/repositories.dart';

import '../../../data/models.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  ProductBloc({required this.productRepository}) : super(ProductInitial()) {
    on<LoadProducts>(_onLoadProducts);
  }

  Future<void> _onLoadProducts(
      LoadProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      var apiResponse = await productRepository.fetchProducts();
      emit(ProductsLoaded(products: apiResponse!.result));
    } catch (e) {
      emit(ProductFailed(error: e.toString()));
    }
  }
}
