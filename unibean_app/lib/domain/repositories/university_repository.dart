import 'package:unibean_app/data/models.dart';

abstract class UniversityRepository {
  const UniversityRepository();

  Future<ApiResponse<List<UniversityModel>>?> fetchUnversities({int? page});
}
