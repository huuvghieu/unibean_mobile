import 'package:unibean_app/data/models.dart';

abstract class ProductRepository {
  ProductRepository();

  Future<ApiResponse<List<ProductModel>>?> fetchProducts(
      {int? page, int? limit});

  Future<ProductDetailModel?> fecthProductById({required String productId});
}
