import 'package:unibean_app/data/models.dart';

abstract class AreaRepository {
  const AreaRepository();

  Future<ApiResponse<List<AreaModel>>?> fetchArea(
      {int? page, int? limit});
}
