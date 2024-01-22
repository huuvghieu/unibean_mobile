import 'package:unibean_app/data/models.dart';
import 'package:unibean_app/data/models/campus_model.dart';

abstract class CampusRepository {
  const CampusRepository();

  Future<ApiResponse<List<CampusModel>>?> fetchCampusByUniId(
      {int? page,required String uniId});
}
