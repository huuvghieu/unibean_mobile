import 'package:unibean_app/data/models.dart';

abstract class CampusRepository {
  const CampusRepository();

  Future<ApiResponse<List<CampusModel>>?> fetchCampusByUniId(
      {int? page, required String uniId});
}
