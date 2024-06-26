import 'package:unibean_app/data/models.dart';

abstract class ProductRepository {
  ProductRepository();

  Future<ApiResponse<List<ProductModel>>?> fetchProducts(
      {int? page, int? limit, String? search});

  Future<ProductDetailModel?> fecthProductById({required String productId});
}
