import 'package:unibean_app/data/models.dart';

abstract class BrandRepository {
  const BrandRepository();

  Future<ApiResponse<List<BrandModel>>?> fecthBrands({int? page});
}
